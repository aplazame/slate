# 3 Steps to Checkout v2

> How to import

```html
<script
  type="text/javascript"
  src="https://aplazame.com/static/aplazame.min.js"
  data-aplazame="publicKey: ->AccessToken<-"
  data-version="1.2"
  data-sandbox="true"></script>
```

### Script options

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
publicKey | hash | yes | your public ->AccessToken<-.
version | float | no | Api.Checkout version, by default is 1.2
sandbox | boolean | no | Determines if the request is in sandbox mode.

## 1 Button

> How to use it

```html
<button type="button"
  data-amount="12050"
  data-currency="EUR"
  data-country="ES"></button>

<div data-aplazame-payment-info="">lorem ipsum...</div>
```

> you can use js directly

```js
aplazame.button({
  button: '#some-button-or-wrapper-id'  // accepts any valid css selector
  amount: 12050,
  currency: 'EUR',
  country: 'ES'
});
```

> you can even check by amount

```js
aplazame.button.check(12050, 'EUR', 'ES', function (allowed) { /* your code */ });
```

Start by including in the payment method selection menu a script that checks, through our API, whether the request can be processed.

### Button parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
amount | [decimal](#decimals)  | yes | Order total amount.
currency | [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | no | Country code.
parent | selector | no | Parent tag to hide, "*" for the first parent node.

Take your button **image** [here](#buttons)!!

### Allowed countries

* Spain (ES)


## 2 Checkout


> How to use it

```js
aplazame.checkout({
  "toc": true,
  "order": {},
  "customer": {},
  "billing": {},
  "shipping": {},
  "meta": {},
  "merchant": {
    "confirmation_url": "/CONFIRM-STEP-3",
    "cancel_url": "/",
    "success_url": "/",
    "checkout_url": "/"
  }
});
```

Once your ecommerce is registered in our system, you can integrate the payment method including a javascript code in your template.


### Checkout parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
[merchant](#merchant) | object | yes | Your merchant data.
[customer](#customer) | object | yes | Checkout customer.
[order](#order) | object | yes | Your order data.
[billing](#billing-address) | object | no | Billing address.
[shipping](#shipping-info) | object | yes | Shipping info.
meta | json | no | SDK-Client info.


## 3 Confirm

```http
POST /confirmation_url HTTP/1.1

{
  "checkout_token": ":orderId"
}
```


```http
POST /orders/:orderId/authorize HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "id": ":orderId",
  "amount": 12050
}
```

```shell
$ curl "https://api.aplazame.com/orders/:orderId/authorize" \
    -H "Accept: application/vnd.aplazame.sandbox.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-" \
    -X POST
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.authorize(':orderId')
```

`POST https://api.aplazame.com/orders/:orderId/authorize`

Once you have completed the checkout process, the client JS will send a signal to the URL of his backend `confirmation_url` which will in turn send a request to this service to validate the order. Our server will respond with the total order and its corresponding ID, the same we were provided with during the integration.


### Workflow

`CHECKOUT --(POST/ID)--> Confirm --(POST/ID)--> API /authorize`


### Authorize request Url parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the order to perform action with.

### Help

If you have any doubt about how to communicate with our API services, read the **[docs](#making-requests)** or [contact us](mailto:soporte@aplazame.com?subject=I have a doubt).

### Confirm example

<pre class="highlight pseudo"><code><span class="na">FUNTION</span> confirm(request):
  <span class="na">SET</span> orderId <span class="na">to</span> request.POST['checkout_token']
  <span class="na">SET</span> order <span class="na">to</span> Session(orderId)

  <span class="na">IF</span> order not found <span class="na">THEN</span>:
    <span class="na">RETURN</span> <span class="se">Response(status_code = 404)</span>
  <span class="na">END IF</span>

  <span class="na">SET</span> client <span class="na">to</span> aplazameAPIClient()

  <span class="na">IF</span> is_sandbox <span class="na">THEN</span>:
    <span class="na">SET</span> client.headers[Accept] <span class="na">to</span> application/vnd.aplazame.sandbox.v1+json
  <span class="na">ELSE:</span>
    <span class="na">SET</span> client.headers[Accept] <span class="na">to</span> application/vnd.aplazame.v1+json
  <span class="na">END IF</span>
  
  <span class="na">SET</span> client.headers[Authorization] <span class="na">to</span> Bearer PrivateKey
  <span class="na">SET</span> response <span class="na">to</span> client.post(https://api.aplazame.com/orders/:orderId/authorize)

  <span class="na">IF</span> response.status_code = 200 <span class="na">AND</span> response.amount = order.total <span class="na">THEN</span>:
    <span class="na">SET</span> order.confirmed <span class="na">to</span> TRUE
    <span class="na">RETURN</span> <span class="ok">Response(status_code = 200/204)</span>
  <span class="na">ELSE:</span>
    <span class="na">RETURN</span> <span class="se">Response(status_code >= 400)</span>
  <span class="na">END IF</span>
<span class="na">END FUNTION</span>
</code></pre>
