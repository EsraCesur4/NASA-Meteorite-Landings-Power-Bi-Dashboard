-- 1. Dataset Overview
SELECT * FROM dbo.Meteorite_Landings;


-- 2. "NULL" Column Identification and Percentage Analysis
SELECT
    'NULL Count' AS Type,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id,
    SUM(CASE WHEN nametype IS NULL THEN 1 ELSE 0 END) AS nametype,
    SUM(CASE WHEN recclass IS NULL THEN 1 ELSE 0 END) AS recclass,
    SUM(CASE WHEN mass_g IS NULL THEN 1 ELSE 0 END) AS [mass (g)],
    SUM(CASE WHEN fall IS NULL THEN 1 ELSE 0 END) AS fall,
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS year,
    SUM(CASE WHEN reclat IS NULL THEN 1 ELSE 0 END) AS reclat,
    SUM(CASE WHEN reclong IS NULL THEN 1 ELSE 0 END) AS reclong,
    SUM(CASE WHEN GeoLocation IS NULL THEN 1 ELSE 0 END) AS GeoLocation
FROM Meteorite_Landings

UNION ALL

SELECT
    'NULL %',
    ROUND(SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN nametype IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN recclass IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN mass_g IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN fall IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN reclat IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN reclong IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN GeoLocation IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2)
FROM Meteorite_Landings;


-- 3. Overview of NULL Columns
SELECT *
FROM Meteorite_Landings
WHERE
    mass_g IS NULL OR
    year IS NULL OR
    reclat IS NULL OR
    reclong IS NULL OR
    GeoLocation IS NULL;

-- 4. Creating a Cleaned Table
SELECT *
INTO Meteorite_Landings_Cleaned
FROM Meteorite_Landings
WHERE
    mass_g IS NOT NULL AND
    year IS NOT NULL AND
    reclat IS NOT NULL AND
    reclong IS NOT NULL AND
    GeoLocation IS NOT NULL;


-- 5. Checking the Cleaned Table
SELECT
    'NULL Count' AS Type,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id,
    SUM(CASE WHEN nametype IS NULL THEN 1 ELSE 0 END) AS nametype,
    SUM(CASE WHEN recclass IS NULL THEN 1 ELSE 0 END) AS recclass,
    SUM(CASE WHEN mass_g IS NULL THEN 1 ELSE 0 END) AS [mass (g)],
    SUM(CASE WHEN fall IS NULL THEN 1 ELSE 0 END) AS fall,
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS year,
    SUM(CASE WHEN reclat IS NULL THEN 1 ELSE 0 END) AS reclat,
    SUM(CASE WHEN reclong IS NULL THEN 1 ELSE 0 END) AS reclong,
    SUM(CASE WHEN GeoLocation IS NULL THEN 1 ELSE 0 END) AS GeoLocation
FROM Meteorite_Landings_Cleaned

UNION ALL

SELECT
    'NULL %',
    ROUND(SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN nametype IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN recclass IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN mass_g IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN fall IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN reclat IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN reclong IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2),
    ROUND(SUM(CASE WHEN GeoLocation IS NULL THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2)
FROM Meteorite_Landings_Cleaned;


CREATE TABLE LocationTable (
    id INT PRIMARY KEY,
    reclat FLOAT,
    reclong FLOAT,
    GeoLocation VARCHAR(50)
);

INSERT INTO LocationTable (id, reclat, reclong, GeoLocation)
SELECT DISTINCT id, reclat, reclong, GeoLocation
FROM Meteorite_Landings_Cleaned;


CREATE TABLE MassTable (
    id INT PRIMARY KEY,
    mass_g FLOAT
);

INSERT INTO MassTable (id, mass_g)
SELECT DISTINCT id, mass_g
FROM Meteorite_Landings_Cleaned;


CREATE TABLE ClassTable (
    id INT PRIMARY KEY,
    nametype VARCHAR(50),
    recclass VARCHAR(50)
);

INSERT INTO ClassTable (id, nametype, recclass)
SELECT DISTINCT id, nametype, recclass
FROM Meteorite_Landings_Cleaned;


CREATE TABLE TimeTable (
    id INT PRIMARY KEY,
    year INT
);

INSERT INTO TimeTable (id, year)
SELECT DISTINCT id, year
FROM Meteorite_Landings_Cleaned;


CREATE TABLE FallTable (
    id INT PRIMARY KEY,
    fall VARCHAR(20)
);

INSERT INTO FallTable (id, fall)
SELECT DISTINCT id, fall
FROM Meteorite_Landings_Cleaned;


CREATE TABLE MeteoriteTable (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO MeteoriteTable (id, name)
SELECT DISTINCT id, name
FROM Meteorite_Landings_Cleaned;
