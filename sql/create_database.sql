CREATE DATABASE taobao;

USE taobao;

CREATE TABLE user_behavior(user_id int(9), item_id int(9), 
	category_id int(9), behavior_type varchar(5), timestamp int(14))

## create the sample of the table to test syntax 
CREATE TABLE temp_behavior LIKE user_behavior;
INSERT INTO temp_behavior
SELECT * FROM user_behavior LIMIT 100000;

CREATE VIEW user_behavior_sample as (
SELECT * FROM user_behavior limit 100000
);

CREATE TABLE new_table 
SELECT //write your query here

## Data Format 
## varchar vs char: varchar is more flexible for the space 
## time: date, time, datestime, timstamp CUT Coordinated Universal Time, year 
## timstamp: 4byte, default current time 
## datestime: 8byte, defalut null 
## An INT will always be 4 bytes no matter what length is specified. Above, We've seen that MySQL integer int(11) has size is 4 bytes which equals 32 bit.

## tables 
## views: virtual table
## stored procedures: query the data 
## fuctions:

## Uppercase: Cmd + K, Cmd + U 

## Big Data 

## Buffer 
SHOW VARIABLES LIKE '%_buffer%';
SET GLOBAL innodb_buffer_pool_size=1070000000;

## Batch
SELECT * FROM temp_behavior WHERE user_id IS NULL;
SELECT * FROM temp_behavior WHERE item_id IS NULL;
SELECT * FROM temp_behavior WHERE category_id IS NULL;
SELECT * FROM temp_behavior WHERE behavior_type IS NULL;
SELECT * FROM temp_behavior where timestamp IS NULL;
