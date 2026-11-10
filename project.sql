use project;

# ----------------------------------creation of tables-----------------------------------------------

create table Candidates(candidate_id int primary key , full_name varchar(20),phone bigint unique,email varchar(20) unique,city varchar(20));
create table Employers(employer_id int  primary key,company_name varchar(20),industry varchar(20));
create table Jobs(job_id int primary key, employer_id int ,title varchar(50),location varchar (30),salary int,foreign key (employer_id) references Employers(employer_id));
create table Applications(application_id int primary key,candidate_id int,job_id int,application_date date ,status varchar(20), foreign key(candidate_id) references
  Candidates(candidate_id),foreign key (job_id) references Jobs(job_id));
 create table Interviews(interview_id int primary key,application_id int ,interview_date date,mode varchar(50),result varchar(20),foreign key (application_id)  references 
  Applications(application_id));
  
  #-------------------------------insertion of values--------------------------------------------------

insert into Candidates values (1,'Aarav','900000001','c1@mail.com','Hyderabad'),(2,'Bhavya','900000002','c2@mail.com','Vijayawada'),
(3,'Charan','900000003','c3@mail.com','Vizag'),(4,'Divya','900000004','c4@mail.com','Guntur'),(5,'Esha','900000005','c5@mail.com','Warangal'),
(6,'Farhan','900000006','c6@mail.com','Nellore'),(7,'Gopi','900000007','c7@mail.com','Kurnool'),(8,'Hari','900000008','c8@mail.com','Tirupati'),
(9,'Isha','900000009','c9@mail.com','Chennai'),(10,'John','900000010','c10@mail.com','Bengaluru');
select *from candidates;

insert into Employers values
(101,'TechNova','IT'),(102,'DataWave','Analytics'),(103,'CloudEdge','Cloud'),(104,'FinCore','Finance'),(105,'HealthSoft','Healthcare');
select *from employers;

insert into Jobs values(1001,101,'Python Developer','Hyderabad',650000),(1002,101,'SQL Developer','Hyderabad',550000),(1003,102,'Data Analyst','Vizag',600000),
(1004,103,'Cloud Engineer','Bengaluru',850000),(1005,104,'BI Developer','Chennai',700000),(1006,105,'ML Engineer','Hyderabad',950000);
select *from jobs;

insert into Applications values(1,1,1001,'2026-07-01','Applied'),(2,2,1003,'2026-07-02','Shortlisted'),(3,3,1002,'2026-07-02','Rejected'),(4,4,1004,'2026-07-03','Interview'),
(5,5,1005,'2026-07-03','Selected'),(6,6,1006,'2026-07-04','Applied'),(7,7,1001,'2026-07-05','Interview'),(8,8,1002,'2026-07-06','Shortlisted'),(9,9,1004,'2026-07-07','Applied'),
(10,10,1006,'2026-07-08','Selected');
select * from applications;

insert into Interviews values(201,2,'2026-07-05','Online','Pending'),(202,4,'2026-07-06','Offline','Pending'),(203,5,'2026-07-07','Online','Selected'),
(204,7,'2026-07-08','Offline','Rejected'),(205,8,'2026-07-09','Online','Pending'),(206,10,'2026-07-10','Offline','Selected');
select * from interviews;

#------------Queries------------------------------
#1.List all jobs
select *from jobs;
select title from jobs;

#2.show applications with candidate names.
select a.application_id ,c.full_name from candidates c  join applications a on c.candidate_id =  a.candidate_id; 

#3.Display employer names in uppercase\lowercase
select upper(company_name) from employers;
select lower(company_name) from employers;


#show the first five charcters of every company name
select company_name, left(company_name,5)from employers;

#concate the candidate name and city
select full_name,city ,concat(full_name,city) from candidates;

#replace the word engineer with specialist in job title
select title, replace(title,'Engineer', 'specialist') as updated_title from jobs;

#Find all jobs where the title contains the word developer
select  title from jobs where title like '%Developer%';
select  * from jobs where title like '%Developer%';

#Find jobs in Hyderabad.
select  title  from jobs where location="hyderabad";

#Applications in last 7 days
select application_id,application_date  from applications order by application_date desc limit 7;	 #

#Count jobs company-wise
select j.title,e.company_name,count(j.job_id) from jobs j join employers e on j.employer_id=e.employer_id  group by j.title,e.company_name;

#format application dates in the format : mon-jul-26
select application_date ,date_format(application_date,'%a-%b-%y') from applications;

#find the candidates whose interviews are sheduled today


 #show the no.of days since each application wass submitted
 select  datediff(curdate(),application_date) as no_of_days from applications;

#display the highest and lowest salary offered
select  max(salary) as highest_salary ,min(salary) as lowest_salary from jobs  ;

