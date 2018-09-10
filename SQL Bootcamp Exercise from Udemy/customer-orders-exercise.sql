create table customers(
    id INT auto_increment primary key,
    first_name VARCHAR(100),
    last_name vARCHAR(100),
    email varchar(100)
);

create table orders(
    id INT auto_increment primary key,
    order_date DATE,
    amount decimal(8, 2), 
    customer_id INT,
    foreign key(customer_id) references customers(id)
);
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
create table students (id INT auto_increment primary key,
    first_name varchar(50));
    
create table papers (title varchar(500),
    grade int,
    student_id int,
    foreign key (student_id) references students(id));
    
select first_name, ifnull(avg(grade), 0) as average, 
    case
    when avg(grade) >= 75 then 'passing'
    else 'failing'
    end as passing_status
from students 
left join papers 
    on students.id = papers.student_id 
group by first_name 
order by average desc;

create table reviewers(
id int auto_increment primary key,
first_name varchar(100),
last_name varchar(100)
);

create table series(
    id int auto_increment primary key,
    title varchar(100),
    released_year year(4),
    genre varchar(100)
);
    
create table reviews (
    id int auto_increment primary key,
    rating decimal(2,1),
    series_id int ,
    foreign key(series_id) references series(id),
    reviewer_id int,
    foreign key(reviewer_id) references reviewers(id)
);

SELECT 
    title, 
    avg(rating) as avg_rating
    
FROM series
JOIN reviews
    ON series.id = reviews.series_id
group by series.id
order by avg_rating asc;

select first_name, last_name, rating
from reviewers
join reviews on 
    reviewers.id = reviews.reviewer_id;
    
select * 
from series
left join reviews
    on series.id = reviews.series_id
where reviews.id is null;

select genre, round(avg(rating), 2) from series
join reviews on series.id = reviews.series_id
group by genre;

select first_name, last_name, count(rating) as COUNT2, ifnull(min(rating), 0) as MIN, 
ifnull(max(rating), 0) as MAX, ifnull(avg(rating), 0) as AVG,
case
    when COUNT2 = 0 then 'INACTIVE'
    else 'ACTIVE'
end as STATUS
from reviewers
left join reviews on reviewers.id = reviews.reviewer_id
group by reviewers.id;
