use default;
select socname,count(jobtitle) total from h1bfinal where lower(jobtitle) ='data scientist' group by socname order by total desc limit 10;
