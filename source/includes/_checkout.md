# 3 Steps to Checkout

## 1 Button

> How to import

```html
<script type="text/javascript" src="https://api.aplazame.com/static/v1/js/button.js"></script>
```

> How to use it

```javascript
aplazame.button({
  id: "CONTAINER_ID",
  token: "<ACCESS_TOKEN>",
  amount: 12050,
  currency: "EUR",
  sandbox: true
});
```

En el menú de selección de métido de pago debes incluir un script que comprueba a través de nuestro servicio API si el pedido puede ser procesado.

![Button](https://aplazame.com/static/img/docs/button.png)

### Button parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | Html container id.
token | hash | yes | Your public API key.
amount | integer | yes | Order total amount.
currency | string [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
sandbox | boolean | no | Determines if the request is in sandbox mode.

## 2 Checkout

> How to import

```html
<script type="text/javascript" src="https://api.aplazame.com/static/v1/js/aplazame.js"></script>
```

> How to use it

```javascript
aplazame.checkout({
  "toc": true,
  "merchant": ... ,
  "customer": ... ,
  "billing": ... ,
  "shipping": ... ,
  "order": ... ,
  "meta": {
    "version": "1.0.1",
    "name": "the cow and python developers"
  }
});
```

Once your ecommerce is registered in our system, you can integrate the payment method including a javascript code in your template.

### Script versioning

The import of the script must be performed according to the version of API being used `.../<VERSION>/js/aplazame.js`.


### Script Sandbox

If you want to work in the sandbox mode, include the parameter `...js/aplazame.js?sandbox=true` in the URL of import.

### Checkout parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
[merchant](#merchant) | object | yes | Your merchant data.
[customer](#customer) | object | yes | Checkout customer.
[order](#order) | object | yes | Your order data.
[articles](#article) | collection | yes | Articles in cart.
[billing](#billing-address) | object | no | Billing address.
[shipping](#shipping-info) | object | yes | Shipping info.
meta | json | no | SDK-Client info.



## 3 Authorize

```http
POST /orders/<ID>/authorize HTTP/1.1
Accept: application/vnd.aplazame-v1+json
Authorization: Bearer <ACCESS_TOKEN>
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame-v1+json

{
  "id": "<ID>",
  "total_amount": "<ORDER_AMOUNT>"
}
```

```shell
$ curl "https://api.aplazame.com/orders/<ID>/authorize" \
    -H "Accept: application/vnd.aplazame.sandbox-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
    -X POST
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.authorize('<ID>')
```

`POST http://api.aplazame.com/orders/<ID>/authorize`

Once you have completed the checkout process, the client JS will send a signal to the URL of his backend `confirmation_url` which will in turn send a request to this service to validate the order. Our server will respond with the total order and its corresponding ID, the same we were provided with during the integration.


### Workflow

`CHECKOUT -- <ID> --> YOU (Confirmation url)`

`YOU -- <ID> + Private Key --> APLAZAME API`


### Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.


Si tienes alguna duda de cómo comunicarte con nuestros servicios API, revisa la **[documentación](#making-requests)**.