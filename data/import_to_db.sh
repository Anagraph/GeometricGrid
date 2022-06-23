#!/bin/bash

./data/datasources/substations/import_to_db.sh
./data/datasources/bus/import_to_db.sh
./data/datasources/bus_to_sub/import_to_db.sh
./data/datasources/branch/import_to_db.sh