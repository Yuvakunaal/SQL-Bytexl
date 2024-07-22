-- Creating table with primary key contraint :-
-- auto_increment : Used to increment (+1)
create table notes(
    id int primary key auto_increment,
    title varchar(100),
    notes varchar(1000)
)

-- Drop :-
-- Removes whole table from database (doesn't exist in database)
drop table notes;

-- Delete :-
-- Removes all rows and columns from table (exists in database like empty table)
delete from notes;

-- Creating table with Contraints at last (not null & primary key) :-
create table notes(
    id int auto_increment,
    title varchar(100) not null,
    notes varchar(1000) not null,
    primary key(id)
)

-- Insertion (single row at a time) :-
insert into notes(title,notes) 
values(
    'HTML 5','HTML5 creates webpage.'
)
insert into notes(title,notes) 
values(
    'CSS 3','CSS3 designs the website'
)
insert into notes(title,notes) 
values(
    'Python','Python is a high-level.'
)

-- Insertion (multiple rows at a time) :-
insert into notes(title,notes)
values
('C','C is a powerful.'),
('C++','C++ is an extension of the C programming language.')

-- Update :-
-- Better & professional way of updating is to use primary key column rather than using other columns.
update notes
set notes='C is programming language.'
where id=4;

-- Insert any irrelevant data row to make delete operation
insert into notes(title,notes) 
values(
    'Science','Science is study of nature.'
)

-- Delete :-
-- Better & professional way of deleting is to use primary key column rather than using other columns.
delete from notes
where id=6;

-- Display :-
-- To display whole table (*)
select * from notes;

-- To display specific columns
select id,title,notes from notes;

-- To display specific columns and record (based on where condition)
select id,title,notes 
from notes 
where id=3;

-- 'as' key word : Used to display column name as specified (look at the below examples you will understand)

-- Operators :-
-- column selectors are expressions :- + | - | * | /
-- conditional operators :- = | <> | >= | > | <= | <
    -- in, between, like, exist
        -- column in(val1,val2,...), column not in(val1,val2)  -> one of values
        -- column between x and y, not between x and y         -> numbers / dates
        -- column like '%a' -> column records ends with 'a'
            -- column like 'a%' -> column records starts with 'a'
            -- column like '%a%' -> column contains text 'a'
        -- exist(sub query) 
-- logical operators :- and or not

-- Using +
select 2+id as adding,title,notes
from notes;

-- Using -
select id-2 as diff,title,notes
from notes;

-- Using *
select id*3 as prod,title,notes
from notes;

-- Using /
select id/2 as div,title,notes
from notes;

-- Using '='
select id,title,notes 
from notes
where id=3;

-- Using '<>'
select id,title,notes
from notes
where id<>3;

-- Using 'in'
select id,title,notes 
from notes 
where title in ('HTML 5','CSS 3');

-- Using 'not in'
select id,title,notes
from notes
where id not in(2,4);

-- Using between
select id,title,notes 
from notes
where id between 1 and 3;

-- Using not between
select id,title,notes
from notes
where id not between 1 and 3;

-- Using 'like'
select id,title,notes
from notes
where title like '%n'

select id,title,notes 
from notes 
where title like 'C%';

select id,title,notes
from notes
where notes like '%language%';

-- Using 'and'
select id,title,notes
from notes
where id=1 and title='HTML 5';

-- Using 'or'
select id,title,notes 
from notes 
where title='HTML 5' or title='CSS 3';

-- Using 'not'
select id,title,notes
from notes
where not id=1;
