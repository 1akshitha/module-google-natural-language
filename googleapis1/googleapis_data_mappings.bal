import ballerina/log;
import ballerina/http;
import ballerina/io;


final json jsonExampleResponse = {
    documentSentiment: {
        magnitude: 0.4,
        score: -0.2
    },
    language: "en",
    sentences: [
        {
            text: {
                content: "Sam is charged for a crime.",
                beginOffset: 0
            },
            sentiment: {
                magnitude: 0.4,
                score: -0.4
            }
        },
        {
            text: {
                content: "John was let go by the commanding officer.",
                beginOffset: 28
            },
            sentiment: {
                magnitude: 0,
                score: 0
            }
        }
    ]
};

function convertJSONToSentimentResponseType(json jsonPayload) returns SentimentResponse|error {
    SentimentResponse sentimentResponse = new;

    DocumentSentiment documentSentiment = check DocumentSentiment.convert(jsonPayload.documentSentiment);
    sentimentResponse.documentSentiment = documentSentiment;
    sentimentResponse.language = jsonPayload.language;

    //Person[] personArray = [p, p2];
    //anydata[] e =   anydata[].convert(personArray);
    //json[] j =   check json[].convert(e);

    json[] jsonSentences = jsonPayload.sentences;

    Sentence[] sentences = new;

    foreach var jsonSentence in jsonSentences {
        Sentence sentence = check Sentence.convert(jsonSentence);
    }

    return sentimentResponse;
}