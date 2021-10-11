--1.
a). create table marks_sem1(rollno int,math int,sci int,eng int,social int,sports int);

b).insert into marks_sem1 values();

c).select * from marks_sem1 order by rollno;

d).alter table marks_sem1
add primary key (rollno);

--2.
a)create table faculty(name varchar(20),fid char(4),subject varchar(20));

b).insert into faculty values("kakashi","4003","math");
   insert into faculty values("guy","5002","sports");
   insert into faculty values("kurenai","5038","eng");
   
c).alter table faculty
   add primary key (fid);
   
--3.
a)create table sem1(subj_id char(4) not null primary key,subject varchar(20),fid char(4),cap int,campus int,foreign key (fid) references faculty(fid), foreign key (campus) references campus(cid));

--4.
alter table campus 
add primary key (cid);

--5.
a) 
alter table student drop column math, drop column sci, drop column eng, drop column social, drop column sports;


b) 
alter table student add foreign key (rollno) references marks_sem1(rollno);


c)
alter table student add cid int;


d) 
alter table student add foreign key (cid) references campus(cid);
