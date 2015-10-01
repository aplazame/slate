# + Orders

Aplazame has a range of API services required for a complete integration as a method of payment in your ecommerce.

The requests must include the private key in the [header Authorization](#authentication) as indicated in the protocol [Oauth2](http://en.wikipedia.org/wiki/OAuth).

Before making requests, make sure that the header Accept of your client API matches the [version](#versioning) and the format in which you want to establish communication (json, xml, yaml).



## List

```http
GET /orders HTTP/1.1
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
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/orders" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.orders()
```

`GET https://api.aplazame.com/orders`

To retrieve order queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Order queryset.


## ○ Filter

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

`GET https://api.aplazame.com/orders?my-param-term=value`

To retrieve order queryset filtered.

**Filters lookups** are listed **[HERE](#filters)**, `string`, `choices`, `range`, `isnull` and `date`.


### Order filter

> Total amount exact

```http
GET /orders?total_amount=462000 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?total_amount=462000" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'total_amount': 462000
})
```

> Confirmed after

```http
GET /orders?confirmed-gte=2015-12-22T15:09:30.537951Z HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?confirmed-gte=2015-12-22T15:09:30.537951Z" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'confirmed-gte': '2015-12-22T15:09:30.537951Z'
})
```

> Verified but not confirmed

```http
GET /orders?verified-isnull=yes&confirmed-isnull=no HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?verified-isnull=yes&confirmed-isnull=no" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'verified-isnull': True,
  'confirmed-isnull': False
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
id | hash | `string` | Aplazame order `ID`.
mid | string | `string` | Your order `ID`.
 | | | |
total_amount | [decimal](#decimals) | `range` | Order total amount.
discount | [decimal](#decimals) | `isnull`, `range` | Order discount amount.
discount_rate | [decimal](#decimals) | `isnull`, `range` | Order discount rate.
 | | | |
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the order was created.
verified | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was verified.
confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was confirmed.
cancelled | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime designating when the order was cancelled.


### Downpayment filter

> Downpayment

```http
GET /orders?downpayment-state=failed HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?downpayment-state=failed" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'downpayment-state': ['failed']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
downpayment-state | string | `choices` | Downpayment state
downpayment-amount | [decimal](#decimals) | `isnull`, `range` | Downpayment amount


### Customer filter

> Customer phone number exact

```http
GET /orders?customer-phone-number=612345678 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?customer-phone-number=612345678" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
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
GET /orders?customer-document_id-type=nif&customer-document_id-type=nie HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?customer-document_id-type=nif&customer-document_id-type=nie" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
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
GET /orders?account-type=existing&account-gender=0 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?account-type=existing&account-gender=0" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'account-type': 'existing',
  'account-gender': 0
})
```

> Last login is not null

```http
GET /orders?account-last_login-isnull=no HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?account-last_login-isnull=no" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'account-last_login-isnull': False
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
account-id | hash | `string` | Customer account `ID`.
account-type | string | `choices` | Customer type, the choices are `g`:guest, `n`:new, `e`:existing.
account-gender | integer | `choices` | Customer gender, the choices are `0`: not known, `1`: male, `2`:female, `3`: not applicable.
account-last_login | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's last login
account-date_joined | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `isnull`, `date`, `range` | A datetime of the account's date joined


## ○ Search

```http
GET /orders?q=param1,param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?q=param1,param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'q': 'param1,param2,...'
})
```

`GET https://api.aplazame.com/orders?q=param1,param2,...`

To search order queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

> Search by name, email, domain ...

```http
GET /orders?q=Alice,@gmail,.es HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?q=Alice,@gmail,.es" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'q': 'Alice,@gmail,.es'
})
```

Parameter | Description
--------- | -----------
account-first_name | The customer first name.
account-last_name | The customer last name.
account-email | The customer email.


## ○ Order

```http
GET /orders?ordering=param1,-param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```


```shell
$ curl "https://api.aplazame.com/orders?ordering=param1,-param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'ordering': 'param1,-param2,...'
})
```

`GET https://api.aplazame.com/orders?ordering=param1,-param2,...`

To retrieve order queryset ordered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending.


### by order

> Descending total amount, Ascending created

```http
GET /orders?ordering=-total_amount,created HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?ordering=-total_amount,created" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'ordering': '-total_amount,created'
})
```

Parameter | Type | Description
--------- | ---- | -----------
total_amount | [decimal](#decimals) | Order total amount.
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was created.
verified | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was verified.
confirmed | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was confirmed.
cancelled | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the order was cancelled.


### by account

> Ascending account last login, Descending account created

```http
GET /orders?ordering=account-last_login,-account-created HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/orders?ordering=account-last_login,-account-created" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.orders({
  'ordering': 'account-last_login,-account-created'
})
```

Parameter | Type | Description
--------- | ---- | -----------
account-last_login | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime of the account's last login
account-date_joined | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime of the account's date joined
account-created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the customer account was created in Aplazame.



## Detail

```http
GET /orders/:orderId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "id": ":orderId",
  "...": "..."
}
```

```shell
$ curl "https://api.aplazame.com/orders/:orderId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.order_detail(':orderId')
```

`GET https://api.aplazame.com/orders/:orderId`

If you want to check the status of an order, this is the service you need.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
:orderId | string | String `id` of the order to perform action with.


### Response

Parameter | Type | Description
--------- | ---- | -----------
id | object | Order id,
... | ... | ...



## Cancel

```http
POST /orders/:orderId/cancel HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 204 No Content
Content-Type: application/vnd.aplazame.v1+json
```



```shell
$ curl "https://api.aplazame.com/orders/:orderId/cancel" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-" \
    -X POST
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.cancel(':orderId')
```

`POST https://api.aplazame.com/orders/:orderId/cancel`

Service in charge of canceling an order. Note that once the order has been cancelled it may not be modified.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
:orderId | string | String `id` of the order to perform action with.



## Refund

> Check (GET) and refund (POST)

```http
GET /orders/:orderId/refund HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "remaining_amount": 70070
}
```

```http
POST /orders/:orderId/refund HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "amount": 10050
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "remaining_amount": 60020
}
```

```shell
$ curl "https://api.aplazame.com/orders/:orderId/refund" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```shell
$ curl "https://api.aplazame.com/orders/:orderId/refund" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-" \
    -X POST \
    -d "amount=10050"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

# Check
response = client.refund_check(':orderId')

# ...and refund
response = client.refund(':orderId', 10050)
```

### Check remaining amount

`GET https://api.aplazame.com/orders/:orderId/refund`

### Refund

`POST https://api.aplazame.com/orders/:orderId/refund`


### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
:orderId | string | String `id` of the order to perform action with.


### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
amount | [decimal](#decimals) | yes | The amount to refund.


### Response

Parameter | Type | Description
--------- | ---- | -----------
remaining_amount | [decimal](#decimals) | The remaining order amount.



## Partial update


```http
PATCH /orders/:orderId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "order": {
    "articles": [
      {
        "id": "59825349042875546873",
        "name": "N°5 eau premiere spray",
        "description": "A decidedly lighter, fresher...",
        "url": "http://www.chanel.com...",
        "image_url": "http://www.chanel.com...",
        "quantity": 1,
        "price": 29000,
        "tax_rate": 2100
      }
    ],
    "discount": 300
  }
}
```

```http
HTTP/1.1 204 No Content
Content-Type: application/vnd.aplazame.v1+json
```


```shell
$ curl "https://api.aplazame.com/orders/:orderId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-" \
    -X PATCH \
    --data-binary '{
      "order": {
        "articles": [
          {
            "id": "59825349042875546873",
            "name": "N°5 eau premiere spray",
            "description": "A decidedly lighter, fresher...",
            "url": "http://www.chanel.com...",
            "image_url": "http://www.chanel.com...",
            "quantity": 1,
            "price": 29000,
            "tax_rate": 2100
          }
        ],
        "discount": 300
      }
    }'
```

```python
import aplazame_sdk

payload = {
  "order": {
    "articles": [
      {
        "id": "59825349042875546873",
        "name": "N°5 eau premiere spray",
        "description": "A decidedly lighter, fresher...",
        "url": "http://www.chanel.com...",
        "image_url": "http://www.chanel.com...",
        "quantity": 1,
        "price": 29000,
        "tax_rate": 2100
      }
    ],
    "discount": 300
  }
}

client = aplazame_sdk.Client('->AccessToken<-')

response = client.update(':orderId', payload, partial=True)
```

`PATCH https://api.aplazame.com/orders/:orderId`

This service is used to partially modify the order, you choose if you want to change the shipping data, the billing or the cart.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
:orderId | string | String `id` of the order to perform action with.


### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
[order](#order) | object | **partial** | Order to update.


## Update

```http
PUT /orders/:orderId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "order": {
    "shipping": {
      "first_name": "Hobbes",
      "last_name": "Watterson",
      "phone": "616123456",
      "alt_phone": "+34917909930",
      "street": "Calle del Postigo de San Martín 8",
      "address_addition": "Cerca de la plaza Santa Ana",
      "city": "Madrid",
      "state": "Madrid",
      "country": "ES",
      "postcode": "28013",
      "price": 500,
      "tax_rate": 2100,
      "name": "Planet Express",
      "discount": 100
    },
    "articles": [
      {
        "id": "59825349042875546873",
        "name": "N°5 eau premiere spray",
        "description": "A decidedly lighter, fresher...",
        "url": "http://www.chanel.com...",
        "image_url": "http://www.chanel.com...",
        "quantity": 1,
        "price": 29000,
        "tax_rate": 2100
      }
    ],
    "discount": 300,
    "currency": "EUR",
    "total_amount": 31080
  }
}
```

```http
HTTP/1.1 204 No Content
Content-Type: application/vnd.aplazame.v1+json
```


```shell
$ curl "https://api.aplazame.com/orders/:orderId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-" \
    -X PUT \
    --data-binary '{
      "order": {
        "shipping": {
          "first_name": "Hobbes",
          "last_name": "Watterson",
          "phone": "616123456",
          "alt_phone": "+34917909930",
          "street": "Calle del Postigo de San Martín 8",
          "address_addition": "Cerca de la plaza Santa Ana",
          "city": "Madrid",
          "state": "Madrid",
          "country": "ES",
          "postcode": "28013",
          "price": 500,
          "tax_rate": 2100,
          "name": "Planet Express",
          "discount": 100
        },
        "articles": [
          {
            "id": "59825349042875546873",
            "name": "N°5 eau premiere spray",
            "description": "A decidedly lighter, fresher...",
            "url": "http://www.chanel.com...",
            "image_url": "http://www.chanel.com...",
            "quantity": 1,
            "price": 29000,
            "tax_rate": 2100
          }
        ],
        "discount": 300,
        "currency": "EUR",
        "total_amount": 31080
      }
    }'
```

```python
import aplazame_sdk

payload = {
  "order": {
    "shipping": {
      "first_name": "Hobbes",
      "last_name": "Watterson",
      "phone": "616123456",
      "alt_phone": "+34917909930",
      "street": "Calle del Postigo de San Martín 8",
      "address_addition": "Cerca de la plaza Santa Ana",
      "city": "Madrid",
      "state": "Madrid",
      "country": "ES",
      "postcode": "28013",
      "price": 500,
      "tax_rate": 2100,
      "name": "Planet Express",
      "discount": 100
    },
    "articles": [
      {
        "id": "59825349042875546873",
        "name": "N°5 eau premiere spray",
        "description": "A decidedly lighter, fresher...",
        "url": "http://www.chanel.com...",
        "image_url": "http://www.chanel.com...",
        "quantity": 1,
        "price": 29000,
        "tax_rate": 2100
      }
    ],
    "discount": 300,
    "currency": "EUR",
    "total_amount": 31080
  }
}

client = aplazame_sdk.Client('->AccessToken<-')

response = client.update(':orderId', payload)
```

`PUT https://api.aplazame.com/orders/:orderId`

If you want to update an order, this is the service you need.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
:orderId | string | String `id` of the order to perform action with.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
[order](#order) | object | yes | Order to update.


## History

```http
POST /orders/:orderId/history HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

[{
  "id": "18857527248912279381",
  "amount": 12080,
  "due": "",
  "status": "cancelled",
  "type": "paypal",
  "order_date": "2014-03-21T13:56:45+0000",
  "currency": "EUR",
  "billing": null,
  "shipping": {
    "first_name": "Hobbes",
    "last_name": "Watterson",
    "phone": "616123456",
    "alt_phone": "+34917909930",
    "street": "Calle del Postigo de San Martín 8",
    "address_addition": "Cerca de la plaza Santa Ana",
    "city": "Madrid",
    "state": "Madrid",
    "country": "ES",
    "postcode": "28013",
    "price": 500,
    "tax_rate": 2100,
    "name": "Planet Express",
    "discount": 100
  }
}]
```

```http
HTTP/1.1 204 No Content
Content-Type: application/vnd.aplazame.v1+json
```


```shell
$ curl "https://api.aplazame.com/orders/:orderId/history" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-" \
    -X POST \
    --data-binary '[
      {
        "id": "18857527248912279381",
        "amount": 12080,
        "due": "",
        "status": "cancelled",
        "type": "paypal",
        "order_date": "2014-03-21T13:56:45+0000",
        "currency": "EUR",
        "shipping": {
          "first_name": "Hobbes",
          "last_name": "Watterson",
          "phone": "616123456",
          "alt_phone": "+34917909930",
          "street": "Calle del Postigo de San Martín 8",
          "address_addition": "Cerca de la plaza Santa Ana",
          "city": "Madrid",
          "state": "Madrid",
          "country": "ES",
          "postcode": "28013",
          "price": 500,
          "tax_rate": 2100,
          "name": "Planet Express",
          "discount": 100
        }
      }
    ]'
```

```python
import aplazame_sdk

payload = [
  {
    "id": "18857527248912279381",
    "amount": 12080,
    "due": "",
    "status": "cancelled",
    "type": "paypal",
    "order_date": "2014-03-21T13:56:45+0000",
    "currency": "EUR",
    "billing": None,
    "shipping": {
      "first_name": "Hobbes",
      "last_name": "Watterson",
      "phone": "616123456",
      "alt_phone": "+34917909930",
      "street": "Calle del Postigo de San Martín 8",
      "address_addition": "Cerca de la plaza Santa Ana",
      "city": "Madrid",
      "state": "Madrid",
      "country": "ES",
      "postcode": "28013",
      "price": 500,
      "tax_rate": 2100,
      "name": "Planet Express",
      "discount": 100
    }
  }
]

client = aplazame_sdk.Client('->AccessToken<-')

response = client.history(':orderId', payload)
```


`POST https://api.aplazame.com/orders/:orderId/history`

When a checkout process begins, a request is sent to our server with the information of the history of the customer. It is recommended to make an asynchronous request not to delay the loading of the template.

If you do not have asynchronous technology, you can develop your own REST service and your server with our own client with your private key.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
:orderId | string | String `id` of the order to perform action with.


### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | String `id` of the order to perform action with.
amount | [decimal](#decimals) | yes | Order amount.
due | [decimal](#decimals) | no | The total amount due of the order.
status | string | yes | Order status, the choices are `pending`, `cancelled`, `processing` and `complete`.
type | string | yes | Order type.
order_date | string | yes | The date of the order.
currency | [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
[billing](#billing-address) | object | no | Order billing.
[shipping](#shipping-info) | object | no | Order shipping.
