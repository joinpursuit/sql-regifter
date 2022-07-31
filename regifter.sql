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

CODE: 
regifter=# CREATE TABLE
regifter=# gifts
regifter=# (id serial primary KEY, gift TEXT, giver TEXT, price INT, previously_regifted BOOLEAN) ;

-- 
\echo See details of the table you created
-- 
CODE: \d gifts ;

-- 
\echo Alter the table so that the column price is changed to value 
-- 
CODE: regifter=# ALTER TABLE gifts RENAME price TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
CODE:
regifter=# INSERT INTO
regifter-# gifts (gift, giver, value, previously_regifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', 9, TRUE);

--
\echo Query for all the columns in your gifts table
-- 
CODE:
regifter=# SELECT * FROM gifts;
 id |     gift     | giver | value | previously_regifted
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
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

CODE:
regifter=# SELECT * FROM gifts;
 id |      gift       |      giver       | value | previously_regifted
----+-----------------+------------------+-------+---------------------
  1 | peach candle    | Santa            |     9 | t
  2 | peach candle    | Santa            |     9 | t
  3 | cinnamon candle | Nick             |    19 | t
  4 | soap on a rope  | Rudolf           |    29 | f
  5 | potpurri        | Elf on the Shelf |    39 | t
  6 | mango candle    | The Boss         |    49 | f
(6 rows)

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
CODE:
INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('lemon candle', 'Tooth Fairy', '1', TRUE),
('tea', 'Nicole', '3', FALSE),
('shampoo', 'Mom', '11', FALSE),
('purse', 'Sally', '400', TRUE),
('orange candle', 'The Boss', '21', TRUE)
;

--
\echo Query for gifts with a price greater than or equal to 20
--
regifter=# SELECT * FROM gifts WHERE value >= 20;
 id |      gift      |      giver       | value | previously_regifted
----+----------------+------------------+-------+---------------------
  4 | soap on a rope | Rudolf           |    29 | f
  5 | potpurri       | Elf on the Shelf |    39 | t
  6 | mango candle   | The Boss         |    49 | f
 10 | purse          | Sally            |   400 | t
 11 | orange candle  | The Boss         |    21 | t
(5 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
CODE:
regifter=# SELECT * FROM gifts WHERE gift LIKE '%candle%';
 id |      gift       |    giver    | value | previously_regifted
----+-----------------+-------------+-------+---------------------
  1 | peach candle    | Santa       |     9 | t
  2 | peach candle    | Santa       |     9 | t
  3 | cinnamon candle | Nick        |    19 | t
  6 | mango candle    | The Boss    |    49 | f
  7 | lemon candle    | Tooth Fairy |     1 | t
 11 | orange candle   | The Boss    |    21 | t
(6 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
CODE:
regifter=# SELECT * FROM gifts WHERE giver = 'Santa' OR value > 30;
 id |     gift     |      giver       | value | previously_regifted
----+--------------+------------------+-------+---------------------
  1 | peach candle | Santa            |     9 | t
  2 | peach candle | Santa            |     9 | t
  5 | potpurri     | Elf on the Shelf |    39 | t
  6 | mango candle | The Boss         |    49 | f
 10 | purse        | Sally            |   400 | t
(5 rows)

--
\echo Query for every gift whose giver is NOT Santa
--
CODE:
regifter=# SELECT * FROM gifts WHERE giver != 'Santa' ;
 id |      gift       |      giver       | value | previously_regifted
----+-----------------+------------------+-------+---------------------
  3 | cinnamon candle | Nick             |    19 | t
  4 | soap on a rope  | Rudolf           |    29 | f
  5 | potpurri        | Elf on the Shelf |    39 | t
  6 | mango candle    | The Boss         |    49 | f
  7 | lemon candle    | Tooth Fairy      |     1 | t
  8 | tea             | Nicole           |     3 | f
  9 | shampoo         | Mom              |    11 | f
 10 | purse           | Sally            |   400 | t
 11 | orange candle   | The Boss         |    21 | t
(9 rows)

--
\echo Update the second gift to have a value of 2999
-- 
CODE:
regifter=# UPDATE gifts SET value = 2999 WHERE id = 2 ;
UPDATE 1

--
\echo Query for the updated item
--
CODE:
regifter=# UPDATE gifts SET value = 2999 WHERE id = 2 RETURNING *;
 id |     gift     | giver | value | previously_regifted
----+--------------+-------+-------+---------------------
  2 | peach candle | Santa |  2999 | t
(1 row)

UPDATE 1

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
CODE:
regifter=# DELETE FROM gifts WHERE giver = 'Santa' RETURNING gift, value ;
     gift     | value
--------------+-------
 peach candle |     9
 peach candle |  2999
(2 rows)

DELETE 2

--
\echo Query for all the columns in your gifts table one more time
--
CODE:
regifter=# SELECT * FROM gifts;
 id |      gift       |      giver       | value | previously_regifted
----+-----------------+------------------+-------+---------------------
  3 | cinnamon candle | Nick             |    19 | t
  4 | soap on a rope  | Rudolf           |    29 | f
  5 | potpurri        | Elf on the Shelf |    39 | t
  6 | mango candle    | The Boss         |    49 | f
  7 | lemon candle    | Tooth Fairy      |     1 | t
  8 | tea             | Nicole           |     3 | f
  9 | shampoo         | Mom              |    11 | f
 10 | purse           | Sally            |   400 | t
 11 | orange candle   | The Boss         |    21 | t
(9 rows)


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
CODE:
regifter=# SELECT COUNT(gift) FROM gifts WHERE gift LIKE '%candle%';
 count
-------
     4
(1 row)

--
\echo Get the AVEREAGE value from all the gifts
--
CODE:
regifter=# SELECT AVG(value) FROM gifts;
         avg
---------------------
 63.5555555555555556
(1 row)

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
CODE: 
regifter=# SELECT * FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2;
 id |      gift      |      giver       | value | previously_regifted
----+----------------+------------------+-------+---------------------
  5 | potpurri       | Elf on the Shelf |    39 | t
  4 | soap on a rope | Rudolf           |    29 | f
 11 | orange candle  | The Boss         |    21 | t
(3 rows)

--
-- finish
--
DROP TABLE IF EXISTS gifts;
CODE:
regifter=# DROP TABLE IF EXISTS gifts ;
DROP TABLE
