# Годовой календарь

[https://calendar.redde.ru](https://calendar.redde.ru)
Приложение для генерации годового календаря.

## Requirements

* Ruby 2.6.3

## Docker

* [https://hub.docker.com/r/arrowcircle/yearlendar](https://hub.docker.com/r/arrowcircle/yearlendar)

```bash
docker build -t yearlendar . && \
docker tag yearlendar arrowcircle/yearlendar:v1.0.0 && \
docker push arrowcircle/yearlendar:v1.0.0
```
