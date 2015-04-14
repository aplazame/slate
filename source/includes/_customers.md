# Customers

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

`GET http://api.aplazame.com/customers`

To retrieve customer queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Customer queryset.



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

`GET http://api.aplazame.com/customers/<ID>`

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
