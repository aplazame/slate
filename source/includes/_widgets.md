# + Widgets

Before you use a widget, you must import aplazame-js and configure [options](#3-steps-to-checkout-v2).

## ○ Frontend

```html
<div data-aplazame-simulator=""
    data-amount="12050"
    data-price="form.details [itemprop='price']"
    data-qty="form.details input[name='qty']"
    data-view="product"
    data-currency="EUR">
</div>
```

`GET https://api.aplazame.com/instalment-plan-simulator?amount=12050&view=product&currency=EUR`

### Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
amount | [decimal](#decimals)  | yes | order amount.
price | [selector](http://www.w3schools.com/cssref/css_selectors.asp) | no | CSS selector to price.
qty | [selector](http://www.w3schools.com/cssref/css_selectors.asp) | no | CSS selector to product quantity form field.
currency | [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | no | Currency code of the order.
view | select | no | Choices are `product`, `cart`.
country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | no | Country code.
locale | [ISO 639](https://en.wikipedia.org/wiki/ISO_639) & [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | no | l10n, widget localization.

![Widget](https://cloud.githubusercontent.com/assets/5514990/11610272/bb025c48-9b9d-11e5-8e3f-aa07f0b46245.png)


## + API REST


## ○ Detail

```http
GET /merchants/:merchantId/widgets/:viewId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
    "id": "84d7dd7a5e20473cad8da25f29d065a2",
    "type": "button",
    "preferences": {
        "branding": true,
        "align": "left",
        "bg_color": "#bd1b9a",
        "text_color": "#b7bea1"
    },
    "disabled": null,
    "created": "2016-03-16T09:04:18.083832"
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/widgets/:viewId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.widget(':viewId')
```

`GET https://api.aplazame.com/merchants/:merchantId/widgets/:viewId`

To retrieve widgets options.

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | string | String `id` of the merchant to perform action with.
:viewId | select | Choices are `product` or `cart`.



## ○ Update

```http
PUT /merchants/:merchantId/widgets/:viewId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
    "type": "button",
    "preferences": {
        "branding": false,
        "align": "right",
        "bg_color": "#54a974",
        "text_color": "#b27604"
    }
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
    "id": "84d7dd7a5e20473cad8da25f29d065a2",
    "type": "button",
    "preferences": {
        "branding": false,
        "align": "right",
        "bg_color": "#54a974",
        "text_color": "#b27604"
    },
    "disabled": null,
    "created": "2016-03-16T09:04:18.083832"
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/widgets/:viewId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X PUT\
    --data-binary '{
        "type": "button",
        "preferences": {
            "branding": false,
            "align": "right",
            "bg_color": "#54a974",
            "text_color": "#b27604"
        }
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.put_widget(':merchantId', ':viewId', {
    'type': 'button',
    'preferences': {
        'branding': False,
        'align': 'right',
        'bg_color': '#54a974',
        'text_color': '#b27604'
    }
})
```

`PUT https://api.aplazame.com/merchants/:merchantId/widgets/:viewId`

To update widgets.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
type | select | yes | Choices are `button` (preferences) and `raw` (styles).
preferences | obj | if `type` is `button` | Widget preferences.
preferences.branding | select | yes | Determines if the branding is displayed.
preferences.align | select | yes | Widget align, choices are `center`, `left`, `right`, `fill`.
preferences.bg_color | [css color](http://www.w3schools.com/cssref/css_colors.asp) | yes | Background color.
preferences.text_color | [css color](http://www.w3schools.com/cssref/css_colors.asp) | yes | Text color.
styles | obj | if `type` is `raw` | CSS styles.



## ○ Partial update

```http
PATCH /merchants/:merchantId/widgets/:viewId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
    "preferences": {
        "branding": false
    }
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
    "id": "84d7dd7a5e20473cad8da25f29d065a2",
    "type": "button",
    "preferences": {
        "branding": false,
        "align": "left",
        "bg_color": "#bd1b9a",
        "text_color": "#b7bea1"
    },
    "disabled": null,
    "created": "2016-03-16T09:04:18.083832"
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/widgets/:viewId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X PATCH\
    --data-binary '{
        "preferences": {
            "branding": false
        }
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.patch_widget(':merchantId', ':viewId', {
    'preferences': {
        'branding': False
    }
})
```

`PATCH https://api.aplazame.com/merchants/:merchantId/widgets/:viewId`

To update partial widgets.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
type | select | no | Choices are `button` (preferences) and `raw` (styles).
preferences | obj | if `type` is `button` | Widget preferences.
preferences.branding | select | no | Determines if the branding is displayed.
preferences.align | select | no | Widget align, choices are `center`, `left`, `right`, `fill`.
preferences.bg_color | [css color](http://www.w3schools.com/cssref/css_colors.asp) | no | Background color.
preferences.text_color | [css color](http://www.w3schools.com/cssref/css_colors.asp) | no | Text color.
styles | obj | if `type` is `raw` | CSS styles.



## ○ Enable

```http
POST /merchants/:merchantId/widgets/:viewId/enable HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 204 No Content
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/widgets/:viewId/enable" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X POST
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.enable_widget('viewId')
```

`POST https://api.aplazame.com/merchants/:merchantId/widgets/:viewId/enable`

To enable widget.

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | string | String `id` of the merchant to perform action with.
:viewId | select | Choices are `product` or `cart`.



## ○ Disable

```http
POST /merchants/:merchantId/widgets/:viewId/disable HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 204 No Content
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/widgets/:viewId/disable" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X POST
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.disable_widget('viewId')
```

`POST https://api.aplazame.com/merchants/:merchantId/widgets/:viewId/disable`

To disable widget.

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | string | String `id` of the merchant to perform action with.
:viewId | select | Choices are `product` or `cart`.
