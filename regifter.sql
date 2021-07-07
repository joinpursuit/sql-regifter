-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter;
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

CREATE TABLE Gifts ( id SERIAL, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);
-- 
\echo See details of the table you created
-- 

\d gifts;
-- 
\echo Alter the table so that the column price is changed to value 
-- 

ALTER TABLE gifts RENAME value TO price;  

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
--'

INSERT INTO gifts (gift,giver,price,previously_regifted) VALUES ('peach candle', 'Santa', 9, true);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts
\d+ gifts

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE);

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('strawberry candle', 'Santa', '9', TRUE),
('PS5', 'Russ', '499', FALSE),
('cozy coupe', 'Baleigh', '60', FALSE),
('Best Buy giftcard', 'toys for tots', '200', FALSE),
('apple watch 6', 'Sofia', '600', FALSE);

--
\echo Query for gifts with a price greater than or equal to 20
--

SELECT * FROM gifts where price >= 20;
--
\echo Query for every gift that has the word candle in it, only show the gift column
--

SELECT gift FROM gifts WHERE gift ILIKE '%candle%';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT gift FROM gifts  WHERE giver = 'Santa' OR price > 30;

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT gift FROM gifts WHERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET price = 2999 WHERE id = 2;

--
\echo Query for the updated item
--
SELECT gift FROM gifts WHERE price = 2999;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT (*) FROM gifts WHERE gift ILIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
--

SELECT AVG (*) FROM gifts 

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

--
-- finish
--
DROP TABLE IF EXISTS gifts;
