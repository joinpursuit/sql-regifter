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
CREATE TABLE Gifts (id serial, gift TEXT, giver TEXT, price INT, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 
SELECT * FROM Gifts;

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE Gifts RENAME price to value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES ('peach candle', 'Santa', 9, true);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM Gifts;

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
INSERT INTO Gifts (gift, giver, value, previously_regifted)
VALUES
('Book', 'Poo', 50, false),
('Pen', 'Poonam', 1, true),
('Phone', 'Mom', 901, true),
('Watch', 'Jeff', 100, false),
('Computer', 'Nami', 500, false),
('House', 'Zorro', 10, true),
('Shirt', 'Jackie Chan', 67, false),
('Chicken', 'Lala', 7, true),
('Dog', 'Kenia', 50, false),
('Car', 'Minions', 60, true)
;


--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM Gifts WHERE value >= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM Gifts WHERE gift ILIKE '%candle';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM Gifts WHERE giver = "Santa" OR value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM Gifts WHERE NOT Giver = 'Santa';
--
SELECT  * FROM Gifts WGERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE Gifts Set value = 2999 WHERE id = 2 RETURNING *;

--
\echo Query for the updated item
--

SELECT * FROM Gifts WHERE id= = 2;
--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM Gifts WHERE giver = 'Santa'  RETURNING value, gift;

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * From Gifts;


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(gift) From Gifts where gift ILIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(value) From Gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
Select * from Gifts ORDER by value DESC LIMIT 3 offset 2;
--
-- finish
--
DROP TABLE IF EXISTS gifts;
