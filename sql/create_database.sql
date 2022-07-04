CREATE DATABASE taobao;
USE taobao;
CREATE TABLE user_behavior(user_id int(9), item_id int(9), 
	category_id int(9), behavior_type varchar(5), timestamp int(14))

## create test table 
CREATE TABLE temp_behavior
SELECT * FROM user_behavior LIMIT 100000;

## other syntax 
CREATE TABLE temp_behavior LIKE user_behavior;
INSERT INTO temp_behavior
SELECT * FROM user_behavior LIMIT 100000;

CREATE VIEW temp_behavior AS (
SELECT * FROM temp_behavior limit 100000
);

## tables 
## views: virtual table
## stored procedures: query the data 
## fuctions:



