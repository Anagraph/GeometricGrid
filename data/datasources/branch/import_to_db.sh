#!/bin/bash

source .env
table_name=branches
file=data/raw/branch.csv
ogr2ogr -progress -f "PostgreSQL" PG:"host='$PG_HOST' user='$PG_USER' dbname='$PG_DATABASE' password='$PG_PASSWORD' port='$PG_PORT'" \
  -nln $table_name $file \
  --config PG_USE_COPY YES -overwrite