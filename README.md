# README

sudo apt-get install imagemagick postgresql postgresql-contrib libpq-dev nodejs

## database settings
* sudo -u postgres createuser -s dbuser; sudo -u postgres psql; \password dbuser
* vim  /etc/postgresql/9.5/main/pg_hba.conf
    # local   all             all                                     peer
    local   all             all                                     md5

* ...

* CREATE EXTENSION hstore WITH SCHEMA pg_catalog;
  psql -U dbuser -d shop_app
  # add hstore type extension support

* select setval('stock_keeping_units_id_seq', (select max(id) from stock_keeping_units)+1);
  select setval('products_id_seq', (select max(id) from products)+1);
