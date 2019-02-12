import ballerina/io;
import ballerina/http;
import ballerina/log;
import ballerina/test;
import ballerina/config;


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
    var documentSentiment =  googleApiClient->getDocumentSentiment(text);
    if (documentSentiment is DocumentSentiment) {
        test:assertTrue((documentSentiment.score < 0), msg = "Assertion Failed!");
    } else {

    }
    //test:assertTrue((documentSentiment.score < 0), msg ="Assertion Failed!");
}

