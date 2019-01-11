Conncects Ballerina to Google Cloud Natural Language API

# Ballerina Connector for [Google Cloud Natural Language API](https://cloud.google.com/natural-language/)


* Use Google's powerful natural language models directly from Ballerina

## Compatibility
|                    |    Version     |  
|:------------------:|:--------------:|
| Ballerina Language | 0.990.2         |
| Google APIs          | v1             |

## Sample

First, import `menuka94/google_natural_language_v1`

Instantiate the connector by giving authentication details in the HTTP client config, which has built-in support for BasicAuth and OAuth 2.0. Gmail uses OAuth 2.0 to authenticate and authorize requests. The Gmail connector can be minimally instantiated in the HTTP client config using the access token or using the client ID, client secret, and refresh token.

**Obtaining OAuth 2.0 Tokens **

1. Visit [Google API Console](https://console.developers.google.com), click **Create Project**, and follow the wizard to create a new project.
2. Go to **Credentials -> OAuth consent screen**, enter a product name to be shown to users, and click **Save**.
3. On the **Credentials** tab, click **Create credentials** and select **OAuth client ID**. 
4. Select an application type, enter a name for the application, and specify a redirect URI (enter https://developers.google.com/oauthplayground if you want to use 
[OAuth 2.0 playground](https://developers.google.com/oauthplayground) to receive the authorization code and obtain the 
access token and refresh token). 
5. Click **Create**. Your client ID and client secret appear. 
6. In a separate browser window or tab, visit [OAuth 2.0 playground](https://developers.google.com/oauthplayground). Click on the `OAuth 2.0 configuration`
 icon in the top right corner and click on `Use your own OAuth credentials` and provide your `OAuth Client ID` and `OAuth Client secret`.
7. Select the required Gmail API scopes from the list of API's, and then click **Authorize APIs**.
8. When you receive your authorization code, click **Exchange authorization code for tokens** to obtain the refresh token and access token.

You can now enter the credentials in the HTTP client config. 
```ballerina
google_natural_language:GoogleAPIConfig googleApiConfig = {
    clientConfig: {
        auth: {
            scheme: http:OAUTH2,
            accessToken: testAccessToken,
            clientId: testClientId,
            clientSecret: testClientSecret,
            refreshToken: testRefreshToken
        }
    }
};

google_natural_language:Client googleApiClient = new(googleApiConfig);
```

## Sentiment Analysis - Example 1

```ballerina
    string text1 = "It is fun and easy to do sentiment analysis";
    var sentimentResponse1 = googleApiClient->getSentimentResponsePayload(text1);
    io:println(sentimentResponse1);
```

Output:
```json
{
  "documentSentiment": {
    "magnitude": 0.9,
    "score": 0.9
  },
  "language": "en",
  "sentences": [
    {
      "text": {
        "content": "It is fun and easy to do sentiment analysis",
        "beginOffset": 0
      },
      "sentiment": {
        "magnitude": 0.9,
        "score": 0.9
      }
    }
  ]
}
```

## Sentiment Analysis - Example 2

```ballerina
    string text2 = "I don't like reading tweets";
    var sentimentResponse2 = googleApiClient->getSentimentResponsePayload(text2);
    io:println(sentimentResponse2);
```

Output:

```json
{
  "documentSentiment": {
    "magnitude": 0.5,
    "score": -0.5
  },
  "language": "en",
  "sentences": [
    {
      "text": {
        "content": "I don't like Pizza!",
        "beginOffset": 0
      },
      "sentiment": {
        "magnitude": 0.5,
        "score": -0.5
      }
    }
  ]
}
```

