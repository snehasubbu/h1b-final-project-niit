use default;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='Y' and year=2011 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='N' and year=2011 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='Y' and year=2012 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='N' and year=2012 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='Y' and year=2013 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='N' and year=2013 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='Y' and year=2014 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='N' and year=2014 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='Y' and year=2015 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='N' and year=2015 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='Y' and year=2016 group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='N' and year=2016 group by jobtitle,year,fulltime order by tot desc;

