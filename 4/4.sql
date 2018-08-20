use default;
select employer_name,year,count(employer_name) as tat from h1b_final where year='2011'group by employer_name,year order by tat desc limit 5;
select employer_name,year,count(employer_name) as tat from h1b_final where year='2012'group by employer_name,year order by tat desc limit 5;
select employer_name,year,count(employer_name) as tat from h1b_final where year='2013'group by employer_name,year order by tat desc limit 5;
select employer_name,year,count(employer_name) as tat from h1b_final where year='2014'group by employer_name,year order by tat desc limit 5;
select employer_name,year,count(employer_name) as tat from h1b_final where year='2015'group by employer_name,year order by tat desc limit 5;
select employer_name,year,count(employer_name) as tat from h1b_final where year='2016'group by employer_name,year order by tat desc limit 5;
