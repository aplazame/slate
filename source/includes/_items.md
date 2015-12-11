# Checkout Items

## Merchant

```json
{
  "toc": true,
  "merchant": {
    "confirmation_url": "/confirm",
    "cancel_url": "/cancel",
    "success_url": "/success",
    "checkout_url": "/checkout"
  },
  "order": {},
  "customer": {},
  "billing": {},
  "shipping": {},
  "meta": {
    "module": {
      "name": "aplazame:module",
      "version": "2.0.0"
    }
    "version" "1.0.1"
  }
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
[confirmation_url](#3-confirm) | url | yes | url that the JS client sent to confirming the order.
cancel_url | url | yes | url that the customer is sent to if there is an error in the checkout.
success_url | url | yes | url that the customer is sent to after confirming their order.
checkout_url | url | no | url that the customer is sent to if the customer chooses to back to the eccommerce, by default is `/`.

<aside class="warning">
Aplazame does not allow different orders with the same ID.
</aside>

If you want to implement the `checkout_url` make sure that the user does not **return** with a second cart and the **same order ID**.

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
discount | [decimal](#decimals) | no | The discount amount of the order.
discount_rate | [decimal](#decimals) | no | The rate discount of the order.
cart_discount | [decimal](#decimals) | no | The discount amount of the cart.
cart_discount_rate | [decimal](#decimals) | no | The rate discount of the cart.
currency | [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
tax_rate | [decimal](#decimals) | yes | Order tax rate.
total_amount | [decimal](#decimals) | yes | Order total amount.
[articles](#article) | collection | yes | Articles in cart.


### Tax
Every item of the order must have a tax rate `tax_rate`. You can include this rate globally in `order.tax_rate` or you can choose to apply the rate to every item and shipping.

<aside class="notice">
The tax rate of every article or shipping overrides the global tax rate in case there is one.
</aside>


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
price | [decimal](#decimals) | yes | Article price (tax is not included).
tax_rate | [decimal](#decimals) | no | Article tax_rate.
discount | [decimal](#decimals) | no | The discount amount of the article.
discount_rate | [decimal](#decimals) | no | The rate discount of the article.


## Customer

```json
{
  "id": "1618",
  "email": "dev@aplazame.com",
  "address": {
    "phone": "616123456",
    "alt_phone": "+34917909930",
    "street": "Plaza del Angel nº10",
    "address_addition": "Cerca de la plaza Santa Ana",
    "city": "Madrid",
    "state": "Madrid",
    "country": "ES",
    "postcode": "28012"
  },
  "type": "e",
  "gender": 0,
  "first_name": "John",
  "last_name": "Coltrane",
  "date_joined": "2014-08-21T13:56:45+0000",
  "last_login": "2014-08-27T19:57:56+0000"
}
```

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | Customer `ID`.
email | string | yes | The customer email.
type | char | yes | Customer type, the choices are `g`:guest, `n`:new, `e`:existing.
gender | integer | yes | Customer gender, the choices are `0`: not known, `1`: male, `2`:female, `3`: not applicable.
first_name | string | no | Customer first name.
last_name | string | no | Customer last name.
birthday | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | no | Customer birthday.
language | [ISO 639-1](http://es.wikipedia.org/wiki/ISO_639-1) | no | Customer language preferences.
date_joined | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | no | A datetime designating when the customer account was created.
last_login | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | no | A datetime of the customer last login.
[address](#customer-address)  | [object](http://docs.aplazame.com/#customer-address) | no | Customer address.


## Customer Address


```json
{
  "phone": "616123456",
  "alt_phone": "+34917909930",
  "street": "Plaza del Angel nº10",
  "address_addition": "Cerca de la plaza Santa Ana",
  "city": "Madrid",
  "state": "Madrid",
  "country": "ES",
  "postcode": "28012"
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
country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | yes | Address country code.
postcode | string | yes | Address postcode.


## Billing address

```json
{
  "first_name": "Bill",
  "last_name": "Evans",
  "phone": "+34914298407",
  "alt_phone": null,
  "street": "Calle de Las Huertas 22",
  "address_addition": "Cerca de la pizzería",
  "city": "Madrid",
  "state": "Madrid",
  "country": "ES",
  "postcode": "28014"
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
country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | yes | Billing country code.
postcode | string | yes | Billing postcode code.

## Shipping info

```json
{
  "first_name": "Django",
  "last_name": "Reinhard",
  "phone": "616123456",
  "alt_phone": "+34917909930",
  "street": "Plaza del Angel nº10",
  "address_addition": "Cerca de la plaza Santa Ana",
  "city": "Madrid",
  "state": "Madrid",
  "country": "ES",
  "postcode": "28012",
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
country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | yes | Shipping country code.
postcode | string | yes | Shipping postcode code.
name | string | yes | Shipping name.
price | [decimal](#decimals) | yes | Shipping price (tax is not included).
tax_rate | [decimal](#decimals) | no | Shipping tax rate.
discount | [decimal](#decimals) | no | The discount amount of the shipping.
discount_rate | [decimal](#decimals) | no | The rate discount of the shipping.
