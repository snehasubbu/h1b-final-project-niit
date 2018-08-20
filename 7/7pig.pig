app = LOAD '/user/hive/warehouse/h1bfinal' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, worksite:chararray, longitute:double, latitute:double);
s1 = group app by year;
s2 = foreach s1 generate group,COUNT($1);
dump s2;
     
