# + Campaigns

## ○ List

```http
GET /merchants/:merchantId/campaigns?page=2 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "cursor": {
    "after": 3,
    "before": 1
  },
  "paging": {
    "count": 314,
    "next": "https://api.aplazame.com/merchants/:merchantId/campaigns?page=3",
    "previous": "https://api.aplazame.com/merchants/:merchantId/campaigns?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
# Merchant request
response = client.merchant_request('campaigns', ':merchantId')
# Current merchant
response = client.campaigns()
```

`GET https://api.aplazame.com/merchants/:merchantId/campaigns`

To retrieve campaigns queryset.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Campaigns queryset.


## ○ Create

```http
POST /merchants/:merchantId/campaigns HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "name": "Summertime",
  "start_date": "2016-06-01T00:00:00",
  "end_date": "2016-08-31T:23:59:59",
  "interest": "2500",
  "partial": true,
  "num_instalments": [1, 2, 3, 5, 8]
}
```

```http
HTTP/1.1 201 CREATED
Content-Type: application/vnd.aplazame.v1+json

{  
  "id": "c994e03e42d24be7bf6e1fcbad3334c0",
  "name": "Summertime",
  "slug": "summertime",
  "start_date": "2016-06-01T00:00:00",
  "end_date": "2016-08-31T:23:59:59",
  "interest": 2500,
  "partial": true,
  "num_instalments": [1, 2, 3, 5, 8],
  "created": "2016-03-10T11:08:57.265971"
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    --data-binary '{
      "name": "Summertime",
      "start_date": "2016-06-01T00:00:00",
      "end_date": "2016-08-31T:23:59:59",
      "interest": "2500",
      "partial": true,
      "num_instalments": [1, 2, 3, 5, 8]
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.post_campaign(':merchantId', {
  'name': 'Summertime',
  'start_date': '2016-06-01T00:00:00',
  'end_date': '2016-08-31T:23:59:59',
  'interest': '2500',
  'partial': True,
  'num_instalments': [1, 2, 3, 5, 8]
})
```

`POST https://api.aplazame.com/merchants/:merchantId/campaigns`

