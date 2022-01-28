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

CREATE TABLE gifts ( id serial primary KEY, giver TEXT, gift TEXT, price INT, previously_regifted BOOLEAN );

-- 
\echo See details of the table you created
-- 
\d+ gifts

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME price TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (giver, gift, value, previously_regifted)                                                                                    
VALUES ('Santa', 'peach candle', 9, TRUE);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('Santa', 'peach candle', '9', TRUE),
('Nick', 'cinnamon candle', '19', TRUE),
('Rudolf', 'soap on a rope', '29', FALSE),
('Elf on the Shelf', 'potpurri', '39', TRUE),
('The Boss', 'mango candle', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (giver, gift, value, previously_regifted)                                                                                    
VALUES 
('Santa', 'playstation 5', 500, FALSE),
('Ash Ketchum', 'pokeballs', 600, FALSE),
('Santa', 'apple cinnamon wick candle', 20, TRUE),
('Jovanny', 'URU ore', 1000, TRUE),
('Santa', 'Skateboard', 0, TRUE);

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
SELECT * FROM gifts WHERE giver = 'Santa' AND value >= 30;

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE gifts SET value = 2999 WHERE id = 2;

--
\echo Query for the updated gift
--
SELECT * FROM gifts WHERE id = 2 RETURNING *;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts;

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT('%candle%') FROM gifts;

--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(value) from gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT * FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2;
--
-- finish
--
DROP TABLE IF EXISTS gifts;
