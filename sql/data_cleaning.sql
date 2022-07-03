USE taobao;
DESC temp_behavior;
## big data
## config: buffer and connetion time 
## batch: operation 
SHOW VARIABLES like '%_buffer%';
SET GLOBAL innodb_buffer_pool_size=1070000000;
## Edit → Preferences → SQL Editor → DBMS connection read time out (in seconds): 600 Changed the value to 6000.



## 1. null, repeated value, anomaly
SELECT *
FROM temp_behavior 
WHERE user_id IS NULL 
	OR user_id IS NULL 
	OR category_id IS NULL 
	OR behavior_type IS NULL 
	OR timestamp IS NULL;
## bactch operation 
SELECT * FROM temp_behavior WHERE user_id IS NULL;
SELECT * FROM temp_behavior WHERE item_id IS NULL;
SELECT * FROM temp_behavior WHERE category_id IS NULL;
SELECT * FROM temp_behavior WHERE behavior_type IS NULL;
SELECT * FROM temp_behavior WHERE timestamp IS NULL;

## repeated behavior at the reality 

select max(dt), min(dt) from temp_behavior;
delete from temp_behavior
where dt < '2017-11-25 00:00:00'
or dt > '2017-12-03 23:59:59';


## 2. check field/column name, data type 

## TIMSTAMP CUT: 4byte, smaller time range, default current time, convert to UTC for storage CUT Coordinated Universal Time
## DATESTIME: 8byte, bigger time range,defalut null 
## time:  year, date, time, datestime, timstamp 

## Int: always 4 bytes,int(11) = 4 bytes = 32 bit.
## VARCHAR(5) vs CHAR(5): varchar is more flexible for the space

## Big Query DATETIME  - 8 bytes TIMESTAMP - 8 bytes with [time zone]
## Uppercase: Cmd + K, Cmd + U

## ALTER TABLE table_name (CHANGE) old_column_name new_col_name Data Type;
ALTER TABLE temp_behavior CHANGE timestamp tt int;
ALTER TABLE temp_behavior ADD dt datetime, d date, t time, h int;

## WHERE column = 'dt'
SET SQL_SAFE_UPDATES = 0;
UPDATE temp_behavior SET dt=FROM_UNIXTIME(tt);
SET SQL_SAFE_UPDATES = 1;
UPDATE temp_behavior SET d = date(dt);
UPDATE temp_behavior SET t = time(dt);
UPDATE temp_behavior SET h = hour(dt);


## 3. further 
## How int is transformed into datetime  
SELECT [activity_dt], count(*)
FROM table1
GROUP BY hour( activity_dt ), day( activity_dt )
