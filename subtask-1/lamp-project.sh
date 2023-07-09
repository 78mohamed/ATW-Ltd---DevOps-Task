#!/bin/bash

# Load variables from .env file
source .env

echo "update and install (php , mysql & apache) 📁 📁 📁 📁"
sudo apt-get update -y > /dev/null
sudo apt-get install apache2 mysql-server php libapache2-mod-php php-mysql -y > /dev/null
sudo curl -sS https://getcomposer.org/installer | sudo php && sudo mv composer.phar composer && sudo mv composer /usr/bin


echo "starting and enabling apache and mysql 🚀🚀🚀🚀🚀"
sudo systemctl start apache2 && sudo systemctl enable apache2
sudo systemctl start mysql && sudo systemctl enable mysql


echo "Adding php files"
sudo cp -r "$PWD"/index.php "/var/www/html/"
sudo cp -r "$PWD"/composer.json "/var/www/html/"
sudo cp -r "$PWD"/.env "/var/www/html/"

echo "yes" | sudo composer install --working-dir=/var/www/html >/dev/null 2>&1

echo "Creating database... 🗄️ 🗄️ 🗄️ 🗄️"
sudo mysql -u $DB_USER -e "CREATE DATABASE $DB_NAME;"

echo "Creating user...  🗄️ 🗄️ 🗄️ 🗄️"

sudo mysql -u $DB_USER -e "CREATE USER '$USER_NAME'@'$DB_HOST' IDENTIFIED BY '$DB_PASSWORD';"

echo "Granting privileges... 🗄️ 🗄️ 🗄️ 🗄️"
sudo mysql -u $DB_USER -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'$DB_HOST';"

echo "Creating table... 🗄️ 🗄️ 🗄️ 🗄️"
sudo mysql -u $DB_USER $DB_NAME -e "
CREATE TABLE visitors (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(15) NOT NULL,
    visit_time DATETIME NOT NULL
);"
echo "Database setup complete.  🗄️ 🗄️ 🗄️ 🗄️"


echo "configering and restarting apache  ⚙️ ⚙️ ⚙️ ⚙️ ⚙️"
sudo mv ./php.conf /etc/apache2/sites-available/
sudo chmod 666 /etc/apache2/sites-available/php.conf

sudo a2ensite php.conf
sudo systemctl restart apache2

ip=$(curl http://checkip.amazonaws.com/)
echo "Open http port on your ec2"
echo "Open your browser 🌐🌐🌐🌐 and enter the following"
echo "${ip}"
