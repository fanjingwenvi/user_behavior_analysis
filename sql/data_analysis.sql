user_id  item_id category_id behavior_type 

small_behaviro 

## 983 64467 3128 4 Overview 
## time: temp_behavior 1 min 98,023 1,561,690(buy 123,619) 7969
## time: 350


select count(distinct(user_id))
from temp_behavior;

## user_behave_num 
select user_id, count(*) as user_behave_num 
from temp_behavior
group by user_id;


## item_sales 
create view item_and_sale as 
select item_id, count(*) as item_sale
from temp_behavior
where behavior_type = "buy"
group by item_id;