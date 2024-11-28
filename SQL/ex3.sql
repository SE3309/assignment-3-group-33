SHOW DATABASES;
USE `healthub-schema`;
INSERT INTO Person (Name, DateOfBirth)
VALUES ('John Muller', '1998-06-07');

ALTER TABLE Person MODIFY DateOfBirth DATE NOT NULL DEFAULT '2002-07-01';
INSERT INTO Person (Name)
VALUES ('Jay Miller');

INSERT INTO Person (Name, DateOfBirth)
SELECT 
    CONCAT('GroupedUser_', Name), 
    MIN(DateOfBirth) -- Uses aggregation to pick the earliest date
FROM Person
GROUP BY Name;
















