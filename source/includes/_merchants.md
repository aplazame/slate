# + Merchants

## List

```http
GET /merchants HTTP/1.1
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
    "next": "https://api.aplazame.com/merchants?page=3",
    "previous": "https://api.aplazame.com/merchants?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.merchants()
```

`GET https://api.aplazame.com/merchants`

To retrieve merchant queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Merchant queryset.



## Detail

```http
GET /merchants/<ID> HTTP/1.1
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
$ curl "https://api.aplazame.com/merchants/<ID>" \
    -H "Accept: application/vnd.aplazame-v1+json" \
    -H "Authorization: Bearer <ACCESS_TOKEN>"
```

```python
from aplazame_sdk import Client

client = Client('access_token')
response = client.merchant_detail('<ID>')
```

`GET https://api.aplazame.com/merchants/<ID>`

If you want to check the status of an merchant, this is the service you need.

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
ID | string | String `id` of the merchant to perform action with.


### Response

Parameter | Type | Description
--------- | ---- | -----------
id | object | Merchant id,
... | ... | ...
