#!/bin/bash

# Prompt for the first candidate's name
read -p "Enter the name of the first candidate: " CANDIDATE1

# Prompt for the second candidate's name
read -p "Enter the name of the second candidate: " CANDIDATE2

# SQL script with input values
SQL_SCRIPT=$(cat <<EOF
CREATE DATABASE IF NOT EXISTS \`votingdb\`;
USE votingdb;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    voted BOOLEAN DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS candidates (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    votes INT DEFAULT 0
);

INSERT INTO candidates (name, votes) VALUES ('$CANDIDATE1', 0);
INSERT INTO candidates (name, votes) VALUES ('$CANDIDATE2', 0);
EOF
)

# Execute SQL script
mysql -u your_db_username -p your_db_name <<< "$SQL_SCRIPT"
