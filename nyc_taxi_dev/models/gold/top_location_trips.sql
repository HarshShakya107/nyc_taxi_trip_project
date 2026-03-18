SELECT 
    year(f.pickup_datetime) as year,
    month(f.pickup_datetime) as month,
    COUNT(f.PULocationID) AS total_trips,
    z.Zone,
    z.Borough,
    z.service_zone
FROM {{ ref('clean_taxi_zone_lookup') }} z 
LEFT JOIN {{ ref('fact_trips') }} f 
    ON z.LocationID = f.PULocationID 
where 
year(f.pickup_datetime) is not null and
month(f.pickup_datetime) is not null
GROUP BY 
    year(f.pickup_datetime),
    month(f.pickup_datetime),
    z.Borough,
    z.service_zone,
    z.Zone 
ORDER BY 
    total_trips desc,
    year(f.pickup_datetime),
    month(f.pickup_datetime);
