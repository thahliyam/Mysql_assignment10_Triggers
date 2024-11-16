-- 1. Create a table named teachers with fields id, name,
-- subject, experience and salary and insert 8 rows. 

create table teachers(Id int primary key not null,Name varchar(20) not null,
Subject varchar(20) not null,Experience int not null,
Salary int not null);

DESC Teachers;

INSERT INTO teachers (Id, Name, Subject, Experience, Salary) VALUES
(1, 'Ravi', 'Mathematics', 10, 50000),
(2, 'Anjali', 'Physics', 8, 48000),
(3, 'Vikram', 'Chemistry', 12, 55000),
(4, 'Meera', 'Biology', 5, 45000),
(5, 'Rajesh', 'English', 15, 60000),
(6, 'Sneha', 'History', 7, 47000),
(7, 'Arjun', 'Computer Science', 10, 52000),
(8, 'Pooja', 'Economics', 6, 46000);

select * from teachers;

-- 2. Create a before insert trigger named before_insert_teacher
-- that will raise an error “salary cannot be negative” if the salary
-- inserted to the table is less than zero. 

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_TEACHER 
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
   IF NEW.SALARY<0 
   THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='salary cannot be negative';
   END IF;
   END $$
   DELIMITER ;
   
   SHOW TRIGGERS FROM ENTRI_D41;
  
  INSERT into teachers VALUES(9, 'MAHI', 'Mathematics', 4, -50000);

--  3. Create an after insert trigger named after_insert_teacher
 -- that inserts a row with teacher_id,action, timestamp to a table 
 -- called teacher_log when a new entry gets inserted to the teacher 
 -- table. tecaher_id -> column of teacher table, 
 -- action -> the trigger action, timestamp -> time at which the new row
 -- has got inserted. 
 
 Create table teacher_log(Teacher_Id int not null,Action varchar(20) not null,
Timestamp datetime not null);

select * from teacher_log;

DELIMITER $$
CREATE TRIGGER AFTER_INSERT_TEACHER 
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
INSERT INTO teacher_log (Teacher_id, Action, Timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
    END $$
    DELIMITER ;
    
    INSERT INTO TEACHERS VALUES (10, 'MAHI', 'Mathematics', 4, 50000);
    SELECT * FROM TEACHERS;
  SELECT * FROM teacher_log;
  
-- 4. Create a before delete trigger that will raise an error when you
 -- try to delete a row that has experience greater than 10 years.
 
 DELIMITER $$
CREATE TRIGGER BEFORE_DELETE_TRIGGER 
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
   IF OLD.EXPERIENCE>10 
   THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='This teacher has more than 10 years of experience,cannot delete';
   END IF;
   END $$
   DELIMITER ;
   
Delete from teachers where Id=3;
 
-- 5. Create an after delete trigger that will insert a row to
-- teacher_log table when that row is deleted from teacher table.

DELIMITER $$
CREATE TRIGGER AFTER_DELETE_TRIGGER 
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
  insert into teacher_log(Teacher_Id,Action,Timestamp)
  values(old.ID,'Delete',NOW());
  END $$
  DElIMITER ;
  
  Delete from teachers where subject='Biology';
  set sql_safe_updates=0;
   
   select * from teacher_log;
   
   SHOW TRIGGERS FROM ENTRI_D41;
   
