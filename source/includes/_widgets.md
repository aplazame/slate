# Widgets

Before you use a widget, you must import aplazame-js and configure it with the [option list](#3-steps-to-checkout-v2).

## Simulator

```html
<div data-aplazame-simulator="normal"
	data-template="info-default-editable"
	data-theme="light"
	data-num-instalments="4"
	data-amount="12050"
	data-currency="EUR"
	data-country="ES"
	data-custom-styles="style[data-aplazame-simulator]"
	data-locale="es_ES">
</div>
```

`GET https://api.aplazame.com/instalment-plan-simulator`

### Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
amount | [decimal](#decimals)  | yes | Order amount.
currency | [ISO 4217](http://es.wikipedia.org/wiki/ISO_4217) | yes | Currency code of the order.
country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | no | Country code.
num-instalments | integer | no | Num of instalments selected.
locale | [ISO 639](https://en.wikipedia.org/wiki/ISO_639) & [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | no | l10n, widget localization.


![Widget](https://cloud.githubusercontent.com/assets/5514990/11610272/bb025c48-9b9d-11e5-8e3f-aa07f0b46245.png)

### Styles Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
aplazame-simulator | select | no | Widget size, the options are `small|normal|big`.
template | string | no | Defines the template, by default is `info-default-editable`.
theme | select | no | Widget theme, `light|dark`.
custom-styles | selector | no | Selector to widget's styles.
