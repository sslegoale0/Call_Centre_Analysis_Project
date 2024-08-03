SET sql_safe_updates = 0;

SET sql_mode = "Traditional";

---------------------------------------------------------------------------------------------------------------------------------------------

-- Call Centre Data Cleaning.

CREATE DATABASE call_centre;



-- Imported Call Centre data into MySQL using SQLAlchemy.



USE call_centre;



SELECT *
FROM calls;



DESCRIBE calls;



-- 1. Removal of duplicate rows.

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY `Id`) AS "Row Number"
FROM calls;

WITH duplicate_calls AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY `Id`) AS "Row Number"
FROM calls
)
SELECT *
FROM duplicate_calls
WHERE `Row Number` > 1;



SELECT *,
ROW_NUMBER() OVER(
PARTITION BY `Customer Name`
ORDER BY `Id`) AS "Row Number"
FROM calls;

WITH duplicate_calls AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY `Customer Name`
ORDER BY `Id`) AS "Row Number"
FROM calls
)
SELECT *
FROM duplicate_calls
WHERE `Row Number` > 1;



SELECT *,
ROW_NUMBER() OVER(
PARTITION BY
`Call Timestamp`
`Call-Centres City`
`Channel`
`City`
`Reason`
`Response Time`
`Sentiment`
`State`
`Call Duration In Minutes`
`Csat Score`
ORDER BY `Id`) AS "Row Number"
FROM calls;

WITH duplicate_calls AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY
`Call Timestamp`
`Call-Centres City`
`Channel`
`City`
`Reason`
`Response Time`
`Sentiment`
`State`
`Call Duration In Minutes`
`Csat Score`
ORDER BY `Id`) AS "Row Number"
FROM calls
)
SELECT *
FROM duplicate_calls
WHERE `Row Number` > 1;



-- 2. Data formatting & standardisation.

SELECT DISTINCT `Id` 
FROM calls
ORDER BY `Id` ASC;

SELECT `Id`,
upper(`Id`)
FROM calls
ORDER BY `Id` ASC;

UPDATE calls
SET `Id` = upper(`Id`)

ALTER TABLE calls
RENAME COLUMN `Id` TO `Call Id`;

SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;



SELECT DISTINCT 
FROM calls
ORDER BY ASC;





-- 3. Imputation of null/blank values.




-- 4. Removal of redundant/irrelevant rows.




