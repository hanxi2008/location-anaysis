CREATE TABLE trips (
    trip_id                 BIGINT IDENTITY(0,1) NOT NULL DISTKEY ENCODE LZO,
    vendor_id               VARCHAR(3) ENCODE LZO,

    pickup_datetime         TIMESTAMP NOT NULL ENCODE LZO,
    dropoff_datetime        TIMESTAMP NOT NULL ENCODE LZO,
    passenger_count         SMALLINT NOT NULL DEFAULT '0' ENCODE LZO,
    trip_distance           DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    pickup_longitude        DECIMAL(18,14),
    pickup_latitude         DECIMAL(18,14),
    rate_code_id            SMALLINT ENCODE LZO,
    store_and_fwd_flag      VARCHAR(1) ENCODE RUNLENGTH,
    
    dropoff_longitude       DECIMAL(18,14),
    dropoff_latitude        DECIMAL(18,14),
    payment_type            VARCHAR(3) ENCODE RUNLENGTH,
    fare_amount             DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    extra                   DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    mta_tax                 DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    improvement_surcharge   DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    tip_amount              DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    tolls_amount            DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    total_amount            DECIMAL(18,6) DEFAULT '0.0' ENCODE MOSTLY8,
    trip_type               SMALLINT ENCODE LZO,
    cab_type                VARCHAR(6) NOT NULL ENCODE LZO,
    month_id                SMALLINT ENCODE LZO

    primary key(trip_id)
) sortkey(pickup_longitude,pickup_latitude,dropoff_longitude,dropoff_latitude);
