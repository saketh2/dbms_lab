1.Suppose we are having a vaccination drive and someone suggests we give the vaccines as per age.We want to vaccinate the eldest student first and youngest last with nobody under 18( as theremight be people under 18). Make a list containing name, rno and age in descending order of age.(sub query, alias, aggregation)
select name,rollno,year(curdate())-year(dob) AS age from student where year(curdate())-year(dob)>=18 ORDER BY age DESC;


2.Suppose the college was holding an event for sports for the students, one of the sports sectionshas a minimum age of 20 years for participating. Now give a count of women and men separatelythat qualify for this event from the students table. (sub queries, aggregation)
select count(case when gender='M' then 1 end) as men, count(case when gender='F' then 1 end) as women from student where floor(DATEDIFF(CURDATE(),dob)/365.25)>=20;

3.Display number of students whose maths score is more than the class avg score in all subjects.(sub query)
 select count(*) as count from student where math>(select avg(math+sci+eng+social+sports)/5 from student);
 
4.Suppose the university expansion team was looking at how they should expand further and inwhat areas of the country. As of now they currently need the ratio of campus capacity that is inthe south to the west zone of the country. (Like, use resource mentioned towards the end)
  select sum(case when pincode like '5%' then cap when pincode like '6%' then cap else 0 end)/sum(case when pincode like '3%' then cap when pincode like '4%' then cap else 0 end) as ratio from campus;
  
 5.This year the college has decided to not only award the student who came first in the college(fromany batch/joining yrs) but also the student who has come second. Find the student who has thesecond highest avg in the table.(sub queries, aggregation, comparison, logical)
 select name,(math+sci+eng+social+sports)/5 as avg from student order by avg desc limit 1,1;


6.Display student’s name, rno, avg marks (“avg_marks”), score status (“score_status”) where scorestatus is “High” if above average and “Low” if below average. (sub queries)
 select name, rollno, (math+sci+eng+social+sports)/5 as avg_marks, (case when ((math+sci+eng+social+sports)/5)>(select (avg(math)+avg(sci)+avg(eng)+avg(social)+avg(sports))/5 from student) then "High" else "Low" end) as score_status from student;
 
