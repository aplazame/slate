# ![shell](http://aplazame.com/static/img/docs/shell.gif) Errors

> 400 Bad Request

```json
{
  "error": {
    "fields": {
      "articles": [
        "This field is required."
      ]
    }, 
    "message": "API validation error", 
    "type": "ApiValidationException"
  }
}
```


> 401 Unauthorized

```json
{
  "error": {
    "message": "Authentication credentials were not provided.", 
    "type": "UnauthorizedException"
  }
}
```


> 404 Not Found

```json
{
  "error": {
    "fields": {
      "order__mid": "145000006"
    }, 
    "message": "Object not found", 
    "type": "ObjectNotFoundException"
  }
}
```

We show below a list of the error codes returned by the API and the status codes in the response and the reason why your request is not correct.


Code | Error | Meaning
---- | ----- | -------
400 | Bad Request | If the data have not been correctly validated
401 | Unauthorized | If the token is not found in the request or it is wrong
403 | Forbidden | If you do not have permission to do this operation
404 | Not Found | If the object or the resource is not found
405 | Method Not Allowed | You tried to access with an invalid method
406 | Not Acceptable | You requested a format that is not valid
420 | Too Many Requests | If multiple simultaneous requests are made. Slown down!
500 | Internal Server Error | Houston, we have a problem. Try again later.
503 | Service Unavailable | We're temporarially offline for maintanance. Please try again later.
