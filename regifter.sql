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

CREATE TABLE gifts
(id serial, gifts TEXT, giver TEXT, price INT, previously_regifted BOOLEAN)
-- 
\echo See details of the table you created
-- 
\d gifts
 
                                  Table "public.gifts"
      Column       |  Type   | Collation | Nullable |              Default
-------------------+---------+-----------+----------+-----------------------------------
 id                | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift              | text    |           |          |
 giver             | text    |           |          |
 price             | integer |           |          |
 previously_gifted | boolean |           |          |

\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME value TO price;
                                  Table "public.gifts"
      Column       |  Type   | Collation | Nullable |              Default
-------------------+---------+-----------+----------+-----------------------------------
 id                | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift              | text    |           |          |
 giver             | text    |           |          |
 value             | integer |           |          |
 previously_gifted | boolean |           |          |

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO
regifter-# gifts (gift, giver, value, previously_gifted)
regifter-# VALUES
regifter-# ('peach_candle', 'Santa', 9, true);
regifter=# SELECT * FROM gifts
                     regifter-# ;
 id |     gift     | giver | value | previously_gifted
----+--------------+-------+-------+-------------------
  1 | peach candle | Santa |     9 | t

--
\echo Query for all the columns in your gifts table
-- 
regifter=# SELECT * FROM gifts;
 id |     gift     | giver | value | previously_gifted
----+--------------+-------+-------+-------------------
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
regifter=# INSERT INTO
regifter-# gifts
regifter-# (gift, giver, value, previously_gifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', '9', TRUE),
regifter-# ('cinnamon candle', 'Nick', '19', TRUE),
regifter-# ('soap on a rope', 'Rudolf', '29', FALSE),
regifter-# ('potpurri', 'Elf on the Shelf', '39', TRUE),
regifter-# ('mango candle', 'The Boss', '49', FALSE)
regifter-# ;
INSERT 0 5

regifter=# SELECT * FROM gifts;
 id |      gift       |      giver       | value | previously_gifted
----+-----------------+------------------+-------+-------------------
  1 | peach candle    | Santa            |     9 | t
  3 | peach candle    | Santa            |     9 | t
  4 | cinnamon candle | Nick             |    19 | t
  5 | soap on a rope  | Rudolf           |    29 | f
  6 | potpurri        | Elf on the Shelf |    39 | t
  7 | mango candle    | The Boss         |    49 | f
(6 rows)


-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
regifter=# INSERT INTO 
gifts
(gift, giver, value, previously_gifted)
VALUES
regifter-# ('Dinosaur Toy', 'Mom', '89', TRUE),
regifter-# ('Cinnamon Grinder', 'Sleepy', '77', FALSE),
regifter-# ('Go Cart', 'Uncle George', '290', FALSE),
regifter-# ('Tea Pot', 'Dad', '60', TRUE),
regifter-# ('Rain Boots', 'Sis', '200', FALSE)
regifter-# ;
INSERT 0 5

regifter=# SELECT * FROM gifts;
 id |       gift       |      giver       | value | previously_gifted
----+------------------+------------------+-------+-------------------
  1 | peach candle     | Santa            |     9 | t
  3 | peach candle     | Santa            |     9 | t
  4 | cinnamon candle  | Nick             |    19 | t
  5 | soap on a rope   | Rudolf           |    29 | f
  6 | potpurri         | Elf on the Shelf |    39 | t
  7 | mango candle     | The Boss         |    49 | f
  8 | Dinosaur Toy     | Mom              |    89 | t
  9 | Cinnamon Grinder | Sleepy           |    77 | f
 10 | Go Cart          | Uncle George     |   290 | f
 11 | Tea Pot          | Dad              |    60 | t
 12 | Rain Boots       | Sis              |   200 | f
(11 rows)

--
\echo Query for gifts with a price greater than or equal to 20
--
regifter=# SELECT * FROM gifts WHERE value>=20
regifter-# ;
 id |       gift       |      giver       | value | previously_gifted
----+------------------+------------------+-------+-------------------
  5 | soap on a rope   | Rudolf           |    29 | f
  6 | potpurri         | Elf on the Shelf |    39 | t
  7 | mango candle     | The Boss         |    49 | f
  8 | Dinosaur Toy     | Mom              |    89 | t
  9 | Cinnamon Grinder | Sleepy           |    77 | f
 10 | Go Cart          | Uncle George     |   290 | f
 11 | Tea Pot          | Dad              |    60 | t
 12 | Rain Boots       | Sis              |   200 | f
