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
regifter=# CREATE TABLE gifts (id serial, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 
regifter=# \d gifts
-- 
\echo Alter the table so that the column price is changed to value 
-- 
regifter=# ALTER TABLE gifts DROP COLUMN price INT;
regifter-# ALTER TABLE gifts ADD COLUMN value INT;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
regifter=# INSERT INTO 
regifter-# gifts
regifter-# (gift, giver, value, previously_regifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', 9, TRUE);

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
('mango candle', 'The Boss', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('apple candle', 'bob', 25, FALSE),
('toy car', 'Santa', 15, TRUE),
('book', 'Santa', 900, FALSE),
('laptop', 'mom', 456789, TRUE),
('socks', 'Santa', 300, TRUE)
;


--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE value >= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM gifts WHERE gift LIKE '%candle%';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE giver='Santa' OR value > 30;
--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE giver != 'Santa';
--
\echo Update the second gift to have a value of 2999
-- 
regifter=# UPDATE gifts
regifter-# SET value = 2999
regifter-# WHERE id = 2;
--
\echo Query for the updated item
--
SELECT * FROM gifts WHERE id = 2;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
regifter=# DELETE FROM gifts 
regifter-# WHERE giver='Santa'
regifter-# RETURNING value,gift;

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts;
-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
regifter=# SELECT COUNT(gift)
regifter-# FROM gifts
regifter-# WHERE gift LIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
--
regifter=# SELECT AVG(value)
regifter-# FROM gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
regifter=# SELECT * FROM gifts  
regifter-# order by 'value' desc
regifter-# offset 2;
--
-- finish
--
DROP TABLE IF EXISTS gifts;
