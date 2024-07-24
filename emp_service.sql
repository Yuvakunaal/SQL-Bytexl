-- Procedure is like functions in programming languages

drop procedure if exists sp_notes_read_all;

create procedure sp_notes_read_all()
begin
select id,title,notes from notes;
end;

call sp_notes_read_all();

--
drop procedure if exists sp_notes_read_byid;

create procedure sp_notes_read_byid(id_ int)
begin 
select id,title,notes from notes where id=id_;
end;

call sp_notes_read_byid(2);

--
drop procedure if exists sp_notes_create;
create procedure sp_notes_create(p_title varchar(255),p_notes varchar(1000))
begin
declare v_id int;
insert into notes(title,notes) values(
    p_title,p_notes
);
set v_id = last_insert_id();
select id,title,notes from notes where id=v_id;
end;

call sp_notes_create('Math','It is used to calculate anything.')
call sp_notes_create('Science','study of nature.')

-- Employee service making
drop procedure if exists sp_employees_service;

create procedure sp_employees_service(p_id int)
begin

declare v_dob datetime;
declare v_joining_date datetime;
declare v_age int;
declare v_max_age int;
declare v_experience int;
declare v_retires_in int;
declare v_service int;
declare v_perc_experience float;

select date_of_birth,joining_date into v_dob,v_joining_date from employees where employee_id=p_id;

set v_age = timestampdiff(year,v_dob,now());
set v_max_age = 60;
set v_retires_in = v_max_age - v_age;
set v_experience = timestampdiff(year,v_joining_date,now());
set v_service = v_retires_in + v_experience;
set v_perc_experience = v_experience/v_service * 100;

select e.*,v_age as age,
v_max_age as max_age,
v_retires_in as retires_in,
v_experience as experience,
v_service as service,
v_perc_experience as experience_perc 
from employees as e 
where employee_id = p_id;

end;

select * from employees;

call sp_employees_service(3);
