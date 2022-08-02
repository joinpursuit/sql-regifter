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
psql

CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);

\connect gifts;

-- 
\echo See details of the table you created
-- 
SELECT * FROM gifts;
or
\d+ gifts

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME price TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO
gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', 9, true);
--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE),

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

-- MY GIFTS DATA:
('strawberry candle', 'Kalilah', 10, false),
('Hess Toy Truck', 'John', 15, false),
('nutcracker toy', 'Mason', 30, false),
('Red Wine', 'Dan-ell', 35, false),
('Macbook Pro', 'Santa', 1500, false),
('toy gun from film shoot', 'Tim', 20, true);

--
\echo Query for gifts with a price greater than or equal to 20
--

 SELECT * FROM gifts WHERE value <= '20';

-- Didn't work....not sure why.

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM gifts WHERE gift LIKE '%candle';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE giver = 'Santa' OR value < 30;

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE gifts SET value = 2999 WHERE id = 2;

--
\echo Query for the updated item
--
SELECT * FROM gifts;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;

--
\echo Query for all the columns in your gifts table one more time
--
 value |     gift
-------+--------------
     9 | peach candle
  1500 | Macbook Pro
  2999 | peach candle


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


SELECT * FROM gifts;
 id |          gift           |      giver       | value | previously_regifted
----+-------------------------+------------------+-------+---------------------
  3 | cinnamon candle         | Nick             |    19 | t
  4 | soap on a rope          | Rudolf           |    29 | f
  5 | potpurri                | Elf on the Shelf |    39 | t
  6 | mango candle            | The Boss         |    49 | f
  7 | strawberry candle       | Kalilah          |    10 | f
  8 | Hess Toy Truck          | John             |    15 | f
  9 | nutcracker toy          | Mason            |    30 | f
 10 | Red Wine                | Dan-ell          |    35 | f
 12 | toy gun from film shoot | Tim              |    20 | t
(9 rows)


--
DROP TABLE IF EXISTS gifts;
