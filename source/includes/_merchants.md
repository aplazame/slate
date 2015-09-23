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
mark_as_read | bool | `mark_as_read=yes` if you want to mark operations as read.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Operations queryset.



## ○ Filter

```http
GET /me/operations?param=value HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?param=value" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'param': 'value'
})
```

`GET https://api.aplazame.com/me/operations?param=value`

To retrieve operations queryset filtered.

**Filters lookups** are listed **[HERE](#filters)**, `string`, `choices`, `range`, `isnull` and `date`.

### by operation

> Amount greater or exact and fee rate less

```http
GET /me/operations?amount-gte=462000&fee_rate-lt=10 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?amount-gte=462000&fee_rate-lt=10" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'amount-gte': 462000,
  'fee_rate-lt': 10 # 0.1%
})
```

> Created after

```http
GET /me/operations?created-gt=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?created-gt=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'created-gt': '2015-12-22T15:09:30.537951Z'
})
```

Parameter | Type | Lookups | Description
--------- | ---- | ------ | -----------
id | hash | `string` | Aplazame operation `ID`.
type | string | `choices` | Operation type, the choices are `order`, `cancel`, `refund`
| | | |
amount | [decimal](#decimals) | `range` | Operation amount.
fee_rate | [decimal](#decimals) | `range` | Operation fee rate.
| | | |
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the operation was created.
paid | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the operation was paid.
read | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the operation was read.


### by order

> Your order ID exact

```http
GET /me/operations?order-mid=10002030001 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?order-mid=10002030001" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'order-mid': '10002030001'
})
```

> Order created after

```http
GET /me/operations?order-created-gte=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?order-created-gte=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'order-created-gte': '2015-12-22T15:09:30.537951Z'
})
```

> Order confirmed after

```http
GET /me/operations?order-confirmed-gte=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?order-confirmed-gte=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'order-confirmed-gte': '2015-12-22T15:09:30.537951Z'
})
```


Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
id | hash | `string` | Aplazame order `ID`.
order-mid | string | `string` | Your order `ID`.
order- | | | |
order-total_amount | [decimal](#decimals) | `range` | Order total amount.
order-discount | [decimal](#decimals) | `isnull`, `range` | Order discount amount.
order-discount_rate | [decimal](#decimals) | `isnull`, `range` | Order discount rate.
order- | | | |
order-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the order was created.
order-verified | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was verified.
order-confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was confirmed.
order-cancelled | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was cancelled.


### by customer

> Customer phone number exact

```http
GET /me/operations?customer-phone_number=612345678 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?customer-phone_number=612345678" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'customer-phone_number': '612345678'
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
customer-id | hash | `string` | Customer `ID`.
customer-phone_number | string | `string` | Customer mobile phone number.
customer-phone_country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer phone country.
customer-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the customer was created.


### by customer document id

> Document ID type, choices are nif OR nie

```http
GET /operations?customer-document_id-type=nif&customer-document_id-type=nie HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/operations?customer-document_id-type=nif&customer-document_id-type=nie" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'customer-document_id-type': ['nif', 'nie']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
customer-document_id-number | string | `string` | Customer document id number.
customer-document_id-country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer document id country.
customer-document_id-type | string | `choices` | Customer document id type, the choices are `nif`, `nie`, `cif`, `passport`, `others`.




## ○ Search

```http
GET /me/operations?q=param1,param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?q=param1,param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'q': 'param1,param2,...'
})
```

`GET https://api.aplazame.com/me/operations?q=param1,param2,...`

To search operations queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

> by some ID

```http
GET /me/operations?q=1000203 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?q=1000203" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'q': '1000203'
})
```

Parameter | Description
--------- | -----------
id | Operation id
order-id | Order id
order-mid | Order mid (your order id)


## ○ Order

```http
GET /me/operations?ordering=param1,-param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?ordering=param1,-param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'ordering': 'param1,-param2,...'
})
```

`GET https://api.aplazame.com/me/operations?ordering=param1,-param2,...`

To retrieve operations queryset ordered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending.

### by operation

> Ascending amount, Descending created

```http
GET /me/operations?ordering=amount,-created HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?ordering=amount,-created" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'ordering': 'amount,-created'
})
```

Parameter | Type | Description
--------- | ---- | -----------
amount | [decimal](#decimals) | Operation amount.
fee_rate | [decimal](#decimals) | Operation fee rate.
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was created.
paid | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was paid.
read | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was read.

### by order

> Descending order confirmed

```http
GET /me/operations?ordering=-order-confirmed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?ordering=-order-confirmed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'ordering': '-order-confirmed'
})
```

Parameter | Type | Description
--------- | ---- | -----------
order-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was created.
order-confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was confirmed.
