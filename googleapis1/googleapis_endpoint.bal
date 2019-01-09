import ballerina/http;
import ballerina/io;

final string url = BASE_URL + ANALYZE_SENTIMENT_URL;


public type Client client object {
    public http:Client googleApiClient;

    public function __init(GoogleAPIConfig googleApiConfig) {
        self.init(googleApiConfig);
        self.googleApiClient = new(BASE_URL, config = googleApiConfig.clientConfig );
    }

    # Initialize GoogleAPI endpoint.
    #
    # + googleApiConfig - GoogleAPI Configuration
    public function init(GoogleAPIConfig googleApiConfig);

    public remote function getSentiment(string text);
};


remote function Client.getSentiment(string text) {

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