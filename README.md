# GeometricGrid :zap: :electric_plug: :bulb:

## About The Project

Breakthrough Energy's [PowerSimData](https://github.com/Breakthrough-Energy/PowerSimData) is used to carry out power flow studies in the U.S. electrical grid.
The grid is the most complex machine of our world. To reduce the GHG from electricity, we need to better understand the structure of our grid. 
PowerSimData can be used for a variety of modelling tasks:
- Provide a flexible modeling tool to create complex scenarios
- Perform investment cost studies
- Run power flow study using interface to external simulation engine
- Manage data throughout the lifecycle of a simulation

That being said, we had difficulty accessing and managing the underlying data used by PowerSimData. More specifically, it 
was hard to re-create the same cartographic views Breakthrough Energy presents on [their website](https://science.breakthroughenergy.org/dashboard).

The repository provides the following:
- Copy of the underlying data used by PowerSimData
- Import scripts to Postgres with the PostGIS extension 
- The dbt pipelines to transform the raw data for geospatial analysis

### Built With

* [GDAL/OGR](https://gdal.org/)
* [dbt](https://docs.getdbt.com/docs/building-a-dbt-project/documentation)
* [PostGIS](https://postgis.net/documentation/)
* [docker](https://docs.docker.com/)

## Getting Started

1. Configure your `.env` and `.dbt/.profile` file to match the database credentials you want to use.
    ```dotenv
    PG_USER=postgres
    PG_HOST=localhost
    PG_DATABASE=postgres
    PG_PASSWORD=password
    PG_PORT=5432
    PG_SCHEMA=public
   ```
   ```yaml
   default:
      target: dev
      outputs:
        dev:
          type: postgres
          host: localhost
          user: postgres
          password: password
          port: 5432
          dbname: postgres
          schema: dbt
          threads: 4
   ```
4. Spin up the local database: `docker-compose up db`
5. Import the raw data: `./data/import_to_db.sh`
6. Execute the dbt pipelines: `dbt run --project-dir data/dbt --profiles-dir data/.dbt`

