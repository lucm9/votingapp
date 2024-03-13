#!/bin/bash

# Update package lists
sudo apt update -y

# Install Apache2, PHP, and MySQL client
sudo apt install apache2 php libapache2-mod-php php-mysql -y
sudo apt install mysql-client -y

# Restart Apache to apply changes
sudo service apache2 restart

# Create a directory for your app
sudo mkdir -p /var/www/html/myapp

# Clone repo
git clone https://github.com/xashy-devops/votingapp.git

# Change ownership of the app directory
sudo chown -R www-data:www-data /var/www/html/myapp

# Move your app's PHP files into the new directory
sudo mv ~/votingapapp/signin.php /var/www/html/myapp/
sudo mv ~/votingapapp/signup.php /var/www/html/myapp/
sudo mv ~/votingapapp/vote.php /var/www/html/myapp/
sudo mv ~/votingapapp/logout.php /var/www/html/myapp/
