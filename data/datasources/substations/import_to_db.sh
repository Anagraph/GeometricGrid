#!/bin/bash

source .env
table_name=substations
file=data/raw/sub.csv
ogr2ogr -progress -f "PostgreSQL" PG:"host='$PG_HOST' user='$PG_USER' dbname='$PG_DATABASE' password='$PG_PASSWORD' port='$PG_PORT'" \
  -nln $table_name $file \
  -oo X_POSSIBLE_NAMES=lon -oo Y_POSSIBLE_NAMES=lat \
  -a_srs EPSG:4326 \
  --config PG_USE_COPY YES -overwrite