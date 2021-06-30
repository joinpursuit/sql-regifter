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
CREATE TABLE gifts (id serial, gift TEXT, giver TEXT, value integer, previously_regifted boolean);

-- 
\echo See details of the table you created
-- 
\d gifts;

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME value to price;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, giver, price, previously_regifted) VALUES ('peach candle', 'Santa', 9, true);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;
--  id |     gift     | giver | price | previously_regifted 
-- ----+--------------+-------+-------+---------------------
--   1 | peach candle | Santa |     9 | t
-- (1 row)

--
\echo Uncomment below to insert 5 more gifts
-- ('peach candle', 'Santa', '9', TRUE),
-- ('cinnamon candle', 'Nick', '19', TRUE),
-- ('soap on a rope', 'Rudolf', '29', FALSE),
-- ('potpurri', 'Elf on the Shelf', '39', TRUE),
-- ('mango candle', 'The Boss', '49', FALSE)
-- ;


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
INSERT INTO gifts (gift, giver, price, previously_regifted) VALUES 
('strawberry candle', 'Mrs.Claus', '3', FALSE),
('shoes', 'Jason', '11', TRUE),
('laptop', 'Anju', '29', FALSE),
('comforter', 'Elf', '19', FALSE),
('water bottle', 'Mom', '49', FALSE)
;


--
\echo Query for gifts with a price greater than or equal to 20
--
regifter=# SELECT * FROM gifts WHERE price >= 20;
--  id |      gift      |      giver       | price | previously_regifted 
-- ----+----------------+------------------+-------+---------------------
--   4 | soap on a rope | Rudolf           |    29 | f
--   5 | potpurri       | Elf on the Shelf |    39 | t
--   6 | mango candle   | The Boss         |    49 | f
--   9 | laptop         | Anju             |    29 | f
--  11 | water bottle   | Mom              |    49 | f
-- (5 rows)


--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT gift FROM gifts WHERE gift LIKE '%candle%';
--        gift        
-- -------------------
--  peach candle
--  peach candle
--  cinnamon candle
--  mango candle
--  strawberry candle
-- (5 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE giver = 'Santa' OR price >=30;
--  id |     gift     |      giver       | price | previously_regifted 
-- ----+--------------+------------------+-------+---------------------
--   1 | peach candle | Santa            |     9 | t
--   2 | peach candle | Santa            |     9 | t
--   5 | potpurri     | Elf on the Shelf |    39 | t
--   6 | mango candle | The Boss         |    49 | f
--  11 | water bottle | Mom              |    49 | f
-- (5 rows)

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT giver FROM gifts WHERE giver !='Santa';
--       giver       
-- ------------------
--  Nick
--  Rudolf
--  Elf on the Shelf
--  The Boss
--  Mrs.Claus
--  Jason
--  Anju
--  Elf
--  Mom
-- (9 rows)

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE gifts SET price = 2999 WHERE id = 2;

--
\echo Query for the updated item
--
SELECT * FROM gifts;
--  id |       gift        |      giver       | price | previously_regifted 
-- ----+-------------------+------------------+-------+---------------------
--   1 | peach candle      | Santa            |     9 | t
--   3 | cinnamon candle   | Nick             |    19 | t
--   4 | soap on a rope    | Rudolf           |    29 | f
--   5 | potpurri          | Elf on the Shelf |    39 | t
--   6 | mango candle      | The Boss         |    49 | f
--   7 | strawberry candle | Mrs.Claus        |     3 | f
--   8 | shoes             | Jason            |    11 | t
--   9 | laptop            | Anju             |    29 | f
--  10 | comforter         | Elf              |    19 | f
--  11 | water bottle      | Mom              |    49 | f
--   2 | peach candle      | Santa            |  2999 | t
-- (11 rows)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;
--  price |     gift     
-- -------+--------------
--      9 | peach candle
--   2999 | peach candle
-- (2 rows)

-- DELETE 2

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts;
--  id |       gift        |      giver       | price | previously_regifted 
-- ----+-------------------+------------------+-------+---------------------
--   3 | cinnamon candle   | Nick             |    19 | t
--   4 | soap on a rope    | Rudolf           |    29 | f
--   5 | potpurri          | Elf on the Shelf |    39 | t
--   6 | mango candle      | The Boss         |    49 | f
--   7 | strawberry candle | Mrs.Claus        |     3 | f
--   8 | shoes             | Jason            |    11 | t
--   9 | laptop            | Anju             |    29 | f
--  10 | comforter         | Elf              |    19 | f
--  11 | water bottle      | Mom              |    49 | f
-- (9 rows)



-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT (gifts) FROM gifts WHERE gift LIKE '%candle';
--  count 
-- -------
--      3
-- (1 row)


--
\echo Get the AVEREAGE value from all the gifts
--

regifter=# SELECT AVG (price), gift FROM gifts GROUP BY gift;
--          avg         |       gift        
-- ---------------------+-------------------
--  29.0000000000000000 | laptop
--  49.0000000000000000 | water bottle
--  11.0000000000000000 | shoes
--  29.0000000000000000 | soap on a rope
--  19.0000000000000000 | comforter
--  39.0000000000000000 | potpurri
--  49.0000000000000000 | mango candle
--  19.0000000000000000 | cinnamon candle
--   3.0000000000000000 | strawberry candle
-- (9 rows)

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT gift, price FROM gifts ORDER BY price DESC LIMIT 3 OFFSET 2;
--       gift      | price 
-- ----------------+-------
--  potpurri       |    39
--  laptop         |    29
--  soap on a rope |    29
-- (3 rows)

--
-- finish
--
DROP TABLE IF EXISTS gifts;
