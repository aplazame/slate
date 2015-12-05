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

response = client.merchant_request('operations', ':merchantId')
response = client.operations()
```

`GET https://api.aplazame.com/merchants/:merchantId/operations`

If you want to check the operations of a merchant, this is the service you need.
Orders, refunds, canceled orders and credit requests denied.

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

### Operation filter

```shell
$ curl "https://api.aplazame.com/me/operations?amount-gte=462000" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'amount-gte': 462000
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
type | string | `choices` | Operation type, the choices are `credit`, `cancel`, `refund`, 'credit-denied'
| | | |
amount | [decimal](#decimals) | `range` | Operation amount.
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the operation was created.
read | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the operation was read.


### Order filter

> Total amount exact

```http
GET /me/operations?order-total_amount=462000 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?order-total_amount=462000" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'order-total_amount': 462000
})
```

> Confirmed after

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
order-id | hash | `string` | Aplazame order `ID`.
order-mid | string | `string` | Your order `ID`.
 | | | |
order-total_amount | [decimal](#decimals) | `range` | Order total amount.
order-discount | [decimal](#decimals) | `isnull`, `range` | Order discount amount.
order-discount_rate | [decimal](#decimals) | `isnull`, `range` | Order discount rate.
order- | | | |
order-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the order was created.
order-confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was confirmed.
order-cancelled | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was cancelled.


### Downpayment filter

> Downpayment

```http
GET /me/operations?instalment_plan-downpayment-state=failed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?instalment_plan-downpayment-state=failed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'instalment_plan-downpayment-state': ['failed']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
instalment_plan-downpayment-state | string | `choices` | Downpayment state
instalment_plan-downpayment-amount | [decimal](#decimals) | `isnull`, `range` | Downpayment amount


### Customer filter

> Customer phone number exact

```http
GET /me/operations?customer-phone-number=612345678 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?customer-phone-number=612345678" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'customer-phone-number': '612345678'
})
```


Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
customer-id | hash | `string` | Customer `ID`.
customer-phone-number | string | `string` | Customer mobile phone number.
customer-phone-country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer phone country.
customer-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the customer was created.


### Customer document id filter

> Document ID type, choices are nif OR nie

```http
GET /me/operations?customer-document_id-type=nif&customer-document_id-type=nie HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?customer-document_id-type=nif&customer-document_id-type=nie" \
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


### Account filter

> Gender exact

```http
GET /me/operations?order-account-type=existing&order-account-gender=0 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?order-account-type=existing&order-account-gender=0" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'order-account-type': 'existing',
  'order-account-gender': 0
})
```

> Last login is not null

```http
GET /me/operations?order-account-last_login-isnull=no HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations?order-account-last_login-isnull=no" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations({
  'order-account-last_login-isnull': False
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
order-account-id | hash | `string` | Customer account `ID`.
order-account-type | string | `choices` | Customer type, the choices are `g`:guest, `n`:new, `e`:existing.
order-account-gender | integer | `choices` | Customer gender, the choices are `0`: not known, `1`: male, `2`:female, `3`: not applicable.
order-account-last_login | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's last login
order-account-date_joined | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's date joined


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


## Payments

```http
GET /merchants/:merchantId/payments HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants/:merchantId/payments?page=3",
    "previous": "https://api.aplazame.com/merchants/:merchantId/payments?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/payments" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.merchant_request('payments', ':merchantId')
response = client.payments()
```

`GET https://api.aplazame.com/merchants/:merchantId/payments`

If you want to check the payments of a merchant, this is the service you need.

### /me
`GET https://api.aplazame.com/me/payments`

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
mark_as_read | bool | `mark_as_read=yes` if you want to mark payments as read.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Payments queryset.



## ○ Filter

```http
GET /me/payments?param=value HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?param=value" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'param': 'value'
})
```

`GET https://api.aplazame.com/me/payments?param=value`

To retrieve payments queryset filtered.

