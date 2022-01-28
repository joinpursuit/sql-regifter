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

    CREATE TABLE gifts (id SERIAL, gift TEXT, giver TEXT, value INT, previously_regifted BOOL);

    -- CREATE TABLE

-- 
\echo See details of the table you created
-- 
    \d gifts;
    
    --                                    Table "public.gifts"
    --        Column        |  Type   | Collation | Nullable |              Default              
    -- ---------------------+---------+-----------+----------+-----------------------------------
    --  id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
    --  gift                | text    |           |          | 
    --  giver               | text    |           |          | 
    --  value               | integer |           |          | 
    --  previously_regifted | boolean |           |          | 

-- 
\echo Alter the table so that the column value is changed to price 
-- 

    ALTER TABLE gifts RENAME value TO price;

    -- ALTER TABLE

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 

    INSERT  INTO gifts (gift, giver, price, previously_regifted) 
    VALUES ('peach candle', 'Santa', 9, TRUE);

    -- INSERT 0 1  

--
\echo Query for all the columns in your gifts table
-- 

    SELECT * FROM gifts;

    -- id |     gift     | giver | price | previously_regifted 
    -- ----+--------------+-------+-------+---------------------
    -- 1 | peach candle | Santa |     9 | t
    -- (1 row)

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

    -- INSERT 0 5

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

    INSERT INTO gifts (gift, giver, price, previously_regifted)
    VALUES
    ('card', 'me', '10', TRUE),
    ('cinnamon', 'myself', '19', TRUE),
    ('flower', 'I', '2', FALSE),
    ('keybaord', 'me', '3', TRUE),
    ('candle', 'myself', '9', FALSE)
    ;

    -- INSERT 0 5

--
\echo Query for gifts with a price greater than or equal to 20
--

    SELECT * FROM gifts WHERE price >= 20;

    -- id |      gift      |      giver       | price | previously_regifted 
    -- ----+----------------+------------------+-------+---------------------
    -- 4 | soap on a rope | Rudolf           |    29 | f
    -- 5 | potpurri       | Elf on the Shelf |    39 | t
    -- 6 | mango candle   | The Boss         |    49 | f
    -- (3 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
    SELECT gift FROM gifts WHERE gift LIKE '%candle%';

    -- gift       
    -- -----------------
    -- peach candle
    -- peach candle
    -- cinnamon candle
    -- mango candle
    -- candle
    -- (5 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--

    SELECT * FROM gifts WHERE giver = 'Santa' OR price > 30;

    --     id |     gift     |      giver       | price | previously_regifted 
    -- ----+--------------+------------------+-------+---------------------
    --   1 | peach candle | Santa            |     9 | t
    --   2 | peach candle | Santa            |     9 | t
    --   5 | potpurri     | Elf on the Shelf |    39 | t
    --   6 | mango candle | The Boss         |    49 | f
    -- (4 rows)

--
\echo Query for every gift whose giver is NOT Santa
--
    SELECT * FROM gifts WHERE giver != 'Santa';

    -- id |      gift       |      giver       | price | previously_regifted 
    -- ----+-----------------+------------------+-------+---------------------
    -- 3 | cinnamon candle | Nick             |    19 | t
    -- 4 | soap on a rope  | Rudolf           |    29 | f
    -- 5 | potpurri        | Elf on the Shelf |    39 | t
    -- 6 | mango candle    | The Boss         |    49 | f
    -- 7 | card            | me               |    10 | t
    -- 8 | cinnamon        | myself           |    19 | t
    -- 9 | flower          | I                |     2 | f
    -- 10 | keybaord       | me               |     3 | t
    -- 11 | candle         | myself           |     9 | f
    -- (9 rows)

--
\echo Update the second gift to have a value of 2999
-- 

    UPDATE gifts SET price = 2999 WHERE id = 2;

    -- UPDATE 1

--
\echo Query for the updated item
--
    SELECT * FROM gifts WHERE id = 2;

    -- id |     gift     | giver | price | previously_regifted 
    -- ----+--------------+-------+-------+---------------------
    -- 2 | peach candle | Santa |  2999 | t
    -- (1 row)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

    DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;

    -- price |     gift     
    -- -------+--------------
    --     9 | peach candle
    --  2999 | peach candle
    -- (2 rows)
    -- DELETE 2

--
\echo Query for all the columns in your gifts table one more time
--

    SELECT * FROM gifts;

    -- id |      gift       |      giver       | price | previously_regifted 
    -- ----+-----------------+------------------+-------+---------------------
    -- 3 | cinnamon candle | Nick             |    19 | t
    -- 4 | soap on a rope  | Rudolf           |    29 | f
    -- 5 | potpurri        | Elf on the Shelf |    39 | t
    -- 6 | mango candle    | The Boss         |    49 | f
    -- 7 | card            | me               |    10 | t
    -- 8 | cinnamon        | myself           |    19 | t
    -- 9 | flower          | I                |     2 | f
    -- 10| keybaord        | me               |     3 | t
    -- 11| candle          | myself           |     9 | f

-- 

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 

    SELECT COUNT(gift) FROM gifts WHERE gift LIKE '%candle%';

    -- count 
    -- -------
    --     3
    -- (1 row)

--
\echo Get the AVEREAGE value from all the gifts
--

    SELECT AVG(price) FROM gifts;

    --     avg         
    -- ---------------------
    -- 19.8888888888888889
    -- (1 row)

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
    SELECT * FROM gifts ORDER BY price DESC LIMIT 3 OFFSET 2;
    
    -- id |      gift       | giver  | price | previously_regifted 
    -- ----+-----------------+--------+-------+---------------------
    -- 4 | soap on a rope  | Rudolf |    29 | f
    -- 8 | cinnamon        | myself |    19 | t
    -- 3 | cinnamon candle | Nick   |    19 | t
    -- (3 rows)
--
-- finish
--
DROP TABLE IF EXISTS gifts;
