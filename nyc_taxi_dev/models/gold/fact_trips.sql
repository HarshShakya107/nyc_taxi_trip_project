select * from {{ref("clean_yellow_tripdata")}}
union all
select * from {{ref("clean_green_tripdata")}}