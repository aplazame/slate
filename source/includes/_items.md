# Checkout Items

## Merchant

```json
{
  "confirmation_url": "/confirm",
  "cancel_url": "/cancel",
  "success_url": "/success"
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
confirmation_url | url | yes | url that the JS client sent to confirming the order.
cancel_url | url | yes | url that the customer is sent to if the customer chooses to cancel the order.
success_url | url | yes | url that the customer is sent to after confirming their order.

### Confirm

Once the funding process is completed, a request is sent to the URL `confirmation-url` in which a request must be made to the service `/authorize` to verify the order.

### Success/Cancel Redirect

The user will be redirected to the Url `success_url` or `cancel_url` depending on the status in which the checkout process finishes.


## Order

```json
{
  "id": "28475648233786783165",
  "articles": [
    {
      "id": "89793238462643383279",
      "name": "Reloj en oro blanco de 18 quilates y diamantes",
      "quantity": 2,
      "price": 402000,
      "tax_rate": 2100,
      "discount_rate": 200,
      "description": "Movimiento de cuarzo de alta precisión.",
      "url": "http://www.chanel.com...",
      "image_url": "http://www.chanel.com..."
    }
  ],
  "discount": 16000,
  "currency": "EUR",
  "total_amount": 462000
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | Your order `ID`.
discount | integer | no | The discount amount of the order.
discount_rate | integer | no | The rate discount of the order.
cart_discount | integer | no | The discount amount of the cart.
cart_discount_rate | integer | no | The rate discount of the cart.
currency | string [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
tax_rate | integer | yes | Order tax rate.
total_amount | integer | yes | Order total amount.

### Tax
Every item of the order must have a tax rate `tax_rate`. You can include this rate globally in `order.tax_rate` or you can choose to apply the rate to every item and shipping.

<aside class="notice">
La tasa de impuesto a nivel de artículo o shipping sobreescribe la tasa de impuesto global de pedido en caso de que exista.
</aside>

## Customer

```json
{
  "id": "1618",
  "email": "dev@aplazame.com",
  "address": {
    "phone": "616123456",
    "alt_phone": "+34917909930",
    "street": "Calle del Postigo de San Martín 8",
    "address_addition": "Cerca de la plaza Santa Ana",
    "city": "Madrid",
    "state": "Madrid",
    "country": "ES",
    "zip": "28013"
  },
  "type": "e",
  "gender": 0,
  "first_name": "Bill",
  "last_name": "Watterson",
  "date_joined": "2014-08-21T13:56:45+0000",
  "last_login": "2014-08-27T19:57:56+0000"
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | Customer `ID`.
email | string | yes | The customer email.
type | char | yes | Customer type, the choices are g:guest, n:new, e:existing.
gender | integer | yes | Customer gender, the choices are 0: not known, 1: male, 2:female, 3: not applicable.
first_name | string | no | Customer first name.
last_name | string | no | Customer last name.
birthday | date | no | Customer birthday.
language | string [ISO 639-1](http://es.wikipedia.org/wiki/ISO_639-1) | no | Customer language preferences.
date_joined | datetime | no | A datetime designating when the customer account was created.
last_login | datetime | no | A datetime of the customer last login.
[address](#customer-address)  | object | no | Customer address.

## Customer Address


```json
{
  "phone": "616123456",
  "alt_phone": "+34917909930",
  "street": "Calle del Postigo de San Martín 8",
  "address_addition": "Cerca de la plaza Santa Ana",
  "city": "Madrid",
  "state": "Madrid",
  "country": "ES",
  "zip": "28013"
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
first_name | string | yes | Address first name.
last_name | string | yes | Address last name.
phone | string | no | Address phone number.
alt_phone | string | no | Address alternative phone.
street | string | yes | Address street.
address_addition | string | no | Address address addition.
city | string | yes | Address city.
state | string | yes | Address state.
country | string [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | yes | Address country code.
zip | string | yes | Address zip code.


## Article

```json
{
  "id": "89793238462643383279",
  "name": "Reloj en oro blanco de 18 quilates y diamantes",
  "quantity": 2,
  "price": 402000,
  "tax_rate": 2100,
  "discount_rate": 200,
  "description": "Movimiento de cuarzo de alta precisión",
  "url": "http://www.chanel.com...",
  "image_url": "http://www.chanel.com..."
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | The article `ID`.
name | string | yes | Article name.
description | string | no | Article description.
url | url | yes | Article url.
image_url | url | yes | Article image url.
quantity | integer | yes | Article quantity.
tax_rate | integer | no | Article tax_rate.
discount | integer | no | The discount amount of the article.
discount_rate | integer | no | The rate discount of the article.

## Billing address

```json
{
  "first_name": "Calvin",
  "last_name": "Watterson",
  "phone": "+34914298407",
  "alt_phone": null,
  "street": "Calle de Las Huertas 22",
  "address_addition": "Cerca de la pizzería",
  "city": "Madrid",
  "state": "Madrid",
  "country": "ES",
  "zip": "28014"
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
first_name | string | yes | Billing first name.
last_name | string | yes | Billing last name.
phone | string | no | Billing phone number.
alt_phone | string | no | Billing alternative phone.
street | string | yes | Billing street.
address_addition | string | no | Billing address addition.
city | string | yes | Billing city.
state | string | yes | Billing state.
country | string [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | yes | Billing country code.
zip | string | yes | Billing zip code.

## Shipping info

```json
{
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
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
first_name | string | yes | Shipping first name.
last_name | string | yes | Shipping last name.
phone | string | no | Shipping phone number.
alt_phone | string | no | Shipping alternative phone.
street | string | yes | Shipping street.
address_addition | string | no | Shipping address addition.
city | string | yes | Shipping city.
state | string | yes | Shipping state.
country | string [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | yes | Shipping country code.
zip | string | yes | Shipping zip code.
name | string | yes | Shipping name.
tax_rate | integer | no | Shipping tax rate.
discount | integer | no | The discount amount of the shipping.
discount_rate | integer | no | The rate discount of the shipping.
