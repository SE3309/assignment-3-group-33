import pandas as pd
import random
from faker import Faker

fake = Faker()

# Generates unique IDs
def generate_ids(prefix, count):
    return [f"{prefix}{i}" for i in range(1, count + 1)]

# Generates Person Data
def generate_person_data(count):
    data = {
        "PersonID": generate_ids("P", count),
        "Name": [fake.name() for _ in range(count)],
        "DateOfBirth": [fake.date_of_birth(minimum_age=18, maximum_age=80).isoformat() for _ in range(count)],
    }
    return pd.DataFrame(data)

# Generates User Data
def generate_user_data(person_ids):
    data = {
        "UserID": generate_ids("U", len(person_ids)),
        "PersonID": person_ids,
        "Email": [fake.email() for _ in range(len(person_ids))],
        "Password": [fake.password() for _ in range(len(person_ids))],
        "Gender": [random.choice(["M", "F", "Other"]) for _ in range(len(person_ids))],
        "Height": [random.randint(150, 200) for _ in range(len(person_ids))],
        "Weight": [random.randint(50, 120) for _ in range(len(person_ids))],
        "FitnessGoals": [fake.sentence(nb_words=5) for _ in range(len(person_ids))],
    }
    return pd.DataFrame(data)

# Generates Trainer Data
def generate_trainer_data(person_ids, count):
    person_ids = list(person_ids)  # Convert pandas Series to a list
    trainer_ids = random.sample(person_ids, count)  # Randomly sample 500 IDs
    data = {
        "TrainerID": generate_ids("T", count),
        "PersonID": trainer_ids,
        "Specialization": [fake.job() for _ in range(count)],
        "TrainerRating": [round(random.uniform(3.0, 5.0), 1) for _ in range(count)],
    }
    return pd.DataFrame(data)


# Generates ActivityLog Data
def generate_activity_log_data(user_ids, count):
    data = {
        "LogID": generate_ids("AL", count),
        "UserID": [random.choice(user_ids) for _ in range(count)],
        "ActivityType": [random.choice(["Running", "Cycling", "Weightlifting"]) for _ in range(count)],
        "CaloriesBurned": [random.randint(50, 800) for _ in range(count)],
        "DateOfActivity": [fake.date_this_year().isoformat() for _ in range(count)],
        "DistanceTraveled": [round(random.uniform(0.5, 20.0), 2) for _ in range(count)],
        "Duration": [random.randint(10, 120) for _ in range(count)],
    }
    return pd.DataFrame(data)

# Generates NutritionLog Data
def generate_nutrition_log_data(user_ids, count):
    data = {
        "LogID": generate_ids("NL", count),
        "UserID": [random.choice(user_ids) for _ in range(count)],
        "MealName": [fake.word() for _ in range(count)],
        "CalorieCount": [random.randint(200, 1500) for _ in range(count)],
        "Macronutrients": [f"Carbs: {random.randint(10, 100)}, Proteins: {random.randint(10, 50)}, Fats: {random.randint(5, 30)}" for _ in range(count)],
        "MealCategory": [random.choice(["Breakfast", "Lunch", "Dinner", "Snack"]) for _ in range(count)],
        "DateLogged": [fake.date_this_year().isoformat() for _ in range(count)],
    }
    return pd.DataFrame(data)

# Generates HealthMetrics Data
def generate_health_metrics_data(user_ids):
    data = {
        "HealthMetricID": generate_ids("HM", len(user_ids)),
        "UserID": user_ids,
        "BMI": [round(random.uniform(18.5, 30.0), 2) for _ in user_ids],
        "HeartRate": [random.randint(60, 100) for _ in user_ids],
        "SleepQuality": [random.choice(["Good", "Average", "Poor"]) for _ in user_ids],
        "BodyFat": [round(random.uniform(15.0, 35.0), 2) for _ in user_ids],
        "CaloriesBurnedPerDay": [random.randint(1500, 3000) for _ in user_ids],
    }
    return pd.DataFrame(data)

# Generates ClientProfile Data
def generate_client_profile_data(trainer_ids, count):
    data = {
        "ClientID": generate_ids("C", count),
        "TrainerID": [random.choice(trainer_ids) for _ in range(count)],
        "ProgressReports": [fake.sentence(nb_words=10) for _ in range(count)],
        "WorkoutPlans": [fake.sentence(nb_words=8) for _ in range(count)],
        "Goals": [fake.sentence(nb_words=6) for _ in range(count)],
        "NutritionalPlans": [fake.sentence(nb_words=8) for _ in range(count)],
        "VirtualSessionHistory": [fake.sentence(nb_words=8) for _ in range(count)],
    }
    return pd.DataFrame(data)

# Generates WorkoutPlans Data
def generate_workout_plans_data(client_ids, trainer_ids, count):
    data = {
        "WorkoutPlanID": generate_ids("WP", count),
        "ClientID": [random.choice(client_ids) for _ in range(count)],
        "TrainerID": [random.choice(trainer_ids) for _ in range(count)],
        "WorkoutPlan": [fake.sentence(nb_words=8) for _ in range(count)],
        "Frequency": [random.choice(["Daily", "Weekly", "Monthly"]) for _ in range(count)],
        "ProgressLogs": [fake.sentence(nb_words=10) for _ in range(count)],
    }
    return pd.DataFrame(data)

# Generates VirtualSession Data
def generate_virtual_session_data(trainer_ids, client_ids, count):
    data = {
        "SessionID": generate_ids("VS", count),
        "TrainerID": [random.choice(trainer_ids) for _ in range(count)],
        "ClientID": [random.choice(client_ids) for _ in range(count)],
        "Duration": [random.randint(30, 120) for _ in range(count)],
        "DateOfSession": [fake.date_this_month().isoformat() for _ in range(count)],
        "SessionSummary": [fake.sentence(nb_words=15) for _ in range(count)],
        "Feedback": [random.choice(["Excellent", "Good", "Average", "Poor"]) for _ in range(count)],
    }
    return pd.DataFrame(data)

#  MySQL bulk import
def save_to_csv(df, filename):
    df.to_csv(filename, index=False)

# Generate and save data
person_data = generate_person_data(3000)
user_data = generate_user_data(person_data["PersonID"])
trainer_data = generate_trainer_data(person_data["PersonID"], 500)
activity_log_data = generate_activity_log_data(user_data["UserID"], 5000)
nutrition_log_data = generate_nutrition_log_data(user_data["UserID"], 5000)
health_metrics_data = generate_health_metrics_data(user_data["UserID"])
client_profile_data = generate_client_profile_data(trainer_data["TrainerID"], 500)
workout_plans_data = generate_workout_plans_data(client_profile_data["ClientID"], trainer_data["TrainerID"], 1000)
virtual_session_data = generate_virtual_session_data(trainer_data["TrainerID"], client_profile_data["ClientID"], 1000)

# Saves the data to CSV
save_to_csv(person_data, "Person.csv")
save_to_csv(user_data, "User.csv")
save_to_csv(trainer_data, "Trainer.csv")
save_to_csv(activity_log_data, "ActivityLog.csv")
save_to_csv(nutrition_log_data, "NutritionLog.csv")
save_to_csv(health_metrics_data, "HealthMetrics.csv")
save_to_csv(client_profile_data, "ClientProfile.csv")
save_to_csv(workout_plans_data, "WorkoutPlans.csv")
save_to_csv(virtual_session_data, "VirtualSession.csv")

print("Data generation complete.")
