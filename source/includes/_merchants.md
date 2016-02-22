# + Merchants

## ○ List

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


## ○ Create

```http
POST /merchants HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "name": "Aplazame e-commerce",
  "url": "http://www.aplazame.com",
  "account": {
    "business_activity": "01",
    "iban": "ES9121000418450200051332"
  }
}
```

```http
HTTP/1.1 201 CREATED
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    --data-binary '{
      "name": "Aplazame e-commerce",
      "url": "http://www.aplazame.com",
      "account": {
        "business_activity": "01",
        "iban": "ES9121000418450200051332"
      }
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.post_merchant({
  'name': 'Aplazame e-commerce',
  'url': 'http://www.aplazame.com',
  'account': {
    'business_activity': '01',
    'iban': 'ES9121000418450200051332'
  }
})
```

`POST https://api.aplazame.com/merchants`

To create a merchant.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
name | string | yes | Merchant name.
url | url | yes | Merchant url.
widget_enabled | bool | no | Determines if the widget is enabled.
min_amount_per_transaction | [decimals](#decimals) | no | Minimun amount per transaction.
connect_discounts | bool | no | Determines if discounts are enabled.

### Account Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
business_activity | code | yes | Merchant business activity, select your choice [here](https://aplazame.com/static/payments/business-activity.html).
iban | [ISO 13616](https://en.wikipedia.org/wiki/International_Bank_Account_Number) | yes | International Bank Account Number.
payment_frequency | choices | no | Determines the payment frequency, choices are `daily` or `weekly`.

## ○ Detail

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
response = client.get_merchant(':merchantId')
```

`GET https://api.aplazame.com/merchants/:merchantId`

If you want to check the status of a merchant, this is the service you need.

### /me
`GET https://api.aplazame.com/me`

To make all requests for a current merchant, you can replace `/merchants/:merchantId` by `/me`.

### Parameters
`/merchants/:merchantId`

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | string | String `id` of the merchant to perform action with.

### Response

Parameter | Type | Description
--------- | ---- | -----------
id | hash | Merchant id,
... | ... | ...


## ○ Edit

```http
PUT /merchants/:merchantId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "name": "Aplazame e-commerce",
  "url": "http://www.aplazame.com",
  "account": {
    "business_activity": "01",
    "iban": "ES9121000418450200051332"
  }
}
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
    -H "Authorization: Bearer ->AccessToken<-"\
    -X PUT \
    --data-binary '{
      "name": "Aplazame e-commerce",
      "url": "http://www.aplazame.com",
      "account": {
        "business_activity": "01",
        "iban": "ES9121000418450200051332"
      }
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.put_merchant(':merchantId', {
  'name': 'Aplazame e-commerce',
  'url': 'http://www.aplazame.com',
  'account': {
    'business_activity': '01',
    'iban': 'ES9121000418450200051332'
  }
})
```

`PUT https://api.aplazame.com/merchants/:merchantId`

If you want to edit a merchant, this is the service you need.

### /me
`PUT https://api.aplazame.com/me`

To make all requests for a current merchant, you can replace `/merchants/:merchantId` by `/me`.

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | string | String `id` of the merchant to perform action with.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
name | string | yes | Merchant name.
url | url | yes | Merchant url.
widget_enabled | bool | no | Determines if the widget is enabled.
min_amount_per_transaction | [decimals](#decimals) | no | Minimun amount per transaction.
connect_discounts | bool | no | Determines if discounts are enabled.

### Account Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
business_activity | code | yes | Merchant business activity, select your choice [here](https://aplazame.com/static/payments/business-activity.html).
iban | [ISO 13616](https://en.wikipedia.org/wiki/International_Bank_Account_Number) | yes | International Bank Account Number.
payment_frequency | choices | no | Determines the payment frequency, choices are `daily` or `weekly`.


### Response

Parameter | Type | Description
--------- | ---- | -----------
id | hash | Merchant id,
... | ... | ...



### Partial Edit

```http
PATCH /merchants/:merchantId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "name": "edited"
}
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
    -H "Authorization: Bearer ->AccessToken<-"\
    -X PATCH \
    --data-binary '{
      "name": "Aplazame e-commerce"
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.patch_merchant(':merchantId', {
  'name': 'edited'
})
```

`PATCH https://api.aplazame.com/merchants/:merchantId`

If you want to partial editing, this is the service you need.

### /me
`PATCH https://api.aplazame.com/me`



## + Hostnames

## ○ List

```http
GET /merchants/:merchantId/hostnames HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants/:merchantId/hostnames?page=3",
    "previous": "https://api.aplazame.com/merchants/:merchantId/hostnames?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/hostnames" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
# Merchant request
response = client.merchant_request('hostnames', ':merchantId')
# Current merchant
response = client.hostnames()
```

`GET https://api.aplazame.com/merchants/:merchantId/hostnames`

To retrieve hostnames queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Hostnames queryset.


## ○ Create

```http
POST /merchants/:merchantId/hostnames HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "url": "http://www.aplazame.com"
}
```

```http
HTTP/1.1 201 CREATED
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/hostnames" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    --data-binary '{
      "url": "http://www.aplazame.com"
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.post_hostname(':merchantId', {
  'url': 'http://www.aplazame.com'
})
```

`POST https://api.aplazame.com/merchants/:merchantId/hostnames`

To create a hostname.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
url | url | yes | Merchant url.

## ○ Detail

```http
GET /merchants/:merchantId/hostnames/:hostnameId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "id": ":hostnameId",
  "host": "www.aplazame.com",
  "name": "www.aplazame.com"
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/hostnames/:hostnameId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.get_hostname(':merchantId', ':hostnameId')
```

`GET https://api.aplazame.com/merchants/:merchantId/hostnames/:hostnameId`

If you want to check the status of a hostname, this is the service you need.

### /me
`GET https://api.aplazame.com/me/hostnames/:hostnameId`

To make all requests for a current merchant, you can replace `/merchants/:merchantId` by `/me`.


### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | hash | String `id` of the merchant to perform action with.
:hostnameId | hash | String `id` of the hostname to perform action with.

### Response

Parameter | Type | Description
--------- | ---- | -----------
id | hash | Hostname id,
host | host | The host.
name | string | The name.


## ○ Delete

```http
DELETE /merchants/:merchantId/hostnames/:hostnameId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/hostnames/:hostnameId " \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X DELETE
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.delete_hostname(':merchantId', ':hostnameId')
```

If you want to delete any hostname, this is the service you need.

## + Operations

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
# Merchant request
response = client.merchant_request('operations', ':merchantId')
# Current merchant
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
type | string | `choices` | Operation type, the choices are `credit`, `cancel`, `refund`, `credit-denied`
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


## ○ Detail

```http
GET /merchants/:merchantId/operations/:operationId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "id": ":operationId"
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/operations/:operationId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.get_operation(':merchantId', ':operationId')
```

`GET https://api.aplazame.com/merchants/:merchantId/operations/:operationId`

If you want to check the status of a operation, this is the service you need.

### /me
`GET https://api.aplazame.com/me/operations/:operationId`

To make all requests for a current merchant, you can replace `/merchants/:merchantId` by `/me`.


### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | hash | String `id` of the merchant to perform action with.
:operationId | hash | String `id` of the operation to perform action with.


## ○ Summary

```http
GET /me/operations/summary HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/operations/summary" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.operations_summary()
```

`GET https://api.aplazame.com/me/operations/summary`

To retrieve operations summary grouped by month

## ○ Real time

```html
<script src="http://socket.aplazame.com/socket.io/socket.io.js"></script>

<script>
  var socket = io.connect('http://socket.aplazame.com');
</script>
```

```html
<script>
socket.on('connect', function () {
  socket
    .on('authenticated', function () {
      socket
        .on('operations', function (data) {
        })
    })
    .emit('authenticate', {token: 'your-jwt-token'});
});
</script>
```

Aplazame provides a NodeJs server via the [socket.io](https://github.com/socketio/socket.io) module for real-time event-based communication.

You can call join to subscribe the socket to the operations channel.

[JSON Web Token](https://tools.ietf.org/html/rfc7519) (JWT) is a compact, URL-safe means of representing claims to be transferred between the NodeJs server and the client. You can request `/me` or `/merchants` to get the jwt token by merchant.


## + Payments

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
# Merchant request
response = client.merchant_request('payments', ':merchantId')
# Current merchant
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
total_amount | [decimal](#decimals) | `range` | Payment total amount (include fees and tax).
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
total amount | [decimal](#decimals) | Payment total amount.
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


## ○ Summary

```http
GET /me/payments/summary HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/payments/summary" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.payments_summary()
```

`GET https://api.aplazame.com/me/payments/summary`

To retrieve payments summary grouped by month.


## ○ Real time

```html
<script src="http://socket.aplazame.com/socket.io/socket.io.js"></script>

<script>
  var socket = io.connect('http://socket.aplazame.com');
</script>
```

```html
<script>
socket.on('connect', function () {
  socket
    .on('authenticated', function () {
      socket
        .on('payments', function (data) {
        })
    })
    .emit('authenticate', {token: 'your-jwt-token'});
});
</script>
```

Aplazame provides a NodeJs server via the [socket.io](https://github.com/socketio/socket.io) module for real-time event-based communication.

You can call join to subscribe the socket to the payments channel.

[JSON Web Token](https://tools.ietf.org/html/rfc7519) (JWT) is a compact, URL-safe means of representing claims to be transferred between the NodeJs server and the client. You can request `/me` or `/merchants` to get the jwt token by merchant.


## + Invoices

## ○ List

```http
GET /merchants/:merchantId/invoices HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants/:merchantId/invoices?page=3",
    "previous": "https://api.aplazame.com/merchants/:merchantId/invoices?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/invoices" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
# Merchant request
response = client.merchant_request('invoices', ':merchantId')
# Current merchant
response = client.invoices()
```

`GET https://api.aplazame.com/merchants/:merchantId/invoices`

To retrieve invoices queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Invoices queryset.

## ○ Filter


```http
GET /merchants/:merchantId/invoices?created-startswith=2016-01 HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants/:merchantId/invoices?page=3&created-startswith=2016-01",
    "previous": "https://api.aplazame.com/merchants/:merchantId/invoices?page=1&created-startswith=2016-01"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/invoices?created-startswith=2016-01" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
# Merchant request
response = client.merchant_request('invoices', ':merchantId', {
  'created-startswith': '2016-01'
})
# Current merchant
response = client.invoices({
  'created-startswith': '2016-01'
})
```

Parameter | Type | Lookups | Description
--------- | ---- | ------ | -----------
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range`, `startswith` | A datetime designating when the instalment payment was created.


## + Instalment Payments

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
# Merchant request
response = client.merchant_request('instalment-payments', ':merchantId')
# Current merchant
response = client.instalment_payments()
```

`GET https://api.aplazame.com/merchants/:merchantId/instalment-payments`

If you want to check the Aplazame instalment payments, this is the service you need.

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

To retrieve instalment payments queryset filtered.

**Filters lookups** are listed **[HERE](#filters)**, `string`, `choices`, `range`, `isnull` and `date`.

### Instalment payment filter

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
id | hash | `string` | Instalment payment `ID`.
amount | [decimal](#decimals) | `range` | Instalment payment amount.
total_paid | [decimal](#decimals) | `range` | Instalment payment total paid, includes recovery.
daily_penalty_interes | [decimal](#decimals) | `range` | Daily penalty interest per unit.
penalty_fee | [decimal](#decimals) | `range` | Penalty fee amount.
| | | |
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the instalment payment was created.
collected | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the instalment payment was collected.


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


### Downpayment filter

> Downpayment

```http
GET /me/instalment-payments?instalment_plan-downpayment-state=failed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/me/instalment-payments?instalment_plan-downpayment-state=failed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.instalment_payments({
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

To search instalment payments queryset.

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

To retrieve instalment payments queryset ordered.

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
