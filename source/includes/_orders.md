# Orders

Aplazame has a range of API services required for a complete integration as a method of payment in your ecommerce.

The requests must include the private key in the [header Authorization](#authentication) as indicated in the protocol [Oauth2](http://en.wikipedia.org/wiki/OAuth).

Before making requests , make sure that the header Accept of your client API matches the [version](#versioning) and the format in which you want to establish communication (json, xml, yaml).



## List

```http
GET /orders HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

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
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.orders()
```

`GET http://api.aplazame.com/orders`

To retrieve order queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Order queryset.



## Detail

```http
GET /orders/<ID> HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "id": "<ID>",
  "...": "..."
}
```

```shell
$ curl "https://api.aplazame.com/orders/<ID>" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.order_detail('<ID>')
```

`GET http://api.aplazame.com/orders/<ID>`

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
POST /orders/<ID>/cancel HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "success": true
}
```


```shell
$ curl "https://api.aplazame.com/orders/<ID>/cancel" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
    -X POST
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.cancel('<ID>')
```

`POST http://api.aplazame.com/orders/<ID>/cancel`

Service in charge of canceling an order. Note that once the order has been cancelled it may not be modified.

### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.




## Refund

> Check (GET) and refund (POST)

```http
GET /orders/<ID>/refund HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "remaining_amount": 70070
}
```

```http
POST /orders/<ID>/refund HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
Host: api.aplazame.com

{
  "amount": 10050
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "remaining_amount": 60020
}
```

```shell
$ curl "https://api.aplazame.com/orders/<ID>/refund" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```shell
$ curl "https://api.aplazame.com/orders/<ID>/refund" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
    -X POST \
    -d "amount=10050"
```

```python
from aplazame_sdk import Client

client = Client('access_token')

# Check
response = client.refund_check('<ID>')

# ...and refund
response = client.refund('<ID>', 10050)
```

### Check remaining amount

`GET http://api.aplazame.com/orders/<ID>/refund`

### Refund

`POST http://api.aplazame.com/orders/<ID>/refund`


### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.


### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
amount | integer | yes | The amount to refund.


### Response

Parameter | Type | Description
--------- | ---- | -----------
remaining_amount | integer | The remaining order amount.



## Partial update


```http
PATCH /orders/<ID> HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
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
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "success": true
}
```

```shell
$ curl "https://api.aplazame.com/orders/<ID>" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
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

client = Client('access_token')
response = client.update('<ID>', payload, partial=True)
```

`PATCH http://api.aplazame.com/orders/<ID>`

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
PUT /orders/<ID> HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
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
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "success": true
}
```

```shell
$ curl "https://api.aplazame.com/orders/<ID>" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
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

client = Client('access_token')
response = client.update('<ID>', payload)
```

`PUT http://api.aplazame.com/orders/<ID>`

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
POST /orders/<ID>/history HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
Host: api.aplazame.com

{
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
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "success": true
}
```

```shell
$ curl "https://api.aplazame.com/orders/<ID>/history" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
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

client = Client('access_token')
response = client.history('<ID>', payload)
```


`POST http://api.aplazame.com/orders/<ID>/history`

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
amount | integer | yes | Order amount.
due | integer | no | The total amount due of the order.
status | string | yes | Order status, the choices are pending, cancelled, processing and complete.
type | string | yes | Order type.
order_date | string | yes | The date of the order.
currency | string [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
[billing](#billing-address) | object | no | Order billing.
[shipping](#shipping-info) | object | no | Order shipping.

