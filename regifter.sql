-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean


-- 
\echo See details of the table you created
-- 


-- 
\echo Alter the table so that the column price is changed to value 
-- 


-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 


--
\echo Query for all the columns in your gifts table
-- 


--
\echo Uncomment below to insert 5 more gifts
-- 

-- INSERT INTO gifts (gift, giver, value, previously_regifted)
-- VALUES
-- ('peach candle', 'Santa', '9', TRUE),
-- ('cinnamon candle', 'Nick', '19', TRUE),
-- ('soap on a rope', 'Rudolf', '29', FALSE),
-- ('potpurri', 'Elf on the Shelf', '39', TRUE),
-- ('mango candle', 'The Boss', '49', FALSE)
-- ;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--



--
\echo Query for gifts with a price greater than or equal to 20
--


--
\echo Query for every gift that has the word candle in it, only show the gift column
--


--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--


--
\echo Query for every gift whose giver is NOT Santa
--


--
\echo Update the second gift to have a value of 2999
-- 


--
\echo Query for the updated item
--


--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--


--
\echo Query for all the columns in your gifts table one more time
--



-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 


--
\echo Get the AVEREAGE value from all the gifts
--


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

--
-- finish
--
DROP TABLE IF EXISTS gifts;

tashrif=# 
tashrif=# DROP DATABASE regifter
tashrif-# ;
DROP DATABASE
tashrif=# CREATE DATABASE regifter;
CREATE DATABASE
tashrif=# \i regifter.sql
DROP DATABASE
CREATE DATABASE
You are now connected to database "regifter" as user "tashrif".
Create a table called gifts
See details of the table you created
Alter the table so that the column price is changed to value
Insert a peach candle, given by Santa thats value is 9 and has been previously regifted
Query for all the columns in your gifts table
Uncomment below to insert 5 more gifts
Insert 5 more gifts of your own choosing, include 1 more candle
Query for gifts with a price greater than or equal to 20
Query for every gift that has the word candle in it, only show the gift column
Query for every gift whose giver is Santa OR value is greater than 30
Query for every gift whose giver is NOT Santa
Update the second gift to have a value of 2999
Query for the updated item
Delete all the gifts from Santa and return the value and gift of the gift you have deleted
Query for all the columns in your gifts table one more time
Count the total number of gifts that have the word candle in it
Get the AVEREAGE value from all the gifts
Limit to 3 gifts, offset by 2 and order by price descending
psql:regifter.sql:119: NOTICE:  table "gifts" does not exist, skipping
DROP TABLE
regifter=# CREATE TABLE gifts (id serial, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);
CREATE TABLE
regifter=# \d gifts
                                   Table "public.gifts"
       Column        |  Type   | Collation | Nullable |              Default              
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          | 
 giver               | text    |           |          | 
 value               | integer |           |          | 
 previously_regifted | boolean |           |          | 

regifter=# INSERT INTO 
regifter-# gifts
regifter-# (gift, giver, value, previously_regifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', 9, TRUE);
INSERT 0 1
regifter=# SELECT * FROM gifts;
 id |     gift     | giver | value | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
(1 row)

regifter=# INSERT INTO 
regifter-# gifts (gift, giver, value, previously_regifted)
regifter-# VALUES
regifter-# ('apple candle', 'bob', 25, FALSE)
regifter-# ('toy car', 'Santa', 15, TRUE)
regifter-# ('book', 'Santa', 900, FALSE)
regifter-# ('laptop', 'mom', 456789, TRUE)
regifter-# ('socks', 'Santa', 300, TRUE);
ERROR:  syntax error at or near "("
LINE 5: ('toy car', 'Santa', 15, TRUE)
        ^
regifter=# ('apple candle', 'bob', 25, FALSE)
regifter-# regifter-# ('toy car', 'Santa', 15, TRUE)
regifter-# regifter-# ('book', 'Santa', 900, FALSE)
regifter-# regifter-# ('laptop', 'mom', 456789, TRUE)
regifter-# regifter-# ('socks', 'Santa', 300, TRUE)
regifter-# clear                                                                                                                                               
regifter-# SELECT * FROM gifts
regifter-# ;
ERROR:  syntax error at or near "'apple candle'"
LINE 1: ('apple candle', 'bob', 25, FALSE)
         ^
