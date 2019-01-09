// {
//   "documentSentiment": {
//     "magnitude": 0.4,
//     "score": -0.4
//   },
//   "language": "en",
//   "sentences": [
//     {
//       "text": {
//         "content": "Sam was charged with murder.",
//         "beginOffset": 0
//       },
//       "sentiment": {
//         "magnitude": 0.4,
//         "score": -0.4
//       }
//     }
//   ]
// }


//'document':{
//    'type':'PLAIN_TEXT',
//    'content':'Michelangelo Caravaggio, Italian painter, is known for
//              \'The Calling of Saint Matthew\'.Matthew'
public type SentimentRequest record {

};

public type Document record {
   string adsf = PLAIN_TEXT;
};


public type SentimentResponse record {
    DocumentSentiment documentSentiment = {};
    string language = "en";
    Sentences sentences = {};
};

public type DocumentSentiment record {
    float magnitude = 0.0;
    float score = 0.0;
};

public type Sentences record {
    Sentence[] sentences = [];
};

public type Sentence record {
    Text text = {};
    Sentiment sentiment = {};
};

public type Sentiment record {
    float magnitude = 0.0;
    float score = 0.0;
};

public type Text record {
    string content = "";
    int beginOffset = 0;
};

