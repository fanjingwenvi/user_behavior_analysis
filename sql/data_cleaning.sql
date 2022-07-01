USE taobao;
DESC temp_behavior;

CREATE view test as (
SELECT * FROM temp_behavior LIMIT 1
);

## check the null value, repeated value, anomaly( think about the operation time when it is big data )
SELECT * 
FROM temp_behavior 
WHERE user_id IS NULL OR user_id IS NULL OR ategory_id IS NULL OR behavior_type IS NULL OR timestamp IS NULL 


## check field/column name, data type 
## timestamp 4 byte convert to UTC for storage 
## datetime 8 byte, big range 

SELECT * FROM test; 

## ALTER TABLE table_name  old_column_name new_col_name Data Type;
alter table test CHANGE timestamp tt int;

alter table test ADD dt datetime;

SET SQL_SAFE_UPDATES = 0;
update test set dt=FROM_UNIXTIME(tt);
SET SQL_SAFE_UPDATES = 1;


alter table test add d date;
alter table test add t time;
alter table test add h int;
update test set d = date(dt);
update test set t = time(dt);
update test set h = hour(dt);

## Further 

Example: 
SELECT [activity_dt], count(*)
FROM table1
GROUP BY hour( activity_dt ) , day( activity_dt )

## Hpw int is transformed into datetime 