
-- first sql query - retrieves all users and associated persons
SELECT UserID, Email, Name, DateOfBirth
FROM User
JOIN Person ON User.PersonID = Person.PersonID;

-- Second SQL Query GROUP BY and aggregation

SELECT ActivityType, AVG(CaloriesBurned) AS AvgCaloriesBurned
FROM ActivityLog
GROUP BY ActivityType;

-- Third SQL Query uses EXISTS - checks if user has logged an activity 

SELECT UserID, Email
FROM User
WHERE EXISTS (
    SELECT 1
    FROM ActivityLog
    WHERE ActivityLog.UserID = User.UserID
);

-- Fourth SQL Query - finds users that have BMI that is above average using conditonal logic

SELECT U.UserID, U.Email, HM.BMI
FROM User U
JOIN HealthMetrics HM ON U.UserID = HM.UserID
WHERE HM.BMI > (SELECT AVG(BMI) FROM HealthMetrics);

-- Fifth SQL Query - uses Order BY to find top 5 clients by their progress reports

SELECT ClientID, COUNT(ProgressReports) AS TotalReports
FROM ClientProfile
GROUP BY ClientID
ORDER BY TotalReports DESC
LIMIT 5;

-- Sixth SQL Query - uses subquery - finds trainers managing clients with specific goals

SELECT TrainerID, Specialization
FROM Trainer
WHERE TrainerID IN (
    SELECT TrainerID
    FROM ClientProfile
    WHERE Goals LIKE '%Weight Loss%'
);

-- Seventh SQL Query - uses join and count to count activities per user

SELECT U.UserID, U.Email, COUNT(AL.LogID) AS TotalActivities
FROM User U
LEFT JOIN ActivityLog AL ON U.UserID = AL.UserID
GROUP BY U.UserID, U.Email
ORDER BY TotalActivities DESC;











