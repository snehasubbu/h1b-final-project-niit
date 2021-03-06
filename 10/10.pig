a = LOAD '/user/hive/warehouse/h1bfinal' using PigStorage() as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, worksite:chararray, longitute:double, latitute:double);
a1 = group a by job_title;
a2 = foreach a1 generate group , COUNT(a.$1);
a3 = Filter a by LOWER(case_status) == 'certified';
a4 = Group a3 by $4;
a5 = Foreach a4 generate group,COUNT($1);
a6 = Filter a by LOWER(case_status) == 'certified-withdrawn';
a7 = Group a6 by $4;
a8 = Foreach a7 generate group,COUNT($1);
a9 = join a2 by $0,a5 by $0, a8 by $0;
a10 = Foreach a9 generate $0,$1,$3,$5;
a11 = Foreach a10 generate $0,(float)($2+$3)*100/($1),$1;
a12 = Filter a11 by $1>70 and $2>1000;
a13 = order a12 by $1 desc;
dump a13;
store a13 into '/Pig1/Que10' using PigStorage();

