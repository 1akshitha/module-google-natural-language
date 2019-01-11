#### Running google_natural_language tests
In order to run the tests, the user will need to have a Gmail account and configure the `ballerina.conf` configuration
file with the obtained tokens and other parameters.

###### ballerina.conf
```ballerina.conf
//Give the credentials and tokens for the authorized user
ACCESS_TOKEN="Your access token"
CLIENT_ID="Your client id"
CLIENT_SECRET="Your client secret"
REFRESH_TOKEN="Your refresh token"

```
Run tests :
```

ballerina init
ballerina test google_natural_language_v1 --config ballerina.conf