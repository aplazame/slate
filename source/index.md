---
title: API Reference

language_tabs:
  - http
  - shell
  - python


toc_footers:
  - <a href='mailto:soporte@aplazame.com?subject=I want my API Key'>Contact us for a Developer Key</a>
  - <a href='https://aplazame.com'>Documentation Powered by Aplazame</a>

includes:
  - checkout
  - objects
  - requests
  - orders
  - customers
  - packages
  - errors

search: true
---


# Introduction

```
 welcome to docs!! 
           ,__,
           (oo)____
           (__)    )\
              ||--|| *
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

```http
GET /<PATH> HTTP/1.1
Host: api.aplazame.com
```

```http
HTTP/1.1 200 it's OK?, then let's go!
```

```shell
$ curl "https://api.aplazame.com" \
    -H "User-Agent: hello, I am a cow, muUuuUuuUuuUUu"
```

```python
from somewhere import something

assert(something.__doc__ is not None)
```

### Soy una tienda

Aplázame REST API se ha creado con el objetivo de adaptarse fácilmente a cualquier ecommerce. Si tienes una plataforma de comercio electrónico gratuita, quizás se encuentre entre nuestros [plugins instalables](#-e-commerce-modules).

En caso contrario deberás seguir con detalle esta documentación, empezando por el [Checkout en 3 pasos](#3-steps-to-checkout) y a continuación con nuestra [descripción de la API](#making-requests), que define servicios disponibles y los pasos necesarios para establecer una comunicación con nuestros endpoints.


### Soy un servicio de APLAZAME

Si te identificas como servicio de Aplázame, estarás interesado en consultar información de [usuarios](#customer) y/o [pedidos](#orders).

Nuestros servicios API reconocerán tus credenciales para responder de forma exclusiva con la información dedicada al servicio que ofreces.

### Soy un python developer

¿Tienes al menos 3 años de experiancia?, ¿te apasiona intenet?, **queremos conocerte!!**

Trabajamos con datos GIS, bases de datos NOSQL (Elasticsearch, Neo4J, Mongodb...), Django en el backend, Angular en el front y Scrapy para nuestros spiders. Además nos gusta desarrollar código legible, autoexplicativo y seguiendo guías de estilo propias y de terceros.

Por la parte DevOps tenemos preparados entornos de trabajo con Vagrant, desplegamos con Ansibles y nos encanta jugar con Docker.

Si te **divierte** trabajar con algunas de estas tecnologías envíanos un correo a [jobs@aplazame.com](mailto:jobs@aplazame.com?subject=Hello world).


### Necesito ayuda

Para cualquier **incidencia** puedes contactar con [soporte@aplazame.com](mailto:soporte@aplazame.com?subject=Help me), nuestro equipo de soporte se encuentra disponible las 24H y dispone de recursos para monitorizar todas tus comunicaciones e identificar así cualquier tipo de problema que tengas.


### Feedback

También estamos abiertos a cambios en la documentación y nuestros servicios API. Para cualquier tipo de sugerencia no dudes en enviar un correo a [dev@aplazame.com](mailto:dev@aplazame.com?subject=Hello).

**We hope you'll enjoy using Aplázame API!**


