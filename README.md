## Covid19 Graphql-api Demo
A Graphql API to obtain information regarding the covid19 stats by querying
`api.covid19api.com`

Demo en Heroku:
https://covid19-graphql-api-demo.herokuapp.com/

This project is just a demo for a talk given at MasCon-Online conference held
on May 14th 2020.

Some of the bits of Graphql in ruby covered here are:

- Building up a `schema` in ruby with the `graphql-ruby` gem
- Making sure we can access the schema using a `query` field.
- Avoiding N+1s in some of our queries
- "Look Mom no Database". Hitting that other REST API hard

### Additional info

If you see this before May 17th please donate by getting a ticket at

https://www.eventbrite.com/e/con-online-a-beneficio-tickets-103924878108

(all donations will go to a community soup kitchen "Comedor Los Angelitos de Dios")

## Español - Demo de una API en Graphql para Covid19

Este proyecto es sólo una demo para mostrar las estadisticas diarias de distintos
países durante covid19 obteniendo la info de: `api.covid19api.com`
Esta demo acompaña una charla en MasCon-Online 2020, una conferencia online.

Demo en Heroku:
https://covid19-graphql-api-demo.herokuapp.com/

Algunos puntos sobre Graphql expuestos son:

- Construyendo un `schema` con ruby y `graphql-ruby`
- Construyendo `query` root fields
- Buscando la manera de evitar N+1s
- La falta de necesidad de tener una Base de Datos (peguele a esa api con juerza)

### Info adicional

Si estás viendo esto antes del 17 de Mayo de 2020, por favor considerá donar al
Comedor Los Angelitos de Dios en este link:

https://www.eventbrite.com/e/con-online-a-beneficio-tickets-103924878108

