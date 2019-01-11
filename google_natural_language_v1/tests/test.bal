import ballerina/io;
import ballerina/http;
import ballerina/log;
import ballerina/test;


// Create an endpoint to use the GoogleAPI Connector
GoogleAPIConfig googleApiConfig = {
    clientConfig: {
        auth: {
            scheme: http:OAUTH2,
            accessToken: config:getAsString("ACCESS_TOKEN"),
            clientId: config:getAsString("CLIENT_ID"),
            clientSecret: config:getAsString("CLIENT_SECRET"),
            refreshToken: config:getAsString("REFRESH_TOKEN")
            // these values are read from the file `Balleria.conf`
        }
    }
};

Client googleApiClient = new(googleApiConfig);

@test:Config
function testAssertGetSentimentResponsePayload() {
    string text = "I do not like Pizza!";
    DocumentSentiment documentSentiment = check googleApiClient->getDocumentSentiment(text);
    test:assertTrue((documentSentiment.score < 0), "Assertion Failed!");
}

