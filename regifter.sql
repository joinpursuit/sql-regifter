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

CREATE TABLE gifts (id serial, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN DEFAULT false);


-- 
\echo See details of the table you created
-- 

\d gifts;
                                   Table "public.gifts"
       Column        |  Type   | Collation | Nullable |              Default
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          |
 giver               | text    |           |          |
 price               | integer |           |          |
 previously_regifted | boolean |           |          | false


-- 
\echo Alter the table so that the column price is changed to value 
-- 

ALTER TABLE gifts RENAME price TO value;


-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES ('Peach candle', 'Santa', 9, TRUE);


--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts;

 id |     gift     | giver | value | previously_regifted
----+--------------+-------+-------+---------------------
  1 | Peach candle | Santa |     9 | t
(1 row)


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

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('christmas candle', 'Mrs. Claus', '12', FALSE),
('cinnamon', 'Suzy', '5', TRUE),
('shampoo', 'Ruth', '25', FALSE),
('peanut butter', 'Gus', '99', TRUE),
('mango smoothie', 'The girl next door', '2', FALSE)
;


--
\echo Query for gifts with a price greater than or equal to 20
--

SELECT * FROM gifts WHERE price >= 20;


--
\echo Query for every gift that has the word candle in it, only show the gift column
--

SELECT * FROM gifts WHERE gift LIKE '%candle%';


--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--

SELECT * FROM gifts WHERE value > 30 OR giver = 'Santa';


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

UPDATE gifts SET value = 2999 WHERE id = 2 RETURNING *;


--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;


--
\echo Query for all the columns in your gifts table one more time
--

 id |       gift       |       giver        | value | previously_regifted
----+------------------+--------------------+-------+---------------------
  3 | cinnamon candle  | Nick               |    19 | t
  4 | soap on a rope   | Rudolf             |    29 | f
  5 | potpurri         | Elf on the Shelf   |    39 | t
  6 | mango candle     | The Boss           |    49 | f
 12 | christmas candle | Mrs. Claus         |    12 | f
 13 | cinnamon         | Suzy               |     5 | t
 14 | shampoo          | Ruth               |    25 | f
 15 | peanut butter    | Gus                |    99 | t
 16 | mango smoothie   | The girl next door |     2 | f


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 

SELECT COUNT(gifts) FROM gifts WHERE gift LIKE '%candle%';


--
\echo Get the AVEREAGE value from all the gifts
--

SELECT AVG(value) FROM gifts;


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

SELECT MAX(value) FROM gifts ORDER BY value DESC;


--
-- finish
--
DROP TABLE IF EXISTS gifts;
