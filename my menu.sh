#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?[1a.mapreduce]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest average growth in applications.[1b.Pig] ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year?[2a.mapreduce] ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4) ${MENU} find top 5 locations in the US who have got certified visa for each year.[2b.hive]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5) ${MENU} Which industry (SOC) has the most number of Data Scientist positions?[3.mapreduce&hive]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6) ${MENU} Which top 5 employers file the most petitions each year?[4.hive] ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year (all applications)?[5.hive]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8) ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.[6.pig]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9) ${MENU} Create a bar graph to depict the number of applications for each year[7.pig&Mapreduce&hive]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10) ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order[8.hive]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11) ${MENU} Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?[9.pig]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 12) ${MENU} Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?[10.pig] ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 13) ${MENU}Export result for option no 12 to MySQL database.[11.sql and sqoop]${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
clear
show_menu
	while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in

        1) clear;
        option_picked "1 a) Is the number of petitions with Data Engineer job title increasing over time?";
	
		hadoop jar /home/hduser/Desktop/1a.jar  /data /file1/out1a
		hadoop fs -cat /file1/out1a/part-r-00000
	
        show_menu;
        ;;

        2) clear;
        option_picked "1 b)find Top 5 job titles who are having highest average growth in applications";

		pig /home/hduser/Documents/project/projecth1b/1/1b.pig;
	
        show_menu;
        ;; 
        3) clear;
        option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
		hadoop jar /home/hduser/Desktop/2a.jar  /data /file1/out2a
		hadoop fs -cat /file1/out2a/part-r-00000

        show_menu;
        ;;

	4) clear;
        option_picked "2 b) find top 5 locations in the US who have got certified visa for each year.";
        	echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
             echo "top 5 locations in the US who have got certified visa for this year";
	    hive -e "use default;  select worksite,count(*) as total from h1bfinal where casestatus='CERTIFIED' and year=$var group by worksite order by total desc limit 5;"
       show_menu;
        ;;  

	5) clear;
        option_picked "3) Which industry has the most number of Data Scientist positions?";
             echo "The Industry which has the most number of Data Scientist positions:";
	    hadoop jar /home/hduser/Desktop/que3.jar  /data /file1/output3
	    hadoop fs -cat /file1/output3/part-r-00000

       show_menu;
        ;;

        6) clear;
        option_picked "4)Which top 5 employers file the most petitions each year?";
             echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
             echo "top 5 employers files most petitions for this year";
	    hive -e "use default;  select empname,count(*) as total from h1bfinal where year=$var group by empname order by total desc limit 5;"
         show_menu;
        ;;

        7) clear;
        option_picked "5) Find the most popular top 10 job positions for H1B visa applications for each year (all applications)?";
		echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
             echo "top 10 job positions for this year";
	    hive -e "use default;  select jobtitle,count(*) as total from h1bfinal where year=$var group by jobtitle order by total desc limit 10;"
        show_menu;
        ;;

        8) clear;
		option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.";
              echo "The percentage and the count of each case status on total applications for each year:";
	    pig /home/hduser/Documents/project/projecth1b/6/6.pig

        show_menu;
        ;;

	9) clear;
        option_picked "7) Create a bar graph to depict the number of applications for each year";
        echo -e "${MENU}Select One Option From Below${NORMAL}"
        echo -e "${MENU}**${NUMBER} 1)${MENU} Hive${NORMAL}"
        echo -e "${MENU}**${NUMBER} 2)${MENU} MapReduce ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 3)${MENU} pig ${NORMAL}"
	        read n
	    case $n in
1) echo “Hive”
              echo "The number of applications for each year:";
	    hive -e "use default; select year, count(*) from h1bfinal group by year;"
2) echo “MapReduce”
	hadoop jar /home/hduser/Desktop/7.jar  /data /file1/output7
	hadoop fs -cat /file1/output7/part-r-00000
3) echo “pig”
	echo "The number of applications for each year:";
	pig /home/hduser/Documents/project/projecth1b/7/7.pig
	
        show_menu;
        ;;

	10) clear;
        option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order";
	echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
        echo "The average prevailing wage:";
	hive -e "use default;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='Y' and year=$var group by jobtitle,year,fulltime order by tot desc;
select jobtitle,year,fulltime,avg(wage) as tot from h1bfinal where fulltime ='N' and year=$var group by jobtitle,year,fulltime order by tot desc;"

        show_menu;
        ;;

	11) clear;
	option_picked "9) Which are   employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?"
		pig /home/hduser/Documents/project/projecth1b/9/9.pig
        show_menu;
        ;;
	
	12) clear;
	option_picked "10) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"
		pig pig /home/hduser/Documents/project/projecth1b/10/10.pig
        show_menu;
        ;;

	13) clear;
	option_picked "11) Export result for question no 10 to MySql database."
		mysql -u root -p'933668' -e 'drop database sqoop;create database if not exists sqoop;use sqoop;create table que11(job_title varchar(100),petitions int,success_rate float);';

		sqoop export --connect jdbc:mysql://localhost/sqoop --username root --password 'sneh1234' --table que11 --update-mode allowinsert  --export-dir /Home/hduser/Documents/project/projecth1b/10/part-r-00000 --input-fields-terminated-by '\t';

		echo -e '\n\nContents Exported to MySQL Database:\n\n'

		mysql -u root -p'sneh1234' -e 'select * from sqoop.q11';
        show_menu;
        ;;

		\n) exit;   
	;;
        
	*) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done



