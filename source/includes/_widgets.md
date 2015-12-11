# Widgets

Before you use a widget, you must import aplazame-js and configure it with the [option list](#3-steps-to-checkout-v2).

## Simulator

```html
<div data-aplazame-simulator=""
    data-amount="12050"
    data-price="form.details [itemprop='price']"
    data-qty="form.details input[name='qty']">
</div>
```

`GET https://api.aplazame.com/instalment-plan-simulator?amount=12050`

### Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
amount | [decimal](#decimals)  | yes | order amount.
price | selector | no | CSS selector to price.
qty | selector | no | CSS selector to product quantity form field.
currency | [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | no | Currency code of the order.
country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | no | Country code.
locale | [ISO 639](https://en.wikipedia.org/wiki/ISO_639) & [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | no | l10n, widget localization.

![Widget](https://cloud.githubusercontent.com/assets/5514990/11610272/bb025c48-9b9d-11e5-8e3f-aa07f0b46245.png)
