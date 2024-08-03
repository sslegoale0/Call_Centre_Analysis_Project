/* Call Centre Data Cleaning */

CREATE DATABASE call_centre;



USE call_centre;



SELECT *
FROM calls;



EXEC sp_columns calls;



/* 1. Removal of duplicate rows. */

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY [Id]
ORDER BY [Id]) AS "Row Number"
FROM calls
ORDER BY [Row Number] DESC;

WITH duplicate_calls AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY [Id]
ORDER BY [Id]) AS "Row Number"
FROM calls)
SELECT *
FROM duplicate_calls
WHERE [Row Number] > 1;



SELECT *,
ROW_NUMBER() OVER(
PARTITION BY [Customer Name]
ORDER BY [Customer Name]) AS "Row Number"
FROM calls
ORDER BY [Row Number] DESC;

WITH duplicate_calls AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY [Customer Name]
ORDER BY [Customer Name]) AS "Row Number"
FROM calls)
SELECT *
FROM duplicate_calls
WHERE [Row Number] > 1;



--SELECT *,
--ROW_NUMBER() OVER(
--PARTITION BY [Call Timestamp],
--[Call-Centres City],
--[Channel],
--[City],
--[Reason],
--[Response Time],
--[Sentiment],
--[State],
--[Call Duration In Minutes],
--[Csat Score]
--ORDER BY [Id]) AS "Row Number"
--FROM calls
--ORDER BY [Row Number] DESC;

--WITH duplicate_calls AS (
--SELECT *,
--ROW_NUMBER() OVER(
--PARTITION BY [Call Timestamp],
--[Call-Centres City],
--[Channel],
--[City],
--[Reason],
--[Response Time],
--[Sentiment],
--[State],
--[Call Duration In Minutes],
--[Csat Score]
--ORDER BY [Id]) AS "Row Number"
--FROM calls)
--SELECT *
--FROM duplicate_calls
--WHERE [Row Number] > 1;



/* 2. Data formatting & standardisation */

EXEC sp_columns calls;



SELECT DISTINCT [Id]
FROM calls
ORDER BY [Id];

SELECT [Id],
UPPER([Id]) AS "Call Id"
FROM calls;

UPDATE calls
SET [Id] = UPPER([ID]);

EXEC sp_rename 'calls.[Id]', 'Call Id', 'COLUMN';

SELECT DISTINCT [Call Id]
FROM calls
ORDER BY [Call Id] ASC;



SELECT DISTINCT [Call Timestamp]
FROM calls
ORDER BY [Call Date];

UPDATE calls
SET [Call Timestamp] = CONVERT(NVARCHAR(255), CONVERT(DATE, [Call Timestamp], 105))
ALTER TABLE calls
ALTER COLUMN [Call Timestamp] DATE;

EXEC sp_rename 'calls.[Call Timestamp]', 'Call Date', 'COLUMN';

SELECT DISTINCT [Call Date]
FROM calls
ORDER BY [Call Date] ASC;



SELECT DISTINCT [Call-Centres City]
FROM calls
ORDER BY [Call-Centres City];

EXEC sp_rename 'calls.[Call-Centres City]', 'Call Centre City', 'COLUMN';



SELECT DISTINCT [Channel]
FROM calls
ORDER BY [Channel];

UPDATE calls
SET [Channel] = 'Call Centre'
WHERE [Channel] LIKE 'Call-Center';



SELECT DISTINCT [City]
FROM calls
ORDER BY [City];



SELECT DISTINCT [Reason]
FROM calls
ORDER BY [Reason];



SELECT DISTINCT [Response Time]
FROM calls
ORDER BY [Response Time];



SELECT DISTINCT [Sentiment]
FROM calls
ORDER BY [Sentiment];



SELECT DISTINCT [State]
FROM calls
ORDER BY [State];



SELECT DISTINCT [Call Duration In Minutes]
FROM calls
ORDER BY [Call Duration In Minutes];

EXEC sp_rename 'calls.[Call Duration In Minutes]', 'Call Duration (Mins)', 'COLUMN';



SELECT DISTINCT [Csat Score]
FROM calls
ORDER BY [Csat Score];

EXEC sp_rename 'calls.[Csat Score]', 'CSAT Score', 'COLUMN';



/* 3. Imputation of null/blank values. */

SELECT DISTINCT [Sentiment],
[CSAT Score]
FROM calls
ORDER BY [Sentiment], [CSAT Score];



/* 4. Removal of redundant/irrelevant columns. */

----------------------------------------------------------------------------------------------------------------------

/* Call Centre Data Analysis. */

/* 1. Total number of calls. */

SELECT COUNT(DISTINCT [Call Id])
FROM calls;



/* 2. Total call duration in munutes. */

SELECT SUM([Call Duration (Mins)])
FROM calls;



/* 3. Average call duration in minutes */

SELECT AVG([Call Duration (Mins)])
FROM calls;



/* 4. Average CSAT score */

SELECT AVG([CSAT Score])
FROM calls;



/* 5. Total calls by call date. */

SELECT [Call Date],
COUNT(DISTINCT [Call Id])
FROM calls
GROUP BY [Call Date];