regifter=# SELECT * FROM gifts;
 id |     gift     | giver | value | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
(1 row)

regifter=# INSERT INTO
regifter-# gifts (gift, giver, value, previously_regifted)
regifter-# VALUE
regifter-# VALUES
regifter-# ('apple candle', 'Santa', 9, TRUE);
ERROR:  syntax error at or near "VALUE"
LINE 3: VALUE
        ^
regifter=# \d gifts
                                   Table "public.gifts"
       Column        |  Type   | Collation | Nullable |              Default              
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          | 
 giver               | text    |           |          | 
 value               | integer |           |          | 
 previously_regifted | boolean |           |          | 

regifter=# SELECT * FROM gifts
regifter-# ;
 id |     gift     | giver | value | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
(1 row)

regifter=# INSERT INTO
regifter-# gifts (gift, giver, value, previously-regifted)
regifter-# VALUES
regifter-# ('apple candle', 'Santa', 9, TRUE);
ERROR:  syntax error at or near "-"
LINE 2: gifts (gift, giver, value, previously-regifted)
                                             ^
regifter=# INSERT INTO                                                                                                                                         gifts (gift, giver, value, previously_regifted)                                                                                                                VALUES                                                                                                                                                         ('apple candle', 'Santa', 9, TRUE);
INSERT 0 1
regifter=# SELECT * FROM gifts
regifter-# ;
 id |     gift     | giver | value | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
  2 | apple candle | Santa |     9 | t
(2 rows)

regifter=# INSERT INTO                                                                                                                                         gifts (gift, giver, value, previously_regifted)                                                                                                                VALUES                                                                                                                                                         ('car', 'Santa', 9999, FALSE),
regifter-# ('laptop', 'mom', 400, FALSE),
regifter-# ('socks', 'Santa', 99999, TRUE);
INSERT 0 3
regifter=# SELECT * FROM gifts
regifter-# ;
 id |     gift     | giver | value | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
  2 | apple candle | Santa |     9 | t
  3 | car          | Santa |  9999 | f
  4 | laptop       | mom   |   400 | f
  5 | socks        | Santa | 99999 | t
(5 rows)

regifter=# INSERT INTO
regifter-# gifts (gift, giver, value, previously_regifted)
regifter-# VALUES
regifter-# ('a single pencil lol', 'friend', 1, TRUE);
INSERT 0 1
regifter=# SELECT * FROM gifts;
 id |        gift         | giver  | value | previously_regifted 
----+---------------------+--------+-------+---------------------
  1 | peach candle        | Santa  |     9 | t
  2 | apple candle        | Santa  |     9 | t
  3 | car                 | Santa  |  9999 | f
  4 | laptop              | mom    |   400 | f
  5 | socks               | Santa  | 99999 | t
  6 | a single pencil lol | friend |     1 | t
(6 rows)

regifter=# SELECT * FROM gifts WHERE value >= 20;
 id |  gift  | giver | value | previously_regifted 
----+--------+-------+-------+---------------------
  3 | car    | Santa |  9999 | f
  4 | laptop | mom   |   400 | f
  5 | socks  | Santa | 99999 | t
(3 rows)

regifter=# SELECT * FROM gifts WHERE LIKE %candle%;
ERROR:  syntax error at or near "%"
LINE 1: SELECT * FROM gifts WHERE LIKE %candle%;
                                       ^
regifter=# SELECT * FROM gifts WHERE LIKE '%candle%';
ERROR:  type "like" does not exist
LINE 1: SELECT * FROM gifts WHERE LIKE '%candle%';
                                  ^
regifter=# SELECT * FROM gifts WHERE gift LIKE '%candle%';
 id |     gift     | giver | value | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
  2 | apple candle | Santa |     9 | t
(2 rows)

regifter=# SELECT * FROM gifts WHERE giver = 'Santa" OR value >30;
regifter'# ;
regifter'# SELECT * FROM gifts WHERE giver = 'Santa' OR value > 30;
regifter'# SELECT * FROM gifts 
regifter'# ;
regifter'# \q
Use control-D to quit.
regifter'# ^D\q