-- Users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Calendar
CREATE TABLE calendar_events (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    title VARCHAR(100) NOT NULL,
    description TEXT,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP,
    repeat_rule VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Recipes
CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    title VARCHAR(100) NOT NULL,
    description TEXT,
    ingredients TEXT,
    steps TEXT,
    tags TEXT[],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Meal plans (link recipes to days)
CREATE TABLE meal_plans (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    recipe_id INT REFERENCES recipes(id),
    plan_date DATE NOT NULL,
    meal_type VARCHAR(20) CHECK (meal_type IN ('breakfast','lunch','dinner','snack'))
);

-- Finance
CREATE TABLE finance_records (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    category VARCHAR(50) NOT NULL,
    type VARCHAR(10) CHECK (type IN ('income','expense')),
    amount DECIMAL(10,2) NOT NULL,
    description TEXT,
    record_date DATE NOT NULL DEFAULT CURRENT_DATE
);
