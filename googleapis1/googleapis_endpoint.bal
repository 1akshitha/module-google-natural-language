import ballerina/http;
import ballerina/io;

final string url = BASE_URL + ANALYZE_SENTIMENT_URL;


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

    public remote function getSentiment(string text) returns http:Response|error;
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


remote function Client.getSentiment(string text) returns http:Response|error {
    string body = "'document':{
                    'type':'PLAIN_TEXT',
                    'content':'Michelangelo Caravaggio, Italian painter, is known for
                        \'The Calling of Saint Matthew\'.Matthew'";

    http:Request request = new;
    request.setPayload(body);

    http:Response|error httpResponse = self.googleApiClient->post(url, request);

    return httpResponse;
}

function Client.init(GoogleAPIConfig googleApiConfig) {
    io:println("Client.init() executed");
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