To create a campaign.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
name | string | yes | Campaign name.
start_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | yes | Date when the campaign begins.
end_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | no | Date when the campaign ends.
interest | [decimals](#decimals) | yes | Interest discount rate.
partial | bool | no | Determines if the campaign applies to all products, `false` by default.
num_instalments | array | no | Number of instalments available for the campaign.

## ○ Detail

```http
GET /merchants/:merchantId/campaigns/:campaignSlug HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{  
   "id": "c994e03e42d24be7bf6e1fcbad3334c0",
   "name": "Summertime",
   "slug": "summertime",
   "start_date": "2016-06-01T00:00:00",
   "end_date": "2016-08-31T:23:59:59",
   "interest": 2500,
   "partial": false,
   "num_instalments": [1, 2, 3, 5, 8],
   "created": "2016-03-10T11:08:57.265971"
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.get_campaign(':merchantId', ':campaignSlug')
```

`GET https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug`

If you want to check the status of a campaign, this is the service you need.

### /me
`GET https://api.aplazame.com/me/campaigns/:campaignSlug`

To make all requests for a current merchant, you can replace `/merchants/:merchantId` by `/me`.


### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | hash | String `id` of the merchant to perform action with.
:campaignSlug | [slug](https://en.wikipedia.org/wiki/Semantic_URL#Slug) | String `slug` of the campaign to perform action with.

### Response

Parameter | Type | Description
--------- | ---- | -----------
id | hash | Hostname id,
name | string | Campaign name.
slug | [slug](https://en.wikipedia.org/wiki/Semantic_URL#Slug) | Campaign slug.
start_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | Date when the campaign begins.
end_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | Date when the campaign ends.
interest | [decimals](#decimals) | Interest discount rate.
partial | bool | Determines if the campaign applies to all products.


## ○ Edit

```http
PUT /merchants/:merchantId/campaigns/:campaignSlug HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "name": "Summertime",
  "start_date": "2016-06-01T00:00:00",
  "end_date": "2016-08-31T:23:59:59",
  "interest": "2500",
  "partial": true,
  "num_instalments": [1, 2, 3, 5, 8]
}
```

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X PUT\
    --data-binary '{
      "name": "Summertime",
      "start_date": "2016-06-01T00:00:00",
      "end_date": "2016-08-31T:23:59:59",
      "interest": "2500",
      "partial": true,
      "num_instalments": [1, 2, 3, 5, 8]
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.put_campaign(':merchantId', ':campaignSlug', {
  'name': 'Summertime',
  'start_date': '2016-06-01T00:00:00',
  'end_date': '2016-08-31T:23:59:59',
  'interest': '2500',
  'partial': True,
  'num_instalments': [1, 2, 3, 5, 8]
})
```

`PUT https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug`

### /me
`PUT https://api.aplazame.com/me/campaigns/:campaignSlug`

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | hash | String `id` of the merchant to perform action with.
:campaignSlug | [slug](https://en.wikipedia.org/wiki/Semantic_URL#Slug) | String `slug` of the campaign to perform action with.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
name | string | yes | Campaign name.
start_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | yes | Date when the campaign begins.
end_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | no | Date when the campaign ends.
interest | [decimals](#decimals) | yes | Interest discount rate.
partial | bool | no | Determines if the campaign applies to all products, `false` by default.
num_instalments | array | no | Number of instalments available for the campaign.


## ○ Partial edit

```http
PATCH /merchants/:merchantId/campaigns/:campaignSlug HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

{
  "start_date": "2016-06-22T00:00:00"
}
```

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X PATCH\
    --data-binary '{
      "start_date": "2016-06-22T00:00:00"
    }'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.patch_campaign(':merchantId', ':campaignSlug', {
  'start_date': '2016-06-22T00:00:00'
})
```

`PATCH https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug`

### /me
`PATCH https://api.aplazame.com/me/campaigns/:campaignSlug`

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | hash | String `id` of the merchant to perform action with.
:campaignSlug | [slug](https://en.wikipedia.org/wiki/Semantic_URL#Slug) | String `slug` of the campaign to perform action with.

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
name | string | no | Campaign name.
start_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | no | Date when the campaign begins.
end_date | [ISO 8601](https://es.wikipedia.org/wiki/ISO_8601) | no | Date when the campaign ends.
interest | [decimals](#decimals) | no | Interest discount rate.
partial | bool | no | Determines if the campaign applies to all products, `false` by default.
num_instalments | array | no | Number of instalments available for the campaign.

## ○ Delete

```http
DELETE /merchants/:merchantId/campaigns/:campaignSlug HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug " \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X DELETE
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.delete_campaign(':merchantId', ':campaignSlug')
```

`DELETE https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug`

If you want to delete any campaign, this is the service you need.



## + Articles

## ○ List

```http
GET /merchants/:merchantId/campaigns/:campaignSlug/articles?page=2 HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.aplazame.v1+json

{
  "cursor": {
    "after": 3,
    "before": 1
  },
  "paging": {
    "count": 314,
    "next": "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles?page=3",
    "previous": "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles?page=1"
  },
  "results": [
  ]
}
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.get_campaign_articles(':merchantId', ':campaignSlug')
```

`GET https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles`

To retrieve articles on campaigns.

### Response

Parameter | Type | Description
--------- | ---- | -----------
cursor | object | Pagination cursor object.
paging | object | Pagination state.
results | collection | Campaigns queryset.


## ○ Collect

```http
POST /merchants/:merchantId/campaigns/:campaignSlug/articles HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com

[
  {
    "id": "89793238462643383279",
    "name": "Reloj en oro blanco de 18 quilates y diamantes",
    "description": "Movimiento de cuarzo de alta precisión",
    "url": "http://www.chanel.com...",
    "image_url": "http://www.chanel.com..."
  },
  {
    "id": "59825349042875546873",
    "name": "N°5 eau premiere spray",
    "description": "A decidedly lighter, fresher...",
    "url": "http://www.chanel.com...",
    "image_url": "http://www.chanel.com..."
  }
]
```

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    --data-binary '[
  {
    "id": "89793238462643383279",
    "name": "Reloj en oro blanco de 18 quilates y diamantes",
    "description": "Movimiento de cuarzo de alta precisión",
    "url": "http://www.chanel.com...",
    "image_url": "http://www.chanel.com..."
  },
  {
    "id": "59825349042875546873",
    "name": "N°5 eau premiere spray",
    "description": "A decidedly lighter, fresher...",
    "url": "http://www.chanel.com...",
    "image_url": "http://www.chanel.com..."
  }
]'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.post_campaign_articles(':merchantId', ':campaignSlug', [
  {
    'id': '89793238462643383279',
    'name': 'Reloj en oro blanco de 18 quilates y diamantes',
    'description': 'Movimiento de cuarzo de alta precisión',
    'url': 'http://www.chanel.com...',
    'image_url': 'http://www.chanel.com...'
  },
  {
    'id': '59825349042875546873',
    'name': 'N°5 eau premiere spray',
    'description': 'A decidedly lighter, fresher...',
    'url': 'http://www.chanel.com...',
    'image_url': 'http://www.chanel.com...'
  }
])
```

`POST https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles`

### Payload

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | yes | The article `ID`.
name | string | yes | Article name.
description | string | no | Article description.
url | url | yes | Article url.
image_url | url | no | Article image url.

## ○ Delete all

```http
DELETE /merchants/:merchantId/campaigns/:campaignSlug/articles HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X DELETE'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.delete_campaign_articles(':merchantId', ':campaignSlug')
```

`DELETE https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles`

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | hash | String `id` of the merchant to perform action with.
:campaignSlug | [slug](https://en.wikipedia.org/wiki/Semantic_URL#Slug) | String `slug` of the campaign to perform action with.


## ○ Delete single article

```http
DELETE /merchants/:merchantId/campaigns/:campaignSlug/articles/:articleId HTTP/1.1
Accept: application/vnd.aplazame.v1+json
Authorization: Bearer ->AccessToken<-
Host: api.aplazame.com
```

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/vnd.aplazame.v1+json
```

```shell
$ curl "https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles/:articleId" \
    -H "Accept: application/vnd.aplazame.v1+json" \
    -H "Authorization: Bearer ->AccessToken<-"\
    -X DELETE'
```

```python
import aplazame_sdk

client = aplazame_sdk.Client('->AccessToken<-')
response = client.delete_campaign_article(':merchantId', ':campaignSlug', ':articleId')
```

`DELETE https://api.aplazame.com/merchants/:merchantId/campaigns/:campaignSlug/articles/:articleId`

### Parameters

Parameter | Type | Description
--------- | ---- | -----------
:merchantId | hash | String `id` of the merchant to perform action with.
:campaignSlug | [slug](https://en.wikipedia.org/wiki/Semantic_URL#Slug) | String `slug` of the campaign to perform action with.
:articleId | hash | String `id` of the article to perform action with.
