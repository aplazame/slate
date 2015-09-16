# + Merchants

## List

```http
GET /merchants HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants?page=3",
    "previous": "https://api.aplazame.com/merchants?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.merchants()
```

`GET https://api.aplazame.com/merchants`

To retrieve merchant queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Merchant queryset.



## Detail

```http
GET /merchants/:merchantId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "id": ":merchantId",
  "...": "..."
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.merchant_detail(':merchantId')
```

`GET https://api.aplazame.com/merchants/:merchantId`

If you want to check the status of an merchant, this is the service you need.

### /me
`GET https://api.aplazame.com/me`

To make all requests for a current merchant , you can replace `/merchants/:merchantId` by `/me`.

### Parameters
`/merchants/:merchantId`

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | string | String `id` of the merchant to perform action with.

### Response

Parameter | Type | Description
--------- | ---- | -----------
id | object | Merchant id,
... | ... | ...



## Operations

```http
GET /merchants/:merchantId/operations HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants/:merchantId/operations?page=3",
    "previous": "https://api.aplazame.com/merchants/:merchantId/operations?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/operations" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.merchant_operations(':merchantId')
response = client.operations()
```

`GET https://api.aplazame.com/merchants/:merchantId/operations`

If you want to check the operations of a merchant, this is the service you need.

### /me
`GET https://api.aplazame.com/me/operations`

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
mark_as_read | bool | `mark_as_read=1` if you want to mark operations as read.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Operations queryset.



## ○ Filtering

```http
GET /me/operations?param=value HTTP/1.1
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
    "next": "https://api.aplazame.com/me/operations?page=3&param=value",
    "previous": "https://api.aplazame.com/me/operations?page=1&param=value"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/me/operations?param=value" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.operations({
  'param': 'value'
})
```

`GET https://api.aplazame.com/me/operations?param=value`

To retrieve operations queryset filtered.

### by operation

Parameter | Type | Lookup | Description
--------- | ---- | ------ | -----------
id | hash | equal | Same Aplazame operation `ID`.
amount | float | equal | Same operation amount.
type | string | equal | Same operation type, `order,cancel,refund`.
min_amount | float | greater | With amount `greater` than the specified.
max_amount | float | less | With amount `less` than the specified.
created_since | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | after | Created `after` than the specified datetime.
created_until | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | before | Created `before` than the specified datetime.
paid_since | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | after | Paid `after` than the specified datetime.
paid_until | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | before | Paid `before` than the specified datetime.
read_since | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | after | Read `after` than the specified datetime.
read_until | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | before | Read `before` than the specified datetime.

### by order

Parameter | Type | Lookup | Description
--------- | ---- | ------ | -----------
order_id | hash | equal | Same Aplazame order `ID`.
order_mid | string | equal | Same order `ID` in your merchant.
order_total_amount | float | equal | Same order total amount.
min_order_amount | float | greater | With total_amount `greater` than the specified.
max_order_amount | float | less | With total_amount `less` than the specified.
order_created_since | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | after | Created `after` than the specified datetime.
order_created_until | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | before | Created `before` than the specified datetime.
order_confirmed_since | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | after | Confirmed `after` than the specified datetime.
order_confirmed_until | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | before | Confirmed `before` than the specified datetime.
order_cancelled_since | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | after | Cancelled `after` than the specified datetime.
order_cancelled_until | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | before | Cancelled `before` than the specified datetime.



## ○ Searching

```http
GET /me/operations?q=param1,param2 HTTP/1.1
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
    "next": "https://api.aplazame.com/me/operations?page=3&q=param1,param2",
    "previous": "https://api.aplazame.com/me/operations?page=1&q=param1,param2"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/me/operations?q=param1,param2" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.operations({
  'q': 'param1,param2'
})
```

`GET https://api.aplazame.com/me/operations?q=param1,param2`

To search operations queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

Parameter | Description
--------- | -----------
id | Operation id
type | Operation type, `order,cancel,refund`
order_id | Order id
order_mid | Order mid (your order id)


## ○ Ordering

```http
GET /me/operations?ordering=param1,-param2 HTTP/1.1
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
    "next": "https://api.aplazame.com/me/operations?page=3&ordering=param1,-param2",
    "previous": "https://api.aplazame.com/me/operations?page=1&ordering=param1,-param2"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/me/operations?ordering=param1,-param2" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.operations({
  'ordering': 'param1,-param2'
})
```

`GET https://api.aplazame.com/me/operations?ordering=param1,-param2`

To retrieve operations queryset ordered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending.

### order by...

Parameter | Type | Description
--------- | ---- | -----------
amount | [decimal](#decimals) | Operation amount.
type | Operation type, `order,cancel,refund`
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was created.
paid | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was paid.
read | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was read.
order_created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was created.
order_confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was confirmed.
he order was confirmed.
