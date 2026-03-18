select count(f.PULocationID) as trip_count,
p.payment_type,
type_name,
sum(real_total_amount) as total_revenue,
avg(real_total_amount) as average_revenue,
sum(real_fare_amount) as total_fare,
avg(real_fare_amount) as average_fare,
sum(real_tip_amount) as toal_tip,
avg(real_tip_amount) as avergae_tip
from {{ref("payment")}} p left join {{ref("fact_trips")}} f on p.payment_type = f.payment_type 
where f.PULocationID is not null and p.payment_type is not null
 group by p.payment_type,type_name
 order by count(f.PULocationID) desc 