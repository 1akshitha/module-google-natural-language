import ballerina/http;
import ballerina/log;


final string url = "https://language.googleapis.com/v1";

final string CLIENT_ID = "880218952141-ijug2o3ofeichbhnr7bj63tajvbb4qdj.apps.googleusercontent.com";
final string CLIENT_SECRET = "RByTuKS74-xb7Jo8_AWs-LDV";
final string ACCESS_TOKEN = "ya29.GluMBhcSmeiRp5HosTM4Ry7HhnahALnMQ_IbEtawvMkkMCTilXFlBymQzCtORyfOny6hzsC_KqV2DFovVNTeD__MGIB9bAY23M507sVs21ZVxESAspW4vRgwAHmT";
final string REFRESH_TOKEN = "1/_NNneGMC-eKTExgp1OboGZTeEWFMIozbxcgPUtNA2UE";

http:Client httpEndpoint = new(url, config = {
        auth: {
            scheme: http:OAUTH2,
            accessToken: ACCESS_TOKEN,
            clientId: CLIENT_ID,
            clientSecret: CLIENT_SECRET,
            refreshToken: REFRESH_TOKEN,
            refreshUrl: "https://www.googleapis.com/oauth2/v4/token"
        }
    });

public function main() {
    http:Request req = new;

    json jsonPayload = {
        document: {
            "type": "PLAIN_TEXT",
            "content": "Sam was charged with a crime"
        },
        encodingType: "UTF8"
    };

    string payload = jsonPayload.toString();

    req.addHeader("Content-Type", "application/json");
    req.setPayload(payload);
    var response = httpEndpoint->post("/documents:analyzeSentiment", req);
    if (response is http:Response) {
        var result = response.getPayloadAsString();
        log:printInfo((result is error) ? "Failed to retrieve payload."
                                        : result);
    } else {
        log:printError("Failed to call the endpoint.", err = response);
    }
}
