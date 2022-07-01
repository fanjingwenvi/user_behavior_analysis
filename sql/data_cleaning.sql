USE taobao;
DESC temp_behavior;

## config 
show VARIABLES like '%_buffer%';
set GLOBAL innodb_buffer_pool_size=1,070,000,000;

For me it was under Edit → Preferences → SQL Editor 
→ DBMS connection read time out (in seconds): 600
Changed the value to 6000.

## check the null value, repeated value, anomaly( think about the operation time when it is big data )
SELECT * 
FROM temp_behavior 
WHERE 
	user_id IS NULL OR user_id IS NULL 
	OR ategory_id IS NULL OR behavior_type IS NULL 
	OR timestamp IS NULL 


## check field/column name, data type 
## timestamp 4 byte convert to UTC for storage 
## datetime 8 byte, big range 

SELECT * FROM test; 

## ALTER TABLE table_name  old_column_name new_col_name Data Type;
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

Example: 
SELECT [activity_dt], count(*)
FROM table1
GROUP BY hour( activity_dt ) , day( activity_dt )

## Hpw int is transformed into datetime 