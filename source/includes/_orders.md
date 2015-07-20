# + Orders

Aplazame has a range of API services required for a complete integration as a method of payment in your ecommerce.

The requests must include the private key in the [header Authorization](#authentication) as indicated in the protocol [Oauth2](http://en.wikipedia.org/wiki/OAuth).

Before making requests , make sure that the header Accept of your client API matches the [version](#versioning) and the format in which you want to establish communication (json, xml, yaml).



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
from aplazame_sdk import Client

client = Client('->AccessToken<-')

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


## ○ Filtering

```http
GET /orders?param=value HTTP/1.1
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
    "next": "https://api.aplazame.com/orders?page=3&param=value",
    "previous": "https://api.aplazame.com/orders?page=1&param=value"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/orders?param=value" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
from aplazame_sdk import Client

client = Client('->AccessToken<-')

response = client.orders({
  'param': 'value'
})
```

`GET https://api.aplazame.com/orders?param=value`

To retrieve order queryset filtered.

### by order

Parameter | Type | Lookup | Description
--------- | ---- | ------ | -----------
id | hash | equal | Same Aplazame order `ID`. 
mid | string | equal | Same order `ID` in your merchant. 
total_amount | float | equal | Same order total amount.
min_amount | float | greater | With total_amount `greater` than the specified.
max_amount | float | less | With total_amount `less` than the specified.
min_discount | float | greater | With discount `greater` than the specified.
max_discount | float | less | With discount `less` than the specified.
created_since | datetime | after | Created `after` than the specified datetime.
created_until | datetime | before | Created `before` than the specified datetime.
verified_since | datetime | after | Verified `after` than the specified datetime.
verified_until | datetime | before | Verified `before` than the specified datetime.
confirmed_since | datetime | after | Confirmed `after` than the specified datetime.
confirmed_until | datetime | before | Confirmed `before` than the specified datetime.
cancelled_since | datetime | after | Cancelled `after` than the specified datetime.
cancelled_until | datetime | before | Cancelled `before` than the specified datetime.

### by customer

Parameter | Type | Lookup | Description
--------- | ---- | ------ | -----------
customer_id | hash | equal | Same ustomer `ID`.
customer_phone | number | equal | Same customer mobile phone number.
customer_created_until | datetime |  before | Results with customer's created in Aplazame `before` than the specified datetime.
customer_created_since | datetime |  after | Results with customer's created in Aplazame `after` than the specified datetime.
document_id | string | equal | Same customer document id number, the choices are 01:NIF, 02:NIE, 03:CIF, 04: Passport, 05:others.
document_id_type | string | equal | Same customer document id type.
document_id_country | string [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | equal | Same customer document id country.


### by account

Parameter | Type | Lookup | Description
--------- | ---- | ------ | -----------
account_id | hash |  equal | Same customer profile `ID`.
account_type | string |  equal | Same customer type, the choices are g:guest, n:new, e:existing.
account_gender | integer |  equal | Same customer gender, the choices are 0: not known, 1: male, 2:female, 3: not applicable.
account_last_login_until | datetime |  before | Results with customer's last login happens `before` than the specified datetime.
account_last_login_since | datetime |  after | Results with customer's last login happens `after` than the specified datetime.
account_date_joined_until | datetime |  before | Results with customer's created in your merchant `before` than the specified datetime.
account_date_joined_since | datetime |  after | Results with customer's created in your merchant `after` than the specified datetime.


## ○ Searching

```http
GET /orders?q=param1,param2 HTTP/1.1
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
    "next": "https://api.aplazame.com/orders?page=3&q=param1,param2",
    "previous": "https://api.aplazame.com/orders?page=1&q=param1,param2"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/orders?q=param1,param2" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
from aplazame_sdk import Client

client = Client('->AccessToken<-')

response = client.orders({
  'q': 'param1,param2'
})
```

`GET https://api.aplazame.com/orders?q=param1,param2`

To search order queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

Parameter | Description
--------- | -----------
account_first_name | The customer first name.
account_last_name | The customer last name.
account_email | The customer email.


## ○ Ordering

```http
GET /orders?ordering=param1,-param2 HTTP/1.1
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
    "next": "https://api.aplazame.com/orders?page=3&ordering=param1,-param2",
    "previous": "https://api.aplazame.com/orders?page=1&ordering=param1,-param2"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/orders?ordering=param1,-param2" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
from aplazame_sdk import Client

client = Client('->AccessToken<-')

response = client.orders({
  'ordering': 'param1,-param2'
})
```

`GET https://api.aplazame.com/orders?ordering=param1,-param2`

To retrieve order queryset ordered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending. 

### order by...

Parameter | Type | Description
--------- | ---- | -----------
total_amount | float | Order total amount.
created | datetime | A datetime designating when the order was created.
verified | datetime | A datetime designating when the order was verified.
confirmed | datetime | A datetime designating when the order was confirmed.
cancelled | datetime | A datetime designating when the order was cancelled.
confirmed | datetime | A datetime designating when the order was confirmed.
account_last_login | datetime | A datetime of the customer last login.
account_date_joined | datetime | A datetime designating when the customer account was created in your merchant.
account_created | datetime | A datetime designating when the customer account was created in Aplazame.




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
from aplazame_sdk import Client

client = Client('->AccessToken<-')

response = client.order_detail(':orderId')
```

`GET https://api.aplazame.com/orders/:orderId`

If you want to check the status of an order, this is the service you need.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.


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
from aplazame_sdk import Client

client = Client('->AccessToken<-')

response = client.cancel(':orderId')
```

`POST https://api.aplazame.com/orders/:orderId/cancel`

Service in charge of canceling an order. Note that once the order has been cancelled it may not be modified.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.




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
from aplazame_sdk import Client

client = Client('->AccessToken<-')

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
ID | string | String `id` of the order to perform action with.


### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
amount | float | yes | The amount to refund.


### Response

Parameter | Type | Description
--------- | ---- | -----------
remaining_amount | float | The remaining order amount.



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
from aplazame_sdk import Client

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

client = Client('->AccessToken<-')

response = client.update(':orderId', payload, partial=True)
```

`PATCH https://api.aplazame.com/orders/:orderId`

This service is used to partially modify the order, you choose if you want to change the shipping data, the billing or the cart.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.


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
      "zip": "28013",
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
          "zip": "28013",
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
from aplazame_sdk import Client

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
      "zip": "28013",
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

client = Client('->AccessToken<-')

response = client.update(':orderId', payload)
```

`PUT https://api.aplazame.com/orders/:orderId`

If you want to update an order, this is the service you need.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.

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
    "zip": "28013",
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
          "zip": "28013",
          "price": 500,
          "tax_rate": 2100,
          "name": "Planet Express",
          "discount": 100
        }
      }
    ]'
```

```python
from aplazame_sdk import Client

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
      "zip": "28013",
      "price": 500,
      "tax_rate": 2100,
      "name": "Planet Express",
      "discount": 100
    }
  }
]

client = Client('->AccessToken<-')

response = client.history(':orderId', payload)
```


`POST https://api.aplazame.com/orders/:orderId/history`

When a checkout process begins, a request is sent to our server with the information of the history of the customer. It is recommended to make an asynchronous request not to delay the loading of the template.

If you do not have asynchronous technology, you can develop your own REST service and your server with our own client with your private key.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.


### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | String `id` of the order to perform action with.
amount | float | yes | Order amount.
due | float | no | The total amount due of the order.
status | string | yes | Order status, the choices are pending, cancelled, processing and complete.
type | string | yes | Order type.
order_date | string | yes | The date of the order.
currency | string [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
[billing](#billing-address) | object | no | Order billing.
[shipping](#shipping-info) | object | no | Order shipping.

