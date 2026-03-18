with clean_green_tripdata as (
select VendorID,
lpep_pickup_datetime as pickup_datetime,
lpep_dropoff_datetime as dropoff_datetime,
cast(case when RatecodeID =1 then 'Standard rate'
when RatecodeID=2 then 'JFK'
when RatecodeId=3 then 'Newark'
when RatecodeId=4 then 'Nassau or Westchester'
when RatecodeId=5 then 'Negotiated fare'
when RatecodeId=6 then 'Group ride'
else 'unknown' end as varchar(50) ) as RateCode,
PULocationID,
DOLocationID,
case when passenger_count is Null then 1
else passenger_count end as passenger_count,
payment_type,
trip_distance,
fare_amount,
case when payment_type =3 then 0
else fare_amount end as real_fare_amount,
tip_amount,
case when payment_type =3 then 0
else tip_amount end as real_tip_amount,
total_amount,
case when payment_type =3 then 0
else total_amount end as real_total_amount,
"Green" as taxi_type
from {{ref('raw_green_tripdata')}} 
where trip_distance != 0 and fare_amount >= 0 and tip_amount >= 0 and total_amount >=0 and passenger_count!=0 and trip_distance>=0 and lpep_pickup_datetime is not null and lpep_dropoff_datetime is not null and PULocationID is not null and DOLocationID is not null ) 
select * from clean_green_tripdata