**Filters lookups** are listed **[HERE](#filters)**, `string`, `choices`, `range`, `isnull` and `date`.

### Payment filter

> Amount greater or exact

```http
GET /me/payments?amount-gte=462000 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?amount-gte=462000" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'amount-gte': 462000
})
```

> Created after

```http
GET /me/payments?created-gt=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?created-gt=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'created-gt': '2015-12-22T15:09:30.537951Z'
})
```

Parameter | Type | Lookups | Description
--------- | ---- | ------ | -----------
id | hash | `string` | Aplazame operation `ID`.
type | string | `choices` | Payment type, the choices are `order`, `cancel`, `refund` or `regularization`
| | | |
amount | [decimal](#decimals) | `range` | Payment amount.
fee_rate | [decimal](#decimals) | `range` | Payment fee rate.
| | | |
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the operation was created.
paid | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the operation was paid.
read | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the operation was read.


### Order filter

> Total amount exact

```http
GET /me/payments?order-total_amount=462000 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?order-total_amount=462000" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'order-total_amount': 462000
})
```

> Confirmed after

```http
GET /me/payments?order-confirmed-gte=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?order-confirmed-gte=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'order-confirmed-gte': '2015-12-22T15:09:30.537951Z'
})
```


Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
order-id | hash | `string` | Aplazame order `ID`.
order-mid | string | `string` | Your order `ID`.
 | | | |
order-total_amount | [decimal](#decimals) | `range` | Order total amount.
order-discount | [decimal](#decimals) | `isnull`, `range` | Order discount amount.
order-discount_rate | [decimal](#decimals) | `isnull`, `range` | Order discount rate.
order- | | | |
order-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the order was created.
order-confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was confirmed.
order-cancelled | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was cancelled.


### Downpayment filter

> Downpayment

```http
GET /me/payments?instalment_plan-downpayment-state=failed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?instalment_plan-downpayment-state=failed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'instalment_plan-downpayment-state': ['failed']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
instalment_plan-downpayment-state | string | `choices` | Downpayment state
instalment_plan-downpayment-amount | [decimal](#decimals) | `isnull`, `range` | Downpayment amount


### Customer filter

> Customer phone number exact

```http
GET /me/payments?customer-phone-number=612345678 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?customer-phone-number=612345678" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'customer-phone-number': '612345678'
})
```


Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
customer-id | hash | `string` | Customer `ID`.
customer-phone-number | string | `string` | Customer mobile phone number.
customer-phone-country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer phone country.
customer-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the customer was created.


### Customer document id filter

> Document ID type, choices are nif OR nie

```http
GET /me/payments?customer-document_id-type=nif&customer-document_id-type=nie HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?customer-document_id-type=nif&customer-document_id-type=nie" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'customer-document_id-type': ['nif', 'nie']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
customer-document_id-number | string | `string` | Customer document id number.
customer-document_id-country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer document id country.
customer-document_id-type | string | `choices` | Customer document id type, the choices are `nif`, `nie`, `cif`, `passport`, `others`.


### Account filter

> Gender exact

```http
GET /me/payments?order-account-type=existing&order-account-gender=0 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?order-account-type=existing&order-account-gender=0" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'order-account-type': 'existing',
  'order-account-gender': 0
})
```

> Last login is not null

```http
GET /me/payments?order-account-last_login-isnull=no HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?order-account-last_login-isnull=no" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'order-account-last_login-isnull': False
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
order-account-id | hash | `string` | Customer account `ID`.
order-account-type | string | `choices` | Customer type, the choices are `g`:guest, `n`:new, `e`:existing.
order-account-gender | integer | `choices` | Customer gender, the choices are `0`: not known, `1`: male, `2`:female, `3`: not applicable.
order-account-last_login | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's last login
order-account-date_joined | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's date joined


## ○ Search

```http
GET /me/payments?q=param1,param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?q=param1,param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'q': 'param1,param2,...'
})
```

`GET https://api.aplazame.com/me/payments?q=param1,param2,...`

To search payments queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

> by some ID

```http
GET /me/payments?q=1000203 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?q=1000203" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'q': '1000203'
})
```

Parameter | Description
--------- | -----------
id | Payment id
order-id | Order id
order-mid | Order mid (your order id)


## ○ Order

```http
GET /me/payments?ordering=param1,-param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?ordering=param1,-param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'ordering': 'param1,-param2,...'
})
```

`GET https://api.aplazame.com/me/payments?ordering=param1,-param2,...`

To retrieve payments queryset ordered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending.

### by operation

> Ascending amount, Descending created

```http
GET /me/payments?ordering=amount,-created HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?ordering=amount,-created" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'ordering': 'amount,-created'
})
```

Parameter | Type | Description
--------- | ---- | -----------
amount | [decimal](#decimals) | Payment amount.
fee_rate | [decimal](#decimals) | Payment fee rate.
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was created.
paid | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was paid.
read | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was read.

### by order

> Descending order confirmed

```http
GET /me/payments?ordering=-order-confirmed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments?ordering=-order-confirmed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments({
  'ordering': '-order-confirmed'
})
```

Parameter | Type | Description
--------- | ---- | -----------
order-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was created.
order-confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was confirmed.


## Instalment Payments

```http
GET /merchants/:merchantId/instalment-payments HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants/:merchantId/instalment-payments?page=3",
    "previous": "https://api.aplazame.com/merchants/:merchantId/instalment-payments?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/instalment-payments" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.merchant_request('instalment-payments', ':merchantId')
response = client.instalment_payments()
```

`GET https://api.aplazame.com/merchants/:merchantId/instalment-payments`

If you want to check the Aplazame instalment-payments, this is the service you need.

### /me
`GET https://api.aplazame.com/me/instalment-payments`


### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Instalment payments queryset.



## ○ Filter

```http
GET /me/instalment-payments?param=value HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?param=value" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'param': 'value'
})
```

`GET https://api.aplazame.com/me/instalment-payments?param=value`

To retrieve instalment instalment-payments queryset filtered.

**Filters lookups** are listed **[HERE](#filters)**, `string`, `choices`, `range`, `isnull` and `date`.

### Instalment instalment-payment filter

> Amount greater or exact and fee rate less

```http
GET /me/instalment-payments?amount-gte=462000&fee_rate-lt=10 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?amount-gte=462000&fee_rate-lt=10" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'amount-gte': 462000,
  'fee_rate-lt': 10 # 0.1%
})
```

> Created after

```http
GET /me/instalment-payments?created-gt=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?created-gt=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'created-gt': '2015-12-22T15:09:30.537951Z'
})
```

Parameter | Type | Lookups | Description
--------- | ---- | ------ | -----------
id | hash | `string` | Instalment instalment-payment `ID`.
amount | [decimal](#decimals) | `range` | Instalment instalment-payment amount.
total_paid | [decimal](#decimals) | `range` | Instalment instalment-payment total paid, includes recovery.
daily_penalty_interes | [decimal](#decimals) | `range` | Daily penalty interest per unit.
penalty_fee | [decimal](#decimals) | `range` | Penalty fee amount.
| | | |
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the instalment instalment-payment was created.
collected | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the instalment instalment-payment was collected.


### Order filter

> Total amount exact

```http
GET /me/instalment-payments?order-total_amount=462000 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?order-total_amount=462000" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'order-total_amount': 462000
})
```

> Confirmed after

```http
GET /me/instalment-payments?order-confirmed-gte=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?order-confirmed-gte=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'order-confirmed-gte': '2015-12-22T15:09:30.537951Z'
})
```


Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
order-id | hash | `string` | Aplazame order `ID`.
order-mid | string | `string` | Your order `ID`.
 | | | |
order-total_amount | [decimal](#decimals) | `range` | Order total amount.
order-discount | [decimal](#decimals) | `isnull`, `range` | Order discount amount.
order-discount_rate | [decimal](#decimals) | `isnull`, `range` | Order discount rate.
order- | | | |
order-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the order was created.
order-confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was confirmed.
order-cancelled | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was cancelled.


### Downinstalment-payment filter

> Downinstalment-payment

```http
GET /me/instalment-payments?instalment_plan-downinstalment-payment-state=failed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?instalment_plan-downinstalment-payment-state=failed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'instalment_plan-downinstalment-payment-state': ['failed']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
instalment_plan-downinstalment-payment-state | string | `choices` | Downinstalment-payment state
instalment_plan-downinstalment-payment-amount | [decimal](#decimals) | `isnull`, `range` | Downinstalment-payment amount


### Customer filter

> Customer phone number exact

```http
GET /me/instalment-payments?customer-phone-number=612345678 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?customer-phone-number=612345678" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'customer-phone-number': '612345678'
})
```


Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
customer-id | hash | `string` | Customer `ID`.
customer-phone-number | string | `string` | Customer mobile phone number.
customer-phone-country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer phone country.
customer-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the customer was created.


### Customer document id filter

> Document ID type, choices are nif OR nie

```http
GET /me/instalment-payments?customer-document_id-type=nif&customer-document_id-type=nie HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?customer-document_id-type=nif&customer-document_id-type=nie" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'customer-document_id-type': ['nif', 'nie']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
customer-document_id-number | string | `string` | Customer document id number.
customer-document_id-country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer document id country.
customer-document_id-type | string | `choices` | Customer document id type, the choices are `nif`, `nie`, `cif`, `passport`, `others`.


### Account filter

> Gender exact

```http
GET /me/instalment-payments?order-account-type=existing&order-account-gender=0 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?order-account-type=existing&order-account-gender=0" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'order-account-type': 'existing',
  'order-account-gender': 0
})
```

> Last login is not null

```http
GET /me/instalment-payments?order-account-last_login-isnull=no HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?order-account-last_login-isnull=no" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'order-account-last_login-isnull': False
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
order-account-id | hash | `string` | Customer account `ID`.
order-account-type | string | `choices` | Customer type, the choices are `g`:guest, `n`:new, `e`:existing.
order-account-gender | integer | `choices` | Customer gender, the choices are `0`: not known, `1`: male, `2`:female, `3`: not applicable.
order-account-last_login | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's last login
order-account-date_joined | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's date joined


## ○ Search

```http
GET /me/instalment-payments?q=param1,param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?q=param1,param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'q': 'param1,param2,...'
})
```

`GET https://api.aplazame.com/me/instalment-payments?q=param1,param2,...`

To search instalment-payments queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

> by some ID

```http
GET /me/instalment-payments?q=1000203 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?q=1000203" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'q': '1000203'
})
```

Parameter | Description
--------- | -----------
id | Instalment payment id
order-id | Order id
order-mid | Order mid (your order id)


## ○ Order

```http
GET /me/instalment-payments?ordering=param1,-param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?ordering=param1,-param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'ordering': 'param1,-param2,...'
})
```

`GET https://api.aplazame.com/me/instalment-payments?ordering=param1,-param2,...`

To retrieve instalment-payments queryset ordered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending.

### by operation

> Ascending amount, Descending created

```http
GET /me/instalment-payments?ordering=amount,-created HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?ordering=amount,-created" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'ordering': 'amount,-created'
})
```

Parameter | Type | Description
--------- | ---- | -----------
amount | [decimal](#decimals) | Instalment payment amount.
fee_rate | [decimal](#decimals) | Instalment payment fee rate.
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was created.
paid | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was paid.
read | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the operation was read.


### by order

> Descending order confirmed

```http
GET /me/instalment-payments?ordering=-order-confirmed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?ordering=-order-confirmed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
  'ordering': '-order-confirmed'
})
```

Parameter | Type | Description
--------- | ---- | -----------
order-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was created.
order-confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was confirmed.