(8 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column
--

regifter=# SELECT gifts FROM gifts WHERE gift LIKE '%candle%';
               gifts
------------------------------------
 (1,"peach candle",Santa,9,t)
 (3,"peach candle",Santa,9,t)
 (4,"cinnamon candle",Nick,19,t)
 (7,"mango candle","The Boss",49,f)
(4 rows)
--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
regifter=# SELECT * FROM gifts WHERE giver = '%santa%'OR value > 30;
 id |       gift       |      giver       | value | previously_gifted
----+------------------+------------------+-------+-------------------
  6 | potpurri         | Elf on the Shelf |    39 | t
  7 | mango candle     | The Boss         |    49 | f
  8 | Dinosaur Toy     | Mom              |    89 | t
  9 | Cinnamon Grinder | Sleepy           |    77 | f
 10 | Go Cart          | Uncle George     |   290 | f
 11 | Tea Pot          | Dad              |    60 | t
 12 | Rain Boots       | Sis              |   200 | f
(7 rows)

--
\echo Query for every gift whose giver is NOT Santa
--
regifter=# SELECT giver FROM gifts WHERE giver NOT LIKE '%Santa%';
      giver
------------------
 Nick
 Rudolf
 Elf on the Shelf
 The Boss
 Mom
 Sleepy
 Uncle George
 Dad
 Sis
(9 rows)

--
\echo Update the second gift to have a value of 2999
-- 
regifter=# UPDATE gifts SET value = 2999 WHERE id = 3;
UPDATE 1
regifter=# SELECT * FROM gifts                                                                                             ;
 id |       gift       |      giver       | value | previously_gifted
----+------------------+------------------+-------+-------------------
  1 | peach candle     | Santa            |     9 | t
  4 | cinnamon candle  | Nick             |    19 | t
  5 | soap on a rope   | Rudolf           |    29 | f
  6 | potpurri         | Elf on the Shelf |    39 | t
  7 | mango candle     | The Boss         |    49 | f
  8 | Dinosaur Toy     | Mom              |    89 | t
  9 | Cinnamon Grinder | Sleepy           |    77 | f
 10 | Go Cart          | Uncle George     |   290 | f
 11 | Tea Pot          | Dad              |    60 | t
 12 | Rain Boots       | Sis              |   200 | f
  3 | peach candle     | Santa            |  2999 | t
(11 rows)

--
\echo Query for the updated item
--
regifter=# SELECT * FROM gifts WHERE value = 2999;                                                                         ;
 id |     gift     | giver | value | previously_gifted
----+--------------+-------+-------+-------------------
  3 | peach candle | Santa |  2999 | t
(1 row)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
regifter=# DELETE FROM gifts WHERE giver = 'Santa';
DELETE 2

--
\echo Query for all the columns in your gifts table one more time
--
regifter=# SELECT * FROM gifts                                                                                             ;
 id |       gift       |      giver       | value | previously_gifted
----+------------------+------------------+-------+-------------------
  4 | cinnamon candle  | Nick             |    19 | t
  5 | soap on a rope   | Rudolf           |    29 | f
  6 | potpurri         | Elf on the Shelf |    39 | t
  7 | mango candle     | The Boss         |    49 | f
  8 | Dinosaur Toy     | Mom              |    89 | t
  9 | Cinnamon Grinder | Sleepy           |    77 | f
 10 | Go Cart          | Uncle George     |   290 | f
 11 | Tea Pot          | Dad              |    60 | t
 12 | Rain Boots       | Sis              |   200 | f
(9 rows)


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
regifter=# SELECT COUNT(*) FROM gifts WHERE gift LIKE '%candle%'                                                           ;
 count
-------
     2
(1 row)

--
\echo Get the AVEREAGE value from all the gifts
--
regifter=# SELECT AVG(value) FROM gifts;
         avg
---------------------
 94.6666666666666667
(1 row)

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
What is meant by LIMIT; does this mean DELETE all but 3 items?

-- 
-- finish
--
DROP TABLE IF EXISTS gifts;
