# + Customers

## List

```http
GET /customers HTTP/1.1
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
    "next": "https://api.aplazame.com/customers?page=3",
    "previous": "https://api.aplazame.com/customers?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/customers" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
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



## - Filtering

```http
GET /customers?param=value HTTP/1.1
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
    "next": "https://api.aplazame.com/customers?page=3&param=value",
    "previous": "https://api.aplazame.com/customers?page=1&param=value"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/customers?param=value" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.customers(param='value')
```

`GET https://api.aplazame.com/customers?param=value`

To retrieve customer queryset filtered.


### by fields

Parameter | Type | Lookup | Description
--------- | ---- | ------ | -----------
id | hash | equal | Same customer `ID`.
phone | number | equal | Same customer mobile phone number.
created_until | datetime |  before | Results with customer's created in Aplazame `before` than the specified datetime.
created_since | datetime |  after | Results with customer's created in Aplazame `after` than the specified datetime.
document_id | string | equal | Same customer document id number, the choices are 01:NIF, 02:NIE, 03:CIF, 04: Passport, 05:others.
document_id_type | string | equal | Same customer document id type.
document_id_country | string [ISO 3166-1](http://es.wikipedia.org/wiki/ISO_3166-1) | equal | Same customer document id country.




## - Searching

```http
GET /customers?q=param1,param2 HTTP/1.1
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
    "next": "https://api.aplazame.com/customers?page=3&q=param1,param2",
    "previous": "https://api.aplazame.com/customers?page=1&q=param1,param2"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/customers?q=param1,param2" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.customers(q='param1,param2')
```

`GET https://api.aplazame.com/customers?q=param1,param2`

To search customer queryset.

Aplazame API allows a list of field names that will be searched whenever somebody submits a search query param `q`.

Searches will use case-insensitive partial matches. The search parameter may contain multiple search terms, which should be whitespace and/or comma separated. If multiple search terms are used then objects will be returned in the list only if all the provided terms are matched.

### Fields

Parameter | Description
--------- | -----------
full_name | The customer full name.


## - Ordering

```http
GET /customers?ordering=param1,-param2 HTTP/1.1
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
    "next": "https://api.aplazame.com/customers?page=3&ordering=param1,-param2",
    "previous": "https://api.aplazame.com/customers?page=1&ordering=param1,-param2"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/customers?ordering=param1,-param2" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.customers(ordering='param1,-param2')
```

`GET https://api.aplazame.com/customers?ordering=param1,-param2`

To retrieve customer queryset oredered.

The ordering param is a tuple or list of strings. Each string is a field name with an optional `-` prefix, which indicates descending order. Fields without a leading `-` will be ordered ascending. 

### order by...

Parameter | Type | Description
--------- | ---- | -----------
created | datetime | A datetime designating when the customer was created.



## Detail

```http
GET /customers/<ID> HTTP/1.1
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
$ curl "https://api.aplazame.com/customers/<ID>" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.customer_detail('<ID>')
```

`GET https://api.aplazame.com/customers/<ID>`

If you want to check the status of an customer, this is the service you need.

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the customer to perform action with.


### Response

Parameter | Type | Description
--------- | ---- | -----------
id | object | Customer id,
... | ... | ...
