-- 01 string comparisons

USE world;
SELECT Name FROM country WHERE Name LIKE '_a%' ORDER BY Name;						-- _ Means exact one character and % means zero or more characters 
SELECT Name FROM country WHERE STRCMP(Name, 'France') <= 0 ORDER BY Name;			-- STRCMP compares two strings

-- 02 regular expressions

USE world;
SELECT Name FROM country WHERE Name RLIKE 'y$' ORDER BY Name;						-- RLIKE matches a string with the given regular expression
SELECT Name FROM country WHERE Name RLIKE '[xz][ai]' ORDER BY Name;

-- 03 string concatenation

SELECT 'This ' || 'and ' || 'that';
SELECT CONCAT('This ', 'and ', 'that');
SELECT CONCAT('Love', ' ', 'is', ' ', 'all', ' ', 'you', ' ', 'need');
SELECT CONCAT('one', 'two');
SELECT CONCAT('string', 42);
SELECT CONCAT(42, 42);

-- 04 numeric conversions

SELECT 32742;
SELECT HEX(32742);
SELECT OCT(32742);
SELECT BIN(32742);

SELECT CONV('32742',10,16);								-- CONV converts numbers from the given base A to the given base B
SELECT CONV('7FE6',16,10);
SELECT CONV('28K6',24,10);

-- 05 trimming and padding

USE scratch;
SELECT * FROM customer WHERE name LIKE '  Bill Smith  ';
SELECT * FROM customer WHERE name LIKE TRIM('  Bill Smith  ');
SELECT CONCAT(':', RTRIM('  Bill Smith  '), ':');
SELECT CONCAT(':', LTRIM('  Bill Smith  '), ':');

SELECT CONCAT(':', TRIM('x' FROM 'xxxBill Smithxxx'), ':');

SELECT LPAD('Price', 20, '.');
SELECT LPAD('Price', 20, '. ');
SELECT RPAD('Price', 20, '. ');

-- 06 case conversion

USE scratch;
SELECT UPPER(name) FROM customer;
SELECT LOWER(name) FROM customer;
SELECT CONCAT(UPPER(SUBSTRING(name, 1, 1)),LOWER(SUBSTRING(name, 2))) FROM customer;

-- 07 substring

SELECT SUBSTRING('this is a string', 6);						--SUBSTRING(string , startIndex, numberOfcharacters). The first character has the index 1 and the last character has -1. 
SELECT SUBSTR('this is a string', 6);
SELECT SUBSTR('this is a string', 6, 4);
SELECT SUBSTR('this is a string', -6);
SELECT SUBSTR('this is a string', -6, 4);

SELECT SUBSTRING_INDEX('this is a string', ' ', 1);				--SUBSTRING_INDEX(string, splitCharacter, theIndexOfSplitedString);
SELECT SUBSTRING_INDEX('this is a string', ' ', 2);
SELECT SUBSTRING_INDEX('this is a string', ' ', -2);

-- 08 soundex

SELECT SOUNDEX('bill'), SOUNDEX('bell');
SELECT SOUNDEX('acton'), SOUNDEX('action');
SELECT SOUNDEX('acting'), SOUNDEX('action');

SELECT 'bill' SOUNDS LIKE 'boil', 'bill' SOUNDS LIKE 'phil';



