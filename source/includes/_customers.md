# + Customers

## List

```http
GET /customers HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')

response = client.customers()
```

`GET https://api.aplazame.com/customers`

To retrieve customer queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Customer queryset.



## ○ Filter

```http
GET /customers?param=value HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers?param=value" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customers({
  'param': 'value'
})
```

`GET https://api.aplazame.com/customers?param=value`

To retrieve customer queryset filtered.

**Filters lookups** are listed **[HERE](#filters)**, `string`, `choices`, `range`, `isnull` and `date`.

### by customer

> Phone number exact

```http
GET /customers?phone_number=612345678 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers?phone_number=612345678" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customers({
  'phone_number': '612345678'
})
```


Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
id | hash | `string` | Customer `ID`.
phone_number | string | `string` | Customer mobile phone number.
phone_country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer phone country.
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | `date`, `range` | A datetime designating when the customer was created.


### by document id

> Document ID type, choices are nif OR nie

```http
GET /customers?document_id-type=nif&document_id-type=nie HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers?document_id-type=nif&document_id-type=nie" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customers({
  'document_id-type': ['nif', 'nie']
})
```

Parameter | Type | Filters | Description
--------- | ---- | ------- | -----------
document_id-number | string | `string` | Customer document id number.
document_id-country | [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | `string` | Customer document id country.
document_id-type | string | `choices` | Customer document id type, the choices are `nif`, `nie`, `cif`, `passport`, `others`.


## ○ Search

```http
GET /customers?q=param1,param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers?q=param1,param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customers({
  'q': 'param1,param2,...'
})
```

`GET https://api.aplazame.com/customers?q=param1,param2,...`

To search customer queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

> Search by name

```http
GET /customers?q=Alice HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers?q=Alice" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customers({
  'q': 'Alice'
})
```

Parameter | Description
--------- | -----------
full_name | The customer full name.


## ○ Order

```http
GET /customers?ordering=param1,-param2,... HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers?ordering=param1,-param2,..." \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customers({
  'ordering': 'param1,-param2,...'
})
```

`GET https://api.aplazame.com/customers?ordering=param1,-param2,...`

To retrieve customer queryset oredered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending.

### order by...

```http
GET /customers?ordering=-created HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```shell
$ curl "https://api.aplazame.com/customers?ordering=-created" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customers({
  'ordering': '-created'
})
```

Parameter | Type | Description
--------- | ---- | -----------
created | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | A datetime designating when the customer was created.



## Detail

```http
GET /customers/:customerId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "id": ":customerId",
  "...": "..."
}
```

```shell
$ curl "https://api.aplazame.com/customers/:customerId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
response = client.customer_detail(':customerId')
```

`GET https://api.aplazame.com/customers/:customerId`

If you want to check the status of an customer, this is the service you need.

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:customerId | string | String `id` of the customer to perform action with.


### Response

Parameter | Type | Description
--------- | ---- | -----------
id | object | Customer id,
... | ... | ...
