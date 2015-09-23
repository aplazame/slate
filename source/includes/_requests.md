# Making Requests

## Headers

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
import aplazame_sdk

client = aplazame_sdk.Client('access_token', ctype='json', version='1')

response = client.orders()
```

* **Authorization**: oauth2 Bearer Token published as [RFC 6750](http://tools.ietf.org/html/rfc6750)
* **Accept**: to specify certain media types which are acceptable for the response.


### Authentication

[Oauth2](http://en.wikipedia.org/wiki/OAuth) open standard for authorization.

The OAuth 2.0 Framework was published as [RFC 6749](http://tools.ietf.org/html/rfc6749)

OAuth2 is more simple to work with than OAuth1, and provides much better security.


## Versioning

```http
GET /orders HTTP/1.1
Accept: application/vnd.aplazame.v1+(json|xml|yaml)
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+(json|xml|yaml)
```


```shell
$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"

$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v1+xml" \
    -H "Authorization: Bearer ->AccessToken<-"

$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v1+yaml" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('access_token', version='1')

client = aplazame_sdk.Client('access_token', ctype='xml')
client = aplazame_sdk.Client('access_token', ctype='yaml')
```

Although we currently allow for versioned URL, as for example `https://api.aplazame.com/v1/orders`, we consider it a better practice the use of the header `Accept` in the request to specify the type and format of the API service response.

Thus we allow the following types of header

* Accept: application/vnd.aplazame.**v1**+**json**
* Accept: application/vnd.aplazame.**v1**+**xml**
* Accept: application/vnd.aplazame.**v1**+**yaml**

If you do not specify any version by header or by URL, the latest version of the API will be activated. Since a new version of API can deprecate certain fields, this type of practice is not recommended.

<aside class="notice">
The latest API version is v1 and the latest CHECKOUT version is v2, this is the v1.2
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
import aplazame_sdk

client = aplazame_sdk.Client('access_token', sandbox=True)

response = client.orders()
```


Aplazame has a sandbox mode for your unit tests. If you want to make a request in sandbox mode, it must be specified in the `Accept` header just before the Api version.

* Accept (sandbox): application/vnd.aplazame.**sandbox**.v1+json
* Accept (production): application/vnd.aplazame.v1+json


## Decimals

```shell
$ if ((`bc <<< "12.50!=1250"`)); then echo "beep beeeeeeep!!!"; fi
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
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.orders(page=2)

# Build a url query string from a dictionary
response = client.orders({
  'page': 2
})
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



## Filters

Field lookups are how you specify the meat of an *SQL WHERE* clause, all lookups are listed below.

As a convenience when no lookup type is provided the lookup type is assumed to be `exact`.

### String filter

```http
GET /orders?my-param-term=value HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

```

```shell
$ curl "https://api.aplazame.com/orders?my-param-term=value" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'my-param-term': 'value'
})
```

> Exact

```http
GET /orders?id-exact=e791f108472e80d9b48cd05677b1b7b1 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?id-exact=e791f108472e80d9b48cd05677b1b7b1" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'id-exact': 'e791f108472e80d9b48cd05677b1b7b1'
})
```

> Starts with search

```http
GET /orders?id-startswith=e791f HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?id-startswith=e791f" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'id-startswith': 'e791f'
})
```

Term | Usage | Description
---- | ----- | -----------
exact | `name-exact=AplaZame` | An "exact" match
iexact | `name-iexact=aplazame` | A case-insensitive match
regex | `name-regex=^[A-Z].*$` | Case-sensitive containment test. Use html plus `%2B` and not `+`.
iregex | `name-iregex=^[a-z].*$` | String iregex value
contains | `name-contains=plaZa` | String contains value
icontains | `name-icontains=plaza` |  A case-insensitive match
startswith | `name-startswith=Apla` | Starts-with search
istartswith | `name-istartswith=apla` | A case-insensitive match
endswith | `name-endswith=Zame` | Ends-with search
iendswith | `name-iendswith=zame` | A case-insensitive match
in | `name-in=AplaZame,Aplazar` | String in value
search | `name-search=Ap` | String search value


### Date filter

> Week day

```http
GET /orders?confirmed-week_day=monday HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?confirmed-week_day=monday" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'confirmed-week_day': 'monday'
})
```

Term | Usage | Description
---- | ----- | -----------
year | `created-year=2015` | Date year
month | `created-month=10` | Date month
week_day | `created-week_day=monday` | Week day, the choices are `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`
day | `created-day=2` | Date day
hour | `created-hour=14` | Date hour


### Isnull filter, `yes` or `no`

Term | Usage | Description
---- | ----- | -----------
isnull | `confirmed-isnull=yes` | Filter by null fields, `yes` OR `no`


### Range filter

> Date greater/after than or equal to

```http
GET /orders?confirmed-gte=2015-10-02T18:15:45.101838Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?confirmed-gte=2015-10-02T18:15:45.101838Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'confirmed-gte': '2015-10-02T18:15:45.101838Z'
})
```

Term | Usage | Description
---- | ----- | -----------
exact | `total_amount-exact=10000` | Exact
gt | `total_amount-gt=8000` | Greater than
gte | `total_amount-gte=10000` | Greater than or equal to
lt | `total_amount-lt=12000` | Less than
lte | `total_amount-lte=10000` | Less than or equal to


### Choices filter

Multiple choices, `a` OR `b`, for **example** `param=a&param=b`



## Schema

```http
GET /orders/schema HTTP/1.1
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
$ curl "https://api.aplazame.com/orders/schema" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```
