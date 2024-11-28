INSERT INTO Trainer (TrainerID, PersonID, Specialization, TrainerRating)
VALUES ('T100', 'P50', 'Cardio Specialist', 4.8);

INSERT INTO ClientProfile (ClientID, TrainerID, Goals, ProgressReports)
VALUES ('C100', 'T100', 'Marathon Training', 'Initial Assessment Done');

UPDATE ActivityLog
SET CaloriesBurned = CaloriesBurned * 1.1
WHERE Duration > 60;

DELETE FROM User
WHERE UserID NOT IN (
    SELECT DISTINCT UserID
    FROM ActivityLog
);

