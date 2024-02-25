curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash

sudo apt install symfony-cli
symfony check:requirements
symfony new /var/www/html/projects


cd /var/www/html/projects
composer install