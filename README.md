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

* CREATE EXTENSION hstore WITH SCHEMA pg_catalog;
  psql -U dbuser -d shop_app
  # add hstore type extension support

* select setval('stock_keeping_units_id_seq', (select max(id) from stock_keeping_units)+1);
