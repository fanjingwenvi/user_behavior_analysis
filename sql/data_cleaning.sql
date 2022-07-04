## Data understanding 
## user_id int, item_id int, category_id int,  behavior_type object, timestamp int 
## tt dt d h 
## behavior_type "pv", "fav" ,"cart", "buy" 

USE taobao;
DESC user_behavior;

SELECT * 
FROM user_behavior
LIMIT 5; 

## config for big data: connetion time and buffer
## Edit → Preferences → SQL Editor → DBMS connection read time out (in seconds): 600 Changed the value to 6000.
SHOW VARIABLES like '%_buffer%';
SET GLOBAL innodb_buffer_pool_size=1070000000;



## 1. check field/column name, data type 

ALTER TABLE user_behavior CHANGE timestamp tt int;
ALTER TABLE user_behavior ADD dt datetime, d date, t time, h int;
## ALTER TABLE table_name (CHANGE) old_column_name new_col_name Data Type;

SET SQL_SAFE_UPDATES = 0;
UPDATE user_behavior SET dt=FROM_UNIXTIME(tt);
SET SQL_SAFE_UPDATES = 1;
UPDATE user_behavior SET d = date(dt); 
UPDATE user_behavior SET t = time(dt); 
UPDATE user_behavior SET h = hour(dt);
## WHERE column = 'dt'

## 2. null, repeated value, anomaly

SELECT *
FROM user_behavior 
WHERE user_id IS NULL 
	OR user_id IS NULL 
	OR category_id IS NULL 
	OR behavior_type IS NULL 
	OR tt IS NULL;

## repeated value: different device in the reality 
SELECT tt    ## * does not work here 
FROM user_behavior
GROUP BY user_id, item_id, category_id, behavior_type, tt
HAVING COUNT(*) > 1;
## add id column 

## anomaly: time range
## DELETE FROM user_behavior
SELECT * FROM user_behavior
WHERE dt < '2017-11-25 00:00:00'
OR dt > '2017-12-03 23:59:59';

## further 
## How int is transformed into datetime 
## GROUP BY day(dt) instead of create new columns  