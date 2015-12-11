---
title: API Reference

language_tabs:
  - http
  - shell
  - python
  - js


toc_footers:
  - <a href='mailto:soporte@aplazame.com?subject=I want my API Key'>Contact us for a Developer Key</a>
  - <a href='https://aplazame.com'>Documentation Powered by Aplazame</a>

includes:
  - demo
  - checkout
  - items
  - testdata
  - requests
  - orders
  - merchants
  - customers
  - widgets
  - buttons
  - packages
  - errors
  - release

search: true
---


# Introduction

```
      o o o o ~~  ~~ ~                   >')
   o     _____         ______________  ___(=>)_____
 .][_mm__|[]| ,===___ || Welcome to | |   Duck     |
>(_______|__|_|_----_]_|    doc$    |_|  season    |
_/oo-OOOO-oo' !oo!!oo!=`!o!o!--!o!o!'=`!o!o!--!o!o!'=
+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
```


```http
TRACE /:PATH HTTP/1.1
Accept: something
Authorization: my public/private key
Host: api.aplazame.com
```

```http
HTTP/1.1 200 OK?, then let's go!
Content-Type: something
```

```shell
$ curl "https://api.aplazame.com" \
    -H "User-Agent: Get ready for a lot of fun and excitement" \
    -X ECHO
```

```python
from somewhere import something

assert(something.__doc__ is not None)
```


### I'M ECOMMERCE

Ease of implementation is the main objective we had in mind when developing Aplazame’s REST API.

If you have an e-commerce platform, you may find a suitable plugin from our [installable plugins](#img-alt-github-src-http-icons-iconarchive-com-icons-social-media-icons-social-buntings-32-github-icon-png) list.

Otherwise you will have to carefully follow the instructions contained in this documentation, starting with the [3 step Checkout](#3-steps-to-checkout-v2) and following to our [API description](#making-requests), which defines the available services and the steps required to establish communication with our endpoints.


### I'M AN APLAZAME’S SERVICE

If you are an Aplazame service, you may be interested in viewing information of [users](#customers) and / or [orders](#orders).

Our API service will recognize your credentials and will provide you exclusively with the information required by the service you are using.


### I'M A PYTHON DEVELOPER

Do you have at least three years of experience?, Internet is your passion?, we want to meet you!!

We work with GIS data, NoSQL databases (Elasticsearch, Neo4J, MongoDB ...) and Django in the backend, Angular in the front and Scrapy for our spiders. Furthermore we like to develop readable and self-explanatory code, following both our own style and best practice from third parties.

On the DevOps side, we use Vagrant for setting up working environments, we use Ansibles for our deployments and we love playing with Docker :)

If you **enjoy** working with some of these technologies and would like to have fun working with us to fix the financial sector by offering people fair and convenient financing send us a line at [jobs@aplazame.com](mailto:jobs@aplazame.com?subject=Hello world).


### I NEED HELP

For any support request please drop us an email at [soporte@aplazame.com](mailto:soporte@aplazame.com?subject=Help me). Our support team is available 24/7 and has the resources to monitor all your communications and thus identify any problems you may have.


### FEEDBACK

We are open to changes in the API documentation and our services. For any suggestions please send us an email to  [dev@aplazame.com](mailto:dev@aplazame.com?subject=Hello).

**We hope you'll enjoy using Aplázame's API!**
