# Linux Server Simulation
the repo contains a php.conf for apache configrations , index.php , composer.json and lamp-project.sh to automate allthe instaltion process.

## process and steps
first change premision for lamp-project.sh file using the following cmd:
```
sudo chmod u+x lamp-project.sh
```

* **the bash script do the following:**
* update linux and install lamp stack
* install composer and move it to /usr/bin to help us install all the php dependencies
* move the index.php, composer.json to /var/www/html
* move php.conf to /etc/apache2/sites-available/
* restart and host website
* create database schema , user and tables
* prints out the ip you need to enter at the end of the script

* **the index script do the following:**
it prints hello world and hello visitor message and show the time and the ip addresss and save them in the database.

* **additional tips:**
* .env is added to .gitignore for security.
* the composer used to instal dotenv libirary tohelp us read from .env file in index.php.

* **output pictures:**
hosted website & db table
![Alt Text](https://github.com/78mohamed/ATW-Ltd---DevOps-Task/blob/main/subtask-1/website.png?raw=true)
