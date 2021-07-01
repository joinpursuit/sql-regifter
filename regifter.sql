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
CREATE TABLE gifts (id serial, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
--   
\d gifts

Table "public.gifts"
       Column        |  Type   | Collation | Nullable |              Default              
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          | 
 giver               | text    |           |          | 
 value               | integer |           |          | 
 previously_regifted | boolean |           |          

-- 
\echo Alter the table so that the column value is changed to price
-- 
ALTER TABLE gifts RENAME value to price;
Table "public.gifts"
       Column        |  Type   | Collation | Nullable |              Default              
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          | 
 giver               | text    |           |          | 
 price               | integer |           |          | 
 previously_regifted | boolean |           |          | 

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, giver, price, previously_regifted) VALUES ('peach candle', 'Santa', 9, true);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;
id |     gift     | giver | price | previously_regifted 
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;
SELECT * FROM gifts;
 id |            gift            |      giver       | price | previously_regifted 
----+----------------------------+------------------+-------+---------------------
  1 | peach candle               | Santa            |     9 | t
  2 | peach candle               | Santa            |     9 | t
  3 | cinnamon candle            | Nick             |    19 | t
  4 | soap on a rope             | Rudolf           |    29 | f
  5 | potpurri                   | Elf on the Shelf |    39 | t
  6 | mango candle               | The Boss         |    49 | f

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('plumeria and guava candle', 'Tarjay', '10', FALSE),
('one-year wifi subscription', 'Pursuit', '600', FALSE),
('sandalwood bath salt', 'Nairobi', '25', FALSE),
('egyptian musk oil', 'Tariq', '15', TRUE),
('brown rose petals', 'KL', '50', FALSE)
;
SELECT * FROM gifts;
 id |            gift            |      giver       | price | previously_regifted 
----+----------------------------+------------------+-------+---------------------
  1 | peach candle               | Santa            |     9 | t
  2 | peach candle               | Santa            |     9 | t
  3 | cinnamon candle            | Nick             |    19 | t
  4 | soap on a rope             | Rudolf           |    29 | f
  5 | potpurri                   | Elf on the Shelf |    39 | t
  6 | mango candle               | The Boss         |    49 | f
  7 | plumeria and guava candle  | Tarjay           |    10 | f
  8 | one-year wifi subscription | Pursuit          |   600 | f
  9 | sandalwood bath salt       | Nairobi          |    25 | f
 10 | egyptian musk oil          | Tariq            |    15 | t
 11 | brown rose petals          | KL               |    50 | f

--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE price >= 20;
 id |            gift            |      giver       | price | previously_regifted 
----+----------------------------+------------------+-------+---------------------
  4 | soap on a rope             | Rudolf           |    29 | f
  5 | potpurri                   | Elf on the Shelf |    39 | t
  6 | mango candle               | The Boss         |    49 | f
  8 | one-year wifi subscription | Pursuit          |   600 | f
  9 | sandalwood bath salt       | Nairobi          |    25 | f
 11 | brown rose petals          | KL               |    50 | f
--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT gift FROM gifts WHERE gift LIKE '%candle%';
           gift            
---------------------------
 peach candle
 peach candle
 cinnamon candle
 mango candle
 plumeria and guava candle

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE giver = 'Santa' OR price > 30;
 id |            gift            |      giver       | price | previously_regifted 
----+----------------------------+------------------+-------+---------------------
  1 | peach candle               | Santa            |     9 | t
  2 | peach candle               | Santa            |     9 | t
  5 | potpurri                   | Elf on the Shelf |    39 | t
  6 | mango candle               | The Boss         |    49 | f
  8 | one-year wifi subscription | Pursuit          |   600 | f
 11 | brown rose petals          | KL               |    50 | f

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE giver != 'Santa';
 id |            gift            |      giver       | price | previously_regifted 
----+----------------------------+------------------+-------+---------------------
  3 | cinnamon candle            | Nick             |    19 | t
  4 | soap on a rope             | Rudolf           |    29 | f
  5 | potpurri                   | Elf on the Shelf |    39 | t
  6 | mango candle               | The Boss         |    49 | f
  7 | plumeria and guava candle  | Tarjay           |    10 | f
  8 | one-year wifi subscription | Pursuit          |   600 | f
  9 | sandalwood bath salt       | Nairobi          |    25 | f
 10 | egyptian musk oil          | Tariq            |    15 | t
 11 | brown rose petals          | KL               |    50 | f


--
\echo Update the second gift to have a value of 2999
-- 
UPDATE gifts SET price = 2999 WHERE id=2;

--
\echo Query for the updated item
--
SELECT * FROM gifts;
 id |            gift            |      giver       | price | previously_regifted 
----+----------------------------+------------------+-------+---------------------
  1 | peach candle               | Santa            |     9 | t
  3 | cinnamon candle            | Nick             |    19 | t
  4 | soap on a rope             | Rudolf           |    29 | f
  5 | potpurri                   | Elf on the Shelf |    39 | t
  6 | mango candle               | The Boss         |    49 | f
  7 | plumeria and guava candle  | Tarjay           |    10 | f
  8 | one-year wifi subscription | Pursuit          |   600 | f
  9 | sandalwood bath salt       | Nairobi          |    25 | f
 10 | egyptian musk oil          | Tariq            |    15 | t
 11 | brown rose petals          | KL               |    50 | f
  2 | peach candle               | Santa            |  2999 | t

--OR (more specifically)

SELECT * FROM gifts LIMIT 1 OFFSET 10;
 id |     gift     | giver | price | previously_regifted 
----+--------------+-------+-------+---------------------
  2 | peach candle | Santa |  2999 | t

--
\echo Delete all the gifts from Santa and return the 'price' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;
 price |     gift     
-------+--------------
  2999 | peach candle
     9 | peach candle

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts                                                                                                                                 ;
 id |            gift            |      giver       | price | previously_regifted 
----+----------------------------+------------------+-------+---------------------
  3 | cinnamon candle            | Nick             |    19 | t
  4 | soap on a rope             | Rudolf           |    29 | f
  5 | potpurri                   | Elf on the Shelf |    39 | t
  6 | mango candle               | The Boss         |    49 | f
  7 | plumeria and guava candle  | Tarjay           |    10 | f
  8 | one-year wifi subscription | Pursuit          |   600 | f
  9 | sandalwood bath salt       | Nairobi          |    25 | f
 10 | egyptian musk oil          | Tariq            |    15 | t
 11 | brown rose petals          | KL               |    50 | f

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(gift) FROM gifts WHERE gift LIKE '%candle%';
 count 
-------
     3

--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(price) FROM gifts;
         avg         
---------------------
 92.8888888888888889

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT * FROM gifts ORDER BY price DESC LIMIT 3 OFFSET 2;
 id |      gift      |      giver       | price | previously_regifted 
----+----------------+------------------+-------+---------------------
  6 | mango candle   | The Boss         |    49 | f
  5 | potpurri       | Elf on the Shelf |    39 | t
  4 | soap on a rope | Rudolf           |    29 | f
--
-- finish
--
DROP TABLE IF EXISTS gifts;
