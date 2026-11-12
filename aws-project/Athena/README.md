# Amazon Athena – OpenStreetMap Veterinary Location Analysis

## Overview

This hands-on project uses **Amazon Athena** to query OpenStreetMap (OSM) planet data stored in Amazon S3. I created an Athena database and an external table using the AWS Glue Data Catalog, then used SQL to explore the dataset and filter veterinary locations in a geographic bounding box in Queensland, Australia.

## AWS services and technologies

- **Amazon Athena** – serverless SQL query engine
- **Amazon S3** – source data storage
- **AWS Glue Data Catalog** – database and external-table metadata
- **SQL** – data selection, map-value filtering and geographic range filtering
- **ORC** – columnar storage format used by the source table

## Architecture

1. Open the Athena query editor in **US East (N. Virginia) – us-east-1**.
2. Select the `AwsDataCatalog` data source and create the `a4l` database.
3. Define the external `planet` table with the ORC schema and S3 location.
4. Run SQL queries against the table. Athena reads the data from S3; the Glue Data Catalog stores the table metadata.

**Data location used in the lab:** `s3://osm-pds/planet/`

The table is external: the data remains in S3 and is not copied into Athena.

## SQL queries

The SQL scripts are in the [queries](queries/) folder:

| File | Purpose |
|---|---|
| [01_create_database.sql](queries/01_create_database.sql) | Create the Athena database |
| [02_create_planet_table.sql](queries/02_create_planet_table.sql) | Define the external ORC table |
| [03_select_sample_data.sql](queries/03_select_sample_data.sql) | Preview records |
| [04_find_veterinary_locations.sql](queries/04_find_veterinary_locations.sql) | Filter veterinary nodes by tags and coordinates |

### Main analysis query

The final query filters records where:
- `type = 'node'`
- the OSM `amenity` tag is `veterinary`
- latitude is between `-27.8` and `-27.3`
- longitude is between `152.2` and `153.5`

This bounding box is in the Brisbane / south-east Queensland area.

## What I practised

- Creating an Athena database
- Creating an external table over data in S3
- Understanding the relationship between Athena and the Glue Data Catalog
- Querying nested/map data with Athena SQL
- Applying multiple filters, including geographic coordinate ranges
- Reviewing query execution time and data scanned

## Evidence

Screenshots of the Athena database, table definition, successful queries and query results are stored in the [screenshots](screenshots/) folder.

## Notes

- This is a learning project carried out in an AWS lab environment.
- The SQL scripts document the work; they do not include AWS credentials or account-specific secrets.
- Athena query charges depend on the amount of data scanned. Use selective filters and avoid unnecessary full-table scans.
- Dropping an external table removes its catalog metadata, not necessarily the underlying S3 objects. Check the S3 location separately before deleting data.
