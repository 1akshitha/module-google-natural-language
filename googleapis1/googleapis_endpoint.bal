import ballerina/http;
import ballerina/io;


public type Client client object {
    public http:Client googleApiClient;

    public function __init(GoogleAPIConfig googleApiConfig) {
        self.init(googleApiConfig);
        self.googleApiClient = new(BASE_URL, config = googleApiConfig.clientConfig);
    }

    # Initialize GoogleAPI endpoint.
    #
    # + googleApiConfig - GoogleAPI Configuration
    public function init(GoogleAPIConfig googleApiConfig);

    public remote function getSentimentResponsePayload(string text) returns json|error;

    public remote function getDocumentSentiment(string text) returns json|error;
};

//curl -X POST \
//     -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) \
//     -H "Content-Type: application/json; charset=utf-8" \
//     --data "{
//  'document':{
//    'type':'PLAIN_TEXT',
//    'content':'Michelangelo Caravaggio, Italian painter, is known for
//              \'The Calling of Saint Matthew\'.'
//  },
//  'encodingType':'UTF8'
//}" "https://language.googleapis.com/v1/documents:analyzeEntities"

remote function Client.getSentimentResponsePayload(string text) returns json|error {
    json jsonBody = {
        document: {
            "type": "PLAIN_TEXT",
            "content": text
        },
        encodingType: "UTF8"
    };

    string body = jsonBody.toString();

    http:Request request = new;
    request.setHeader(CONTENT_TYPE, APPLICATION_JSON);
    request.setPayload(body);

    http:Response|error httpResponse = self.googleApiClient->post(ANALYZE_SENTIMENT_URL, request);

    if(httpResponse is http:Response) {
        return httpResponse.getJsonPayload();
    }else{
        return httpResponse;
    }
}

remote function Client.getDocumentSentiment(string text) returns json|error {
    return null;
}

function Client.init(GoogleAPIConfig googleApiConfig) {
    http:AuthConfig? authConfig = googleApiConfig.clientConfig.auth;
    if (authConfig is http:AuthConfig) {
        authConfig.refreshUrl = REFRESH_TOKEN_EP;
        authConfig.scheme = http:OAUTH2;
    }
}

# Object for GoogleAPI Configuration
#
# + clientConfig - The http client endpoint
public type GoogleAPIConfig record {
    http:ClientEndpointConfig clientConfig;
};