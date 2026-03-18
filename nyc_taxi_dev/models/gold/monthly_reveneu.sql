select 
year(pickup_datetime) as year,
month(pickup_datetime) as month,
sum(fare_amount) as estimated_total_fare,
avg(fare_amount) as estimated_average_fare,
sum(tip_amount) as estimated_total_tip,
avg(tip_amount) as estimated_average_tip,
sum(total_amount) as estimated_reveneu,
avg(total_amount) as estimated_average_revenue,
sum(real_total_amount) as total_revenue_amount,
avg(real_total_amount) as average_revnue_amount,
sum(real_fare_amount) as total_fare_amount,
avg(real_fare_amount) as average_fare_amount,
sum(real_tip_amount) as total_tip_amount,
avg(real_tip_amount) as average_tip_amount,
avg(trip_distance) as average_distance 
from {{ref("fact_trips")}} group by month(pickup_datetime),year(pickup_datetime) order by year(pickup_datetime),month(pickup_datetime)

