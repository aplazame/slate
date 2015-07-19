# Making Requests

## Headers
* **Authorization**: oauth2 Bearer Token published as [RFC 6750](http://tools.ietf.org/html/rfc6750)
* **Accept**: to specify certain media types which are acceptable for the response.


## Authentication

```http
GET /orders HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
from aplazame_sdk import Client

client = Client('access_token', ctype='json', version='1')
response = client.orders()
```

[Oauth2](http://en.wikipedia.org/wiki/OAuth) open standard for authorization.

The OAuth 2.0 Framework was published as [RFC 6749](http://tools.ietf.org/html/rfc6749)

OAuth2 is more simple to work with than OAuth1, and provides much better security.


## Versioning

```http
GET /orders HTTP/1.1
Accept: application/vnd.aplazame.v2+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v2+json
```

```http
GET /orders HTTP/1.1
Accept: application/vnd.aplazame.v1+xml
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+xml
```

```http
GET /orders HTTP/1.1
Accept: application/vnd.aplazame.v1+yaml
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+yaml
```

```shell
$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v2+json" \
    -H "Authorization: Bearer ->AccessToken<-"

$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v1+xml" \
    -H "Authorization: Bearer ->AccessToken<-"

$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v1+yaml" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
from aplazame_sdk import Client

client = Client('access_token', version='2')

client = Client('access_token', ctype='xml')
client = Client('access_token', ctype='yaml')
```

Although we currently allow for versioned URL, as for example `https://api.aplazame.com/v1/orders`, we consider it a better practice the use of the header `Accept` in the request to specify the type and format of the API service response.

Thus we allow the following types of header

* Accept: application/vnd.aplazame-**v1**+**json**
* Accept: application/vnd.aplazame-**v1**+**xml**
* Accept: application/vnd.aplazame-**v1**+**yaml**

If you do not specify any version by header or by URL, the latest version of the API will be activated. Since a new version of API can deprecate certain fields, this type of practice is not recommended.

<aside class="notice">
The latest API version is v1.
</aside>


## Sandbox

```http
GET /orders HTTP/1.1
Accept: application/vnd.aplazame.sandbox.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.sandbox.v1+json
```

```shell
$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.sandbox.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
from aplazame_sdk import Client

client = Client('access_token', sandbox=True)
response = client.orders()
```


Aplazame has a sandbox mode for your unit tests. If you want to make a request in sandbox mode, it must be specified in the `Accept` header just before the Api version.

* Accept (sandbox): application/vnd.aplazame.**sandbox**-v1+json
* Accept (production): application/vnd.aplazame.v1+json


## Decimals

```shell
$ if ((`bc <<< "12.50!=1250"`)); then echo "muUUuuUuu"; fi
```

```python
assert(12.50 != 1250)
```

All amounts related to taxes, discounts and prices will be formatted as an integer including two decimals. For example, if an item has a price of *12.50* should be formatted as an integer *1250*.


## Pagination

```http
GET /orders?page=2 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "cursor": {
    "after": 3,
    "before": 1
  },
  "paging": {
    "count": 314,
    "next": "https://api.aplazame.com/orders?page=3",
    "previous": "https://api.aplazame.com/orders?page=1"
  },
  "results": []
}
```

```shell
$ curl "https://api.aplazame.com/orders?page=2" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.orders(page=2)
```

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | The queryset.


### Cursor

Parameter | Type | Description
--------- | ---- | -----------
after | integer | This is the cursor that points to the end of the page of data that has been returned.
before | integer | This is the cursor that points to the start of the page of data that has been returned.


### Paging

Parameter | Type | Description
--------- | ---- | -----------
count | integer | The number of elements found.
next | url | The API endpoint that will return the next page of data.
previous | url | The API endpoint that will return the previous page of data.


## Squema

```http
GET /orders/squema HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "name": "Order Queryset",
  "description": "Order list rest service",
  "renders": [
      "application/json",
      "application/javascript",
      "application/yaml",
      "application/xml",
      "text/html"
  ],
  "parses": [
      "application/json",
      "application/yaml",
      "application/xml"
  ]
}
```

```shell
$ curl "https://api.aplazame.com/orders/squema" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```
