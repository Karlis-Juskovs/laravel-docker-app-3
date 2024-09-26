#!/bin/bash

# Set proper permissions
chmod -R 775 /var/www/storage
chmod -R 775 /var/www/bootstrap/cache
chown -R www-data:www-data /var/www/storage
chown -R www-data:www-data /var/www/bootstrap/cache

php artisan key:generate

# Run migrations
php artisan migrate

# Execute the CMD command
exec docker-php-entrypoint php-fpm
