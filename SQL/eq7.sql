-- View 1 combines User and ActivityLog to showcase active users and their total respective activities

CREATE VIEW ActiveUsersSummary AS
SELECT 
    U.UserID,
    U.Email,
    U.Gender,
    COUNT(AL.LogID) AS TotalActivities,
    SUM(AL.CaloriesBurned) AS TotalCaloriesBurned
FROM User U
LEFT JOIN ActivityLog AL ON U.UserID = AL.UserID
GROUP BY U.UserID, U.Email, U.Gender;

-- View 2 combines Trainer and ClientProfile to showcase trainers and their respective clients goals

CREATE VIEW TrainerClientGoals AS
SELECT 
    T.TrainerID,
    T.Specialization,
    C.ClientID,
    C.Goals
FROM Trainer T
JOIN ClientProfile C ON T.TrainerID = C.TrainerID;

-- Queries View 1 - retrieves users with more than 5 activities, in order of calories burned

SELECT * FROM ActiveUsersSummary
WHERE TotalActivities > 5
ORDER BY TotalCaloriesBurned DESC;

-- Queries View 2 - shows # of clients per trainer organized by trainer with most # of clients

SELECT TrainerID, Specialization, COUNT(ClientID) AS TotalClients
FROM TrainerClientGoals
GROUP BY TrainerID, Specialization
ORDER BY TotalClients DESC;

-- Modifying a view example 1

INSERT INTO ActiveUsersSummary (UserID, Email, Gender, TotalActivities, TotalCaloriesBurned)
VALUES ('U100', 'testuser@example.com', 'M', 10, 5000);

-- Modifying a viw example 2

UPDATE TrainerClientGoals
SET Goals = 'Improve Stamina'
WHERE ClientID = 'C102';





