```Voting App with signin/signup page```

The purpose of this is to see how an application connects to a database. We will host a web app on EC2 that talks to an RDS SQL DB. 

### Do the following steps: 
```sh
+ Create the an application vpc with 4 subnets —>> two public and two private 
+ create an RDS mysql database , create a security group for the db instance. Pay attention to the db endpoint,     master username and password 
+ Create the app instance on ec2 using ubuntu AMI. Open up security groups for ssh and http 
+ Connect to the instance using ssh. 
```

### Perform the following commands to install Apache and PHP
```sh
sudo apt update -y
sudo apt install apache2 php libapache2-mod-php php-mysql -y
```

### Restart Apache
```sh
sudo service apache2 restart
```

### Create and Host the PHP Web Application
```sh
## Create a directory to host your PHP files
sudo mkdir /var/www/html/myapp
## Change ownership of the directory to the Apache user
sudo chown -R www-data:www-data /var/www/html/myapp
## Navigate to the directory
cd /var/www/html/myapp
```

### Use WGET to download the 2 images of the voting candidates
```sh
## You can upload the images to a public S3 bucket and use WGET to download them into your server**
## Make sure to download images into the /var/www/html/myapp directory

## Rename the first image png1.jpg
sudo mv <IMG_NAME> png1.jpg
## Rename the second image png2.jpg
sudo mv <IMG_NAME> png2.jpg

```
### Create a file named signup.php and add the following code
```sh
sudo vi signup.php

## Paste the content of the signup.php file into this file
```

### Create a file named signin.php and add the following code
```sh
sudo vi signin.php

## Paste the content of the signin.php file into this file
```

### Create a file named vote.php and add the following code
```sh
sudo vi vote.php

## Paste the content of the vote.php file into this file
```

### Create a file named logout.php and add the following code
```sh
sudo vi logout.php

## Paste the content of the logout.php file into this file
```

### From the server connect to the database.
```sh 
## Install mysql client on the server:

sudo apt install mysql-client

## Connect to the database and create the db and table the app needs:
mysql -h <db_endpoint> -u dbusername  -p 
```

### While in the db , create a db and create a table in the db

```sh
## Enter a database name of your choice
CREATE DATABASE (specifyTheDatabaseName); 
## Replace with the database name
USE (specifyTheDatabaseName);
```
### Create a table named users to add the app users 
```sh
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    voted BOOLEAN DEFAULT FALSE
);
```

### Create a table named candidates to add the voting candidates
```sh
CREATE TABLE candidates (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    votes INT DEFAULT '0'
);
```

### Insert the name of the first candidate
```sh
INSERT INTO candidates (name, votes) VALUES ('INSERT_1ST_CANDIDATE_NAME', 0);
```

### Insert the name of the second candidate 
```sh
INSERT INTO candidates (name, votes) VALUES ('INSERT_2ND_CANDIDATE_NAME', 0);

```

### Check that the two entries in the candidate table has id = 1 and 2 respectively
```sh
SELECT * FROM candidates;
```

### edit the signup, signin, and vote files with the Database information
```sh
sudo vi signup.php
```
```sh
sudo vi signin.php
```
```sh
sudo vi vote.php
```