import ballerina/http;

final string url = BASE_URL + ANALYZE_SENTIMENT_URL;


public type Client client object {
    public http:Client googleApiClient;

    public function __init(GoogleAPIConfig googleApiConfig) {
        self.init(googleApiConfig);
        self.googleApiClient = new(BASE_URL, googleApiConfig);
    }

    # Initialize GoogleAPI endpoint.
    #
    # + googleApiConfig - GoogleAPI Configuration
    public function init(GoogleAPIConfig googleApiConfig);

    public function getSentiment(string text);
};


function Client.getSentiment(string text) {

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