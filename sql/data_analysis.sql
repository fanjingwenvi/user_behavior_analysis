user_id  item_id category_id behavior_type tt
dt, d, h 
behavior_type "pv", "fav" ,"cart", "buy" 

## https://www.piliapp.com/mysql-syntax-check/

## 1. overview 
create table overview 
select count(*) as "index", ## must be quoted here, why 
	count(distinct(user_id)) as user_id,
	count(distinct(item_id)) as item_id,
	count(distinct(category_id)) as category_id,
	count(distinct(behavior_type )) as behavior_type,
	count(distinct(tt)) as tt
from temp_behavior;

## 2. behavior_type_count (average conversion rate)
create table behavior_type_count
select(
select count(*) 
from temp_behavior
where behavior_type = "pv"
) as "pv_count",
(
select count(*) 
from temp_behavior
where behavior_type = "fav"
) as "fav_count",
(
select count(*) 
from temp_behavior
where behavior_type = "cart"
) as "cart_count",
(
select count(*) 
from temp_behavior
where behavior_type = "buy"
) as "buy";

## 3. user_behavior_date_hour (behavior, buy / behavior, fluctuation, max, min)
create table user_active_conversion_date_hour
select d,
h, 
count(*) as behavior_count,
count(if(behavior_type='buy',behavior_type,null)) as buy_count
## round( buy_count / behavior_count , 2 ) as buy_div_behavior ## this does not work 
from temp_behavior
group by d, h
order by d, h;

## 4. user_behavior_date (focus on buy)
create table user_behavior_date
select d,
count(if(behavior_type='pv',behavior_type,null)) as pv_count,
count(if(behavior_type='cart',behavior_type,null)) as cart_count,
count(if(behavior_type='fav',behavior_type,null)) as fav_count,
count(if(behavior_type='buy',behavior_type,null)) as buy_count
from temp_behavior
group by d
order by d;

## 5. user_behavior_hour (focus on buy)
create table ser_behavior_hour
select h, 
count(if(behavior_type='pv',behavior_type,null)) as pv_count,
count(if(behavior_type='cart',behavior_type,null)) as cart_count,
count(if(behavior_type='fav',behavior_type,null)) as fav_count,
count(if(behavior_type='buy',behavior_type,null)) as buy_count
from temp_behavior
group by h
order by h;

## 6. user_behavior_path
## (same user and same item, what is the next step, ordered by time )


## recency, frequency, monetary value
## 7. RFM Model(time and by, identity the user)
create view recency_frequency as 
select user_id, 
max(d) as recency,
count(user_id) as frequency
from temp_behavior
where behavior_type='buy'
group by user_id;

## categorization
## 1 3 9 
## 1 3 9 
## 
## not applied to all users 

create view user_buy_count as
select user_id, 
count(user_id) as buy_count 
from temp_behavior
where behavior_type = "buy"
group by user_id; 

create table user_count_item_sum
select buy_count, count(buy_count) as user_sum 
from user_buy_count
group by buy_count
order by buy_count;

## 80/20 model 
## 8. sales distribution (not popular item)
create view item_buy_count as
## with item_buy_count as( )## with is harder to debug 
select item_id, 
count(item_id) as buy_count 
from temp_behavior
where behavior_type = "buy"
group by item_id; 

create table buy_count_item_sum
select buy_count, count(buy_count) as item_sum 
from item_buy_count
group by buy_count
order by buy_count;

## 9. category distribution(not popular item)
create view cat_buy_count as 
select category_id, 
count(category_id) as buy_count 
from temp_behavior
where behavior_type = "buy"
group by category_id;

create table cat_count_item_sum
select buy_count, count(buy_count) as cat_sum 
from cat_buy_count
group by buy_count
order by buy_count;

## item_sales - item sales distribution 

## creat table form select 
## CREATE TABLE t1 (col1 INT) 
## SELECT col2 FROM t2;












