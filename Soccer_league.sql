-- Create Teams Table
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255),
    city VARCHAR(255),
    coach_name VARCHAR(255),
    team_logo VARCHAR(255)
);

-- Create Players Table
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    team_id INT,
    position VARCHAR(255),
    date_of_birth DATE,
    nationality VARCHAR(255)
);

-- Create Matches Table
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    date_time DATETIME,
    location VARCHAR(255),
    season_id INT,
    home_team_id INT,
    away_team_id INT,
    home_team_score INT,
    away_team_score INT
);

-- Create Goals Table
CREATE TABLE Goals (
    goal_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    goal_time TIME
);

-- Create Referees Table
CREATE TABLE Referees (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(255)
);

-- Create Matches_Referees Table (Many-to-Many Relationship)
CREATE TABLE Matches_Referees (
    match_referee_id INT PRIMARY KEY,
    match_id INT,
    referee_id INT
);

-- Create Seasons Table
CREATE TABLE Seasons (
    season_id INT PRIMARY KEY,
    league_name VARCHAR(255),
    start_date DATE,
    end_date DATE
);

-- Create Standings Table
CREATE TABLE Standings (
    standing_id INT PRIMARY KEY,
    team_id INT,
    season_id INT,
    total_matches_played INT,
    total_wins INT,
    total_draws INT,
    total_losses INT,
    total_goals_for INT,
    total_goals_against INT,
    total_points INT
);

-- Insert sample data into the tables (you can adjust values as needed)
-- Example for inserting into the Teams table:
INSERT INTO Teams (team_id, team_name, city, coach_name, team_logo)
VALUES
    (1, 'Team A', 'City A', 'Coach A', 'team_a_logo.jpg'),
    (2, 'Team B', 'City B', 'Coach B', 'team_b_logo.jpg');

