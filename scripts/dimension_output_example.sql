SET @exec_time =  DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');

set @sql = concat("
SELECT  distinct
ord_disp_dt as 'Date String',
YEAR(str_to_date(ord_disp_dt,'%m/%d/%Y')) as Year,
MONTH(str_to_date(ord_disp_dt,'%m/%d/%Y')) as Month,
Day(str_to_date(ord_disp_dt,'%m/%d/%Y')) as Day,
Quarter(str_to_date(ord_disp_dt,'%m/%d/%Y')) as Quarter,
WeekDay(str_to_date(ord_disp_dt,'%m/%d/%Y')) as WeekDay,
Week(str_to_date(ord_disp_dt,'%m/%d/%Y')) as Week
FROM dav6100_db_2.t_ord_order
ORDER BY YEAR,MONTH, DAY
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/date_dim_",@exec_time,".csv' 
FIELDS TERMINATED BY '||' 
ENCLOSED BY '' 
LINES TERMINATED BY '\r\n' 
TERMINATED BY '\r\n';"


);

prepare s1 from @sql;
execute s1; 