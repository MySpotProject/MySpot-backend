# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# How to run Docker API

* Запустить один раз
```
docker-compose run --build --rm web bash
rails db:create
rails db:migrate
exit
```

* Запускать каждый раз
```
docker-compose up -d
```
