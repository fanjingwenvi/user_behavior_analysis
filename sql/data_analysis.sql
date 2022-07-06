## Data understanding 
## user_id item_id category_id behavior_type tt dt d h 
## behavior_type "pv", "fav" ,"cart", "buy" 

## 0_overview 
SELECT * 
FROM user_behavior
LIMIT 5; 

## 0.1 overview 
CREATE TABLE 01_overview 
SELECT COUNT(*) AS index, ## must be quoted here, no GROUP
	COUNT(DISTINCT (user_id)) AS user_count,
	COUNT(DISTINCT (item_id)) AS item_count,
	COUNT(DISTINCT (category_id)) AS category_count,
	COUNT(DISTINCT (behavior_type )) AS behavior_count,
	COUNT(DISTINCT (tt)) AS tt_count 
FROM user_behavior;

## 1.1 traffic_conversion 
CREATE TABLE 11_traffic_conversion 
SELECT COUNT(*) AS behavior_count,
	SUM(CASE WHEN behavior_type ='pv' THEN 1 ELSE 0 END) AS pv_count,
	SUM(CASE WHEN behavior_type ='fav' THEN 1 ELSE 0 END) AS fav_count,
	SUM(CASE WHEN behavior_type ='cart' THEN 1 ELSE 0 END) AS cart_count,
	SUM(CASE WHEN behavior_type ='buy' THEN 1 ELSE 0 END) AS buy_count
FROM user_behavior
## traffic conversion rate is low, but this should be compared to the big platform app.

## 1.2_user_conversion 
CREATE TABLE 12_user_behavior_count 
SELECT user_id,
	COUNT(behavior_type) AS behavior_count,
	SUM(CASE WHEN behavior_type ='pv' THEN 1 ELSE 0 END) AS pv_count,
	SUM(CASE WHEN behavior_type ='fav' THEN 1 ELSE 0 END) AS fav_count,
	SUM(CASE WHEN behavior_type ='cart' THEN 1 ELSE 0 END) AS cart_count,
	SUM(CASE WHEN behavior_type ='buy' THEN 1 ELSE 0 END) AS buy_count
FROM user_behavior
GROUP BY user_id;
## long table, but view is connceted to the original table  

CREATE TABLE 12_user_conversion 
SELECT COUNT(*) AS user_count,
	SUM(CASE WHEN pv_count > 0 THEN 1 ELSE 0 END) AS pv_user,
	SUM(CASE WHEN fav_count > 0 THEN 1 ELSE 0 END) AS fav_user, 
	SUM(CASE WHEN cart_count > 0 THEN 1 ELSE 0 END) AS cart_user, 
	SUM(CASE WHEN buy_count > 0 THEN 1 ELSE 0 END) AS buy_user 
FROM 11_user_behavior_count;
## The fav rate is lower than the cart rate. User can not buy form the favirate list directly.

## 1.3_conversion_path
## what is the step lead to buy: pv and cart lead to buy 
SELECT user_id, 
item_id, behavior_type
FROM user_behavior
GROUP BY user_id, item_id
ORDER BY dt 



## user portrait: habit
## 2.1_user_in_days 
CREATE TABLE 21_user_in_days  
SELECT d, 
	COUNT(DISTINCT (user_id)) AS user_count,
	COUNT(behavior_type) AS behavior_count,
	SUM(CASE WHEN behavior_type ='pv' THEN 1 ELSE 0 END) AS pv_count,
	SUM(CASE WHEN behavior_type ='fav' THEN 1 ELSE 0 END) AS fav_count,
	SUM(CASE WHEN behavior_type ='cart' THEN 1 ELSE 0 END) AS cart_count,
	SUM(CASE WHEN behavior_type ='buy' THEN 1 ELSE 0 END) AS buy_count
FROM user_behavior
GROUP BY d
ORDER BY d;
## big jump, because of the vistors, commercial evnet 
## mark from Saturday 

## 2.2_user_in_hours 
CREATE TABLE 22_user_in_hours 
SELECT h, 
	COUNT(DISTINCT (user_id)) AS user_count,
	COUNT(behavior_type) AS behavior_count,
	SUM(CASE WHEN behavior_type ='pv' THEN 1 ELSE 0 END) AS pv_count,
	SUM(CASE WHEN behavior_type ='fav' THEN 1 ELSE 0 END) AS fav_count,
	SUM(CASE WHEN behavior_type ='cart' THEN 1 ELSE 0 END) AS cart_count,
	SUM(CASE WHEN behavior_type ='buy' THEN 1 ELSE 0 END) AS buy_count
FROM user_behavior
GROUP BY h
ORDER BY h;
## advise more customer service on the active hours 


## RFM: monetary: important or normal 
## RF: valuable, keep, develop, retain 
## low: medium, high: ## different strategy for different users 

## 31_recency_frequency ## long table, connect to others 
CREATE TABLE 31_RF 
SELECT user_id, 
	DATEDIFF('2017-12-03', max(d)) AS recency,
COUNT(user_id) AS frequency
FROM user_behavior
WHERE behavior_type='buy'
GROUP BY user_id
ORDER BY recency; 

## 32_RF_rating: ## long table 
## R low 0~1 2~3 3+
## F low 0~1 2~3 3+ 
CREATE TABLE 31_RF_rating  
SELECT user_id,
(CASE WHEN recency > 3 THEN 1
WHEN recency BETWEEN 2 and 3 THEN 2
WHEN recency BETWEEN 0 and 1 THEN 3
ELSE 0 END) AS R_rating,
(CASE WHEN frequency BETWEEN 0 and 1 THEN 1
WHEN frequency BETWEEN 2 and 3 THEN 2
WHEN frequency >3 THEN 3 
ELSE 0 END ) AS F_rating 
FROM 31_RF
ORDER BY R_rating, F_rating;

## 33_RFM_caculation 
CREATE TABLE 31_RF_caculation 
SELECT R_rating, F_rating, COUNT(*) AS RF_count
FROM 31_RF_rating
GROUP BY R_rating, F_rating
ORDER BY R_rating, F_rating;

## 34 recency_distribtion 
## 34 frequency_distribution: imply sales  
CREATE TABLE frequency_distribution 
SELECT frequency, 
	COUNT(buy_count) AS user_count
FROM recency_frequency
GROUP by frequency
ORDER by frequency;



## 80/20 model 
## 4.1 items 
CREATE TABLE 41_item_sale AS
SELECT item_id, 
	COUNT(item_id) AS buy_count 
FROM user_behavior
WHERE behavior_type = "buy"
GROUP BY item_id
ORDER BY buy_count; 
## mostly just one times，can be user to find top items 

CREATE TABLE 41_item_sales_distribution 
SELECT buy_count, 
	COUNT(buy_count) AS item_count
FROM 41_item_sale
GROUP by buy_count
ORDER by buy_count;

## 4.2 category(not popular item)
CREATE TABLE 42_cat_sale 
SELECT category_id, 
	COUNT(category_id) AS buy_count 
FROM user_behavior
WHERE behavior_type = "buy"
GROUP by category_id
ORDER BY buy_count; 

CREATE TABLE 42_cat_sales_distribution 
SELECT buy_count, 
	COUNT(buy_count) AS cat_count
FROM 42_cat_sale
GROUP by buy_count
ORDER by buy_count;

 














