-- Create an external table over the OpenStreetMap planet data in S3.
-- The table definition is metadata; the source data remains in S3.

CREATE EXTERNAL TABLE IF NOT EXISTS planet (
    id BIGINT,
    type STRING,
    tags MAP<STRING, STRING>,
    lat DECIMAL(9, 7),
    lon DECIMAL(10, 7),
    nds ARRAY<STRUCT<ref: BIGINT>>,
    members ARRAY<STRUCT<type: STRING, ref: BIGINT, role: STRING>>,
    changeset BIGINT,
    timestamp TIMESTAMP,
    uid BIGINT,
    user STRING,
    version BIGINT
)
STORED AS ORC
LOCATION 's3://osm-pds/planet/';
