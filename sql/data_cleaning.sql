USE taobao;
DESC temp_behavior;

## big data
## config: buffer and connetion time 
## batch: operation 
SHOW VARIABLES like '%_buffer%';
SET GLOBAL innodb_buffer_pool_size=1070000000;
## Edit → Preferences → SQL Editor 
## 	→ DBMS connection read time out (in seconds): 600 Changed the value to 6000.
SELECT * FROM temp_behavior WHERE user_id IS NULL;
SELECT * FROM temp_behavior WHERE item_id IS NULL;
SELECT * FROM temp_behavior WHERE category_id IS NULL;
SELECT * FROM temp_behavior WHERE behavior_type IS NULL;
SELECT * FROM temp_behavior WHERE timestamp IS NULL;

## null, repeated value, anomaly
FROM temp_behavior 
WHERE 
	user_id IS NULL OR user_id IS NULL 
	OR ategory_id IS NULL OR behavior_type IS NULL 
	OR timestamp IS NULL 

## check field/column name, data type 

## TIMSTAMP CUT: 4byte, smaller time range, default current time, 
## 	convert to UTC for storage CUT Coordinated Universal Time
## DATESTIME: 8byte, bigger time range,defalut null 
## time:  year, date, time, datestime, timstamp 

## Int: always 4 bytes,int(11) = 4 bytes = 32 bit.
## VARCHAR(5) vs CHAR(5): varchar is more flexible for the space

## Big Query DATETIME  - 8 bytes TIMESTAMP - 8 bytes with [time zone]
## Uppercase: Cmd + K, Cmd + U

SELECT * FROM test; 
## ALTER TABLE table_name (CHANGE) old_column_name new_col_name Data Type;
ALTER TABLE temp_behavior CHANGE timestamp tt int;
ALTER TABLE temp_behavior ADD dt datetime;

## WHERE column = 'dt'
SET SQL_SAFE_UPDATES = 0;
UPDATE temp_behavior SET dt=FROM_UNIXTIME(tt);
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE temp_behavior ADD d date;
ALTER TABLE temp_behavior ADD t time;
ALTER TABLE temp_behavior ADD h int;
UPDATE temp_behavior SET d = date(dt);
UPDATE temp_behavior SET t = time(dt);
UPDATE temp_behavior SET h = hour(dt);


## Further 
## How int is transformed into datetime  
SELECT [activity_dt], count(*)
FROM table1
GROUP BY hour( activity_dt ), day( activity_dt )
