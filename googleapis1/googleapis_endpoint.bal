import ballerina/http;

final string url = "https://language.googleapis.com/v1/documents:analyzeSentiment";


public type Client client object {
    public http:Client gmailClient;

    public function __init(){
            http:Client clientEndpoint = new(url);
    }
}