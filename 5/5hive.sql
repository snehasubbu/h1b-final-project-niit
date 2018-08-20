use default;
select jobtitle,year,count(casestatus) as tot from h1bfinal where year=2011 group by jobtitle,year order by tot desc limit 10; 
select jobtitle,year,count(casestatus) as tot from h1bfinal where year=2012 group by jobtitle,year order by tot desc limit 10; 
select jobtitle,year,count(casestatus) as tot from h1bfinal where year=2013 group by jobtitle,year order by tot desc limit 10; 
select jobtitle,year,count(casestatus) as tot from h1bfinal where year=2014 group by jobtitle,year order by tot desc limit 10; 
select jobtitle,year,count(casestatus) as tot from h1bfinal where year=2015 group by jobtitle,year order by tot desc limit 10; 
select jobtitle,year,count(casestatus) as tot from h1bfinal where year=2016 group by jobtitle,year order by tot desc limit 10; 
