import ballerina/io;
import ballerina/http;
import ballerina/system;

//final string CLIENT_ID = "880218952141-ijug2o3ofeichbhnr7bj63tajvbb4qdj.apps.googleusercontent.com";
//final string CLIENT_SECRET = "RByTuKS74-xb7Jo8_AWs-LDV";
//final string ACCESS_TOKEN =
//"ya29.GluMBhcSmeiRp5HosTM4Ry7HhnahALnMQ_IbEtawvMkkMCTilXFlBymQzCtORyfOny6hzsC_KqV2DFovVNTeD__MGIB9bAY23M507sVs21ZVxESAspW4vRgwAHmT"
//;
//final string REFRESH_TOKEN = "1/_NNneGMC-eKTExgp1OboGZTeEWFMIozbxcgPUtNA2UE";

GoogleAPIConfig googleApiConfig_ = {
    clientConfig: {
        auth: {
            scheme: http:OAUTH2,
            accessToken: ACCESS_TOKEN,
            clientId: CLIENT_ID,
            clientSecret: CLIENT_SECRET,
            refreshToken: REFRESH_TOKEN
        }
    }
};

Client googleApiClient_ = new(googleApiConfig_);

type Data record {
    string name;
};

public function main() {
    string text1 = "It is fun and easy to do sentiment analysis";
    var sentimentResponse1 = googleApiClient_->getSentimentResponsePayload(text1);
    io:println(sentimentResponse1);

    string text2 = "I don't like Pizza!";
    var sentimentResponse2 = googleApiClient_->getSentimentResponsePayload(text2);
    io:println(sentimentResponse2);
}