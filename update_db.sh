#!/bin/bash

# Define the path to your PHP files
FILES=(
    "/var/www/html/myapp/signin.php"
    "/var/www/html/myapp/signup.php"
    "/var/www/html/myapp/vote.php"
)

# Prompt for database configuration values
read -p "Enter your database host: " DB_HOST
read -p "Enter your database name: " DB_NAME
read -p "Enter your database username: " DB_USER
read -s -p "Enter your database password: " DB_PASS
echo # for a newline after password input

# Loop through each file and update the database configuration
for FILE in "${FILES[@]}"; do
    sed -i "s/\$host = \".*\";/\$host = \"$DB_HOST\";/" "$FILE"
    sed -i "s/\$dbname = \".*\";/\$dbname = \"$DB_NAME\";/" "$FILE"
    sed -i "s/\$username = \".*\";/\$username = \"$DB_USER\";/" "$FILE"
    sed -i "s/\$dbPassword = \".*\";/\$dbPassword = \"$DB_PASS\";/" "$FILE"
    echo "Database configuration updated in $FILE"
done
