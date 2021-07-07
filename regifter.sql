-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
-- \c regifter
-- End getting started code

--
-- Write your code below each prompt

--
-- Create a table called gifts
CREATE TABLE gifts
(
    id SERIAL,
    gift TEXT,
    giver TEXT,
    value INT,
    previously_regifted boolean
);
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean


-- 
-- See details of the table you created
-- 
-- \d gifts

-- 
-- Alter the table so that the column price is changed to value
-- 
-- ALTER TABLE gifts RENAME value TO price;


-- 
-- Insert a peach candle, given by 'Santa' whose value is 9 and has been previously regifted
-- 
INSERT INTO 
gifts
    (gift, giver, value, previously_regifted)
VALUES
    ('peach candle', 'Santa', 9, true);

--
-- Query for all the columns in your gifts table
-- 
SELECT *
FROM gifts;

--
-- Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts
    (gift, giver, value, previously_regifted)
VALUES
    ('peach candle', 'Santa', '9', TRUE),
    ('cinnamon candle', 'Nick', '19', TRUE),
    ('soap on a rope', 'Rudolf', '29', FALSE),
    ('potpurri', 'Elf on the Shelf', '39', TRUE),
    ('mango candle', 'The Boss', '49', FALSE)
;

-- 
-- Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts
    (gift, giver, value, previously_regifted)
VALUES
    ('Shoes', 'Marsha', '59', FALSE),
    ('Hair Dye', 'Carina', '19', FALSE),
    ('Artisinal Earrings', 'Kenia', '29', TRUE),
    ('potpurri', 'Elf on the Shelf', '5', TRUE),
    ('Notebook', 'The Boss', '49', FALSE),
    ('sandalwood candle', 'The Boss', '49', FALSE)
;

--
-- Query for giftswith a value greater than or equal to 20
--
SELECT
    *
FROM gifts
WHERE
value >= 20;

--
-- Query for every gift that has the word candle in it, only show the gift column
--
SELECT
    *
FROM gifts
WHERE gift
LIKE '%candle%';

-- also gave back the list of candles
SELECT
    *
FROM gifts
WHERE gift
LIKE '%candle';

--
-- Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT
    *
FROM gifts
WHERE giver = 'Santa' OR value > 30;

--
-- Query for every gift whose giver is NOT Santa
--
SELECT
    *
FROM gifts
WHERE giver != 'Santa';

--
-- Update the second gift to have a value of 2999
-- 
UPDATE gifts
SET value = 2999
WHERE id = 2;

--
-- Query for the updated item
--
SELECT
    *
FROM gifts
WHERE 
  id = 2;

--
-- Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE
FROM
    gifts 
WHERE giver ='Santa';

--
-- Query for all the columns in your gifts table one more time
--
SELECT
    *
FROM gifts;


-- BONUSES

--
-- Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(gift)
FROM gifts
WHERE gift
ILIKE '%candle%';

--
-- Get the AVEREAGE value from all the gifts
--
SELECT AVG(value)
FROM gifts;

-- 
-- Limit to 3 gifts, offset by 2 and order by price descending
--
-- NOT WORKING  after OFFSET...

SELECT
    *
FROM gifts
ORDER BY value DESC
OFFSET 2;


--
-- finish
--
DROP TABLE IF EXISTS gifts;

-- https://github.com/joinpursuit/7-2-lecture-notes/tree/main/MODULE4/sql