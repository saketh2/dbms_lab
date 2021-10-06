--1.For a certain event only students who belong to team R or are females are allowed to participate. Find the list of students eligible.
 select name from student where team="R"
 union
 select name from student where gender="F";

--2. Display count of students in each team.
 select count(name),team from student group by team;
 
 --3.Display the average math score of boys from eachteam.
 select avg(math) as average_score,team from student where gender="M" group by team;
 
 --4.Display data in the following format using group by and order by .
  select * from student group by gender , team order by team;
  
  --5.Use the group by followed by order by followed by limit to show team and avg(sci) columns of the top two teams with highest average in science.
   select avg(sci),team from student group by team order by avg(sci) desc limit 2;
