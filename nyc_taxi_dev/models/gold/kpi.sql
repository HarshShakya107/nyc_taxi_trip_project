select sum(fare_amount) as total_fare,
avg(real_fare_amount) as average_fare,
sum(real_tip_amount) as total_tip,avg(tip_amount) as average_tip,
sum(real_total_amount) as complete_revenue,
avg(real_total_amount) as average_revenue,
avg(trip_distance) as average_distance,
count(PULocationID) as total_trips
from {{ref("fact_trips")}}