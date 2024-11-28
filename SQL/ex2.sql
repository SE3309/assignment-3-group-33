-- Creating the Person table
CREATE TABLE Person (
    PersonID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL
);
-- Describe the structure of the Person table
DESCRIBE Person;

-- Creating the User table
CREATE TABLE User (
    UserID VARCHAR(50) PRIMARY KEY,
    PersonID VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL, -- Alternative key
    Password VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Height INT,
    Weight INT,
    FitnessGoals TEXT,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);
-- Describe the structure of the User table
DESCRIBE User;

-- Creating the Trainer table
CREATE TABLE Trainer (
    TrainerID VARCHAR(50) PRIMARY KEY,
    PersonID VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) UNIQUE NOT NULL, -- Alternative key
    TrainerRating FLOAT,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);
-- Describe the structure of the User table
DESCRIBE Trainer;

-- Creating the ActivityLog table
CREATE TABLE ActivityLog (
    LogID VARCHAR(50) PRIMARY KEY,
    UserID VARCHAR(50) NOT NULL,
    ActivityType VARCHAR(50) NOT NULL, -- Alternative key
    CaloriesBurned INT,
    DateOfActivity DATE,
    DistanceTraveled FLOAT,
    Duration INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
-- Describe the structure of the User table
DESCRIBE ActivityLog;

-- Creating the NutritionLog table
CREATE TABLE NutritionLog (
    LogID VARCHAR(50) PRIMARY KEY,
    UserID VARCHAR(50) NOT NULL,
    MealName VARCHAR(100) UNIQUE NOT NULL, -- Alternative key
    CalorieCount INT,
    Macronutrients TEXT,
    MealCategory VARCHAR(50),
    DateLogged DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
-- Describe the structure of the User table
DESCRIBE NutritionLog;

-- Creating the HealthMetrics table
CREATE TABLE HealthMetrics (
    HealthMetricID VARCHAR(50) PRIMARY KEY,
    UserID VARCHAR(50) NOT NULL,
    BMI FLOAT,
    HeartRate INT,
    SleepQuality VARCHAR(100),
    BodyFat FLOAT,
    CaloriesBurnedPerDay INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
    );
    
-- Describe the structure of the User table
DESCRIBE HealthMetrics;

-- Creating the ClientProfile table
CREATE TABLE ClientProfile (
    ClientID VARCHAR(50) PRIMARY KEY,
    TrainerID VARCHAR(50) NOT NULL,
    ProgressReports TEXT,
    WorkoutPlans TEXT,
    Goals TEXT,
    NutritionalPlans TEXT,
    VirtualSessionHistory TEXT,
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);
-- Describe the structure of the User table
DESCRIBE ClientProfile;

CREATE TABLE WorkoutPlans (
    WorkoutPlanID VARCHAR(50) PRIMARY KEY,
    ClientID VARCHAR(50) NOT NULL,
    TrainerID VARCHAR(50) NOT NULL,
    WorkoutPlan TEXT,
    Frequency VARCHAR(50),
    ProgressLogs TEXT,
    FOREIGN KEY (ClientID) REFERENCES ClientProfile(ClientID),
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
    UNIQUE (WorkoutPlan(255)) -- Limit uniqueness to the first 255 characters
);
-- Describe the structure of the User table
DESCRIBE WorkoutPlans;


CREATE TABLE VirtualSession (
    SessionID VARCHAR(50) PRIMARY KEY,
    TrainerID VARCHAR(50) NOT NULL,
    ClientID VARCHAR(50) NOT NULL,
    Duration INT,
    DateOfSession DATE,
    SessionSummary TEXT,
    Feedback TEXT,
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
    FOREIGN KEY (ClientID) REFERENCES ClientProfile(ClientID),
    UNIQUE (SessionSummary(255)) -- Limit uniqueness to the first 255 characters
);
-- Describe the structure of the User table
DESCRIBE VirtualSession;


-- Step 2: Modify Columns to VARCHAR
SET FOREIGN_KEY_CHECKS = 0;

SET FOREIGN_KEY_CHECKS = 1;








