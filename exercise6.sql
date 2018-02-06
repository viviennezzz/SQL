--Exercise 6.1: Manipulatin Data

SELECT * FROM regions;

INSERT INTO regions
VALUES (5, 'Central America');

SELECT * FROM regions;

INSERT INTO regions
VALUES (6, 'South America');

SELECT * FROM regions;

UPDATE regions
SET region_name = 'South and Central America'
WHERE region_name = 'Central America';

SELECT * FROM regions;

DELETE FROM regions
WHERE region_id = 6;

SELECT * FROM regions;

ROLLBACK;

SELECT * FROM regions;