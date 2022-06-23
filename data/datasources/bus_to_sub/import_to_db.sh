#!/bin/bash

source .env
table_name=bus_to_sub
file=data/raw/bus2sub.csv
ogr2ogr -progress -f "PostgreSQL" PG:"host='$PG_HOST' user='$PG_USER' dbname='$PG_DATABASE' password='$PG_PASSWORD' port='$PG_PORT'" \
  -nln $table_name $file \
  --config PG_USE_COPY YES -overwrite