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


public type SentimentResponse record {
    DocumentSentiment documentSentiment;
    string language;
    Sentence[] sentences;
};

//public type Sentences record {
//   Sentence[] sentences;
//};


//   "documentSentiment": {
//     "magnitude": 0.4,
//     "score": -0.4
//   },
public type DocumentSentiment record {
    float magnitude;
    float score;
};

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
public type Sentence record {
    Text text;
    Sentiment sentiment;
};

//       "sentiment": {
//         "magnitude": 0.4,
//         "score": -0.4
//       }
public type Sentiment record {
    float magnitude = 0.0;
    float score = 0.0;
};

//       "text": {
//         "content": "Sam was charged with murder.",
//         "beginOffset": 0
//       },
public type Text record {
    string content;
    int beginOffset;
};

