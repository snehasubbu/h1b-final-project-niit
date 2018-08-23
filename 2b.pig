data = LOAD '/user/hive/warehouse/h1bfinal' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, worksite:chararray, longitute:double, latitute:double);
s1 = filter data by LOWER(case_status) == 'certified' and year == '2011';
s2 = group s1 by $8;
s3 = foreach s2 generate group,COUNT($1);
s4 = order s3 by $1 desc;
s5 = limit s4 5;  


s6 = filter data by LOWER(case_status) == 'certified' and year == '2012';
s7 = group s6 by $8;
s8 = foreach s7 generate group,COUNT($1);
s9 = order s8 by $1 desc;
s10 = limit s9 5;  


s11 = filter data by LOWER(case_status) == 'certified' and year == '2013';
s12 = group s11 by $8;
s13 = foreach s12 generate group,COUNT($1);
s14 = order s13 by $1 desc;
s15 = limit s14 5;  


s16 = filter data by LOWER(case_status) == 'certified' and year == '2014';
s17 = group s16 by $8;
s18 = foreach s17 generate group,COUNT($1);
s19 = order s18 by $1 desc;
s20 = limit s19 5;  


s21 = filter data by LOWER(case_status) == 'certified' and year == '2015';
s22 = group s21 by $8;
s23 = foreach s22 generate group,COUNT($1);
s24 = order s23 by $1 desc;
s25 = limit s24 5;  


s26 = filter data by LOWER(case_status) == 'certified' and year == '2016';
s27 = group s26 by $8;
s28 = foreach s27 generate group,COUNT($1);
s29 = order s28 by $1 desc;
s30 = limit s29 5;  
s31 = join s5 by $0,s10 by $0,s15 by $0,s20 by $0,s25 by $0,s30 by $0;
dump s31;