#calculate the total salary budget offered by each company
select e.company_name ,sum(j.salary) as total_salary from  employers e  join jobs j on j.employer_id=e.employer_id group by e.company_name;

#count applications by status
select status,count(application_id) from applications group by status;

#Employer with most jobs
select  e.company_name ,count(j.job_id) from employers e join jobs j on j.employer_id=e.employer_id group by e.company_name order by company_name desc limit 1; 

#candidate with most applications
select  c.full_name,count(a.application_id) as total from candidates c join  applications a on c.candidate_id=a.candidate_id group by full_name ;

#selected candidates
select c.full_name from candidates c join applications a on c.candidate_id=a.candidate_id where status="selected";   #applications selected
select c.full_name from candidates c join applications a on c.candidate_id=a.candidate_id join interviews i on a.application_id = i.application_id where status="selected"; #interview selectedd

#Rejected applications
select application_id  from applications  where status="rejected";

#companies with more than one job
select e.company_name , count(e.employer_id) as more_jobs from employers e  join jobs j on e.employer_id=j.employer_id 
group by e.company_name  having more_jobs >1;

#show locations having more than two job openings
select location,count(job_id)  as morejobs from jobs  group by location having count(job_id) >2 order by location;  

#average salary by company
select e.company_name, avg(j.salary) from employers e join jobs j on e.employer_id=j.employer_id group by e.company_name ;

#top 5 lastest jobs
select  * from Jobs order by job_id desc limit 5;

#26. jobs in IT industry
select e.industry, j.title from employers e join jobs j on e.employer_id=j.employer_id  where industry="it" ; 

#27. display candidate name , company name and  job title for every application
select c.full_name,e.company_name,j.title ,a.application_id from candidates c join applications a on c.candidate_id=a.candidate_id
join jobs j on a.job_id =j.job_id join employers e on e.employer_id=j.employer_id;

#28. display inteview details along with candidate and company information
select i.interview_id,i.application_id,i.interview_date,i.mode,i.result , c.full_name,e.company_name from candidates c join applications a on c.candidate_id=a.candidate_id
join jobs j on a.job_id =j.job_id join employers e on e.employer_id=j.employer_id join interviews i on a.application_id=i.application_id;

#29 Display company names with the total number of applications received.
select e.company_name,count(application_id) as total from applications a join jobs j on a.job_id =j.job_id join
 employers e on j.employer_id=e.employer_id group by company_name;
 
 #30.Candidates without applications.
 select c.full_name from candidates c left join applications a on a.candidate_id=c.candidate_id where a.application_id is null;
 
 #31.Display candidates who have never attended an interview.
 select c.full_name from candidates c join applications a on a.candidate_id=c.candidate_id left join interviews i on i.application_id=a.application_id
 where i.interview_id is null;
 
 select full_name from candidates where candidate_id not in 
 (select candidate_id from applications where application_id in 
 (select application_id from interviews));  # subquerys
 
 #Create a view named Selected_Candidates showing selected candidates with company and job details.
 create view  selected_candidates  as select  full_name from candidates where candidate_id in
 (select candidate_id from applications where application_id in
 (select application_id from interviews where result = "selected"));
 
 select * from selected_candidates;
 
# Create a view to display all active job postings.
create view jobpostings as select title,location,salary,employer_id from jobs where employer_id in
(select employer_id from jobs);

select * from jobpostings;

#34.Retrieve data from the created views.
select * from selected_candidates;
select * from jobpostings;


#35.Start a transaction and update application status to Interview Scheduled.
start transaction;
update applications 
set status = "interview scheduled" where application_id >0 ;
 select * from applications;
 rollback;
 select * from applications;
 
 #36.Roll back a transaction after deleting an application accidentally.
 begin;
 delete  from applications where application_id =1;
 rollback;
 #37. Create a stored procedure to display all jobs offered by a particular employer. Input: employer_id , Display job title, location, and salary.
call job_offers(102);
call job_offers(101);

#38.Create a stored procedure to display all applications with a particular status. Input: status  For example, display all Shortlisted applications.
call application_status("applied");
call application_status("rejected");
call application_status("interview");

#39. Create a trigger on the Applications table.  Whenever a new application is inserted, automatically store the application_id,
#candidate_id, job_id, and application date in an Application_Log table.

create table  application_log(application_id int,candidate_id int ,job_d int,application_date date,status varchar(20) );
insert into applications values (11,10,1004,'2026-07-09','applied');
select * from application_log;
select * from candidates;
desc applications;
select * from applications;

#40. Create a trigger on the Interviews table. Whenever an interview record is deleted, automatically store the deleted interview details in an Interview_Archive table.
create table  interview_archieve (interview_id int ,application_id int ,interview_date date,mode varchar(50),result varchar(20));
delete  from interviews where interview_id =201;
select * from interview_archieve;
select * from interviews;
insert into interviews values (201,2,'2026-07-05','Online','Pending');