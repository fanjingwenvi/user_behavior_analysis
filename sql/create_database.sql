create database taobao;
use taobao;

create table user_behavior(user_id int(9), item_id int(9), 
	category_id int(9), behavior_type varchar(5), timestamp int(14))

## use tabao

## char vs varchar: varchar is more flexible for the space 
## timestamp vs int: date, datetime, timestamp, time, year

## tables 
## view: combine mutiple tables to create a view for report 
## stored procedures: query the data 
## fuctions 