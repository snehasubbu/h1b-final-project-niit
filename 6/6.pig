app = load '/user/hive/warehouse/h1b_final' using PigStorage() as
(s_no:int, case_status:chararray, employer_name:chararray,
soc_name:chararray, job_title:chararray,
full_time_position:chararray,prevailing_wage:int,year:chararray,
worksite:chararray, longitute:double, latitute:double);
a = FILTER app by year == '2011';
b = GROUP a by $1;
fin = FOREACH b GENERATE group, COUNT($1);
a1 = FILTER app by year == '2012';
b1 = GROUP a1 by $1;
fin1 = FOREACH b1 GENERATE group, COUNT($1);
a2 = FILTER app by year == '2013';
b2 = GROUP a2 by $1;
fin2 = FOREACH b2 GENERATE group, COUNT($1);
a3 = FILTER app by year == '2014';
b3 = GROUP a3 by $1;
fin3 = FOREACH b3 GENERATE group, COUNT($1);
a4 = FILTER app by year == '2015';
b4 = GROUP a4 by $1;
fin4 = FOREACH b4 GENERATE group, COUNT($1);
a5 = FILTER app by year == '2016';
b5 = GROUP a5 by $1;
fin5 = FOREACH b5 GENERATE group, COUNT($1);
app1 = JOIN fin by $0,fin1 by $0,fin2 by $0,fin3 by $0,fin4 by $0,fin5 by $0;
app2 = FOREACH app1 GENERATE $0,$1,$3,$5,$7,$9,$11;
app3 = FOREACH app2 GENERATE $0,$1,(float)$1/3002445*100,$2,(float)$2/3002445*100,$3,(float)$3/3002445*100,$4,(float)$4/3002445*100,$5,(float)$5/3002445*100,$6,(float)$6/3002445*100;
dump app3;
