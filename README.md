# Slim & Eloquent

The Slim PHP micro framework paired with Laravel's Illuminate Database toolkit.

## Getting started

```bash
# Download composer
curl -s https://getcomposer.org/installer | php

# Install project dependencies
php composer.phar install
```

Edit the database configuration in `app/config.php` to match your settings.

Now set your server's document root to the `public/` directory.

The end.

```bash
# create a database name car_wash then load the dump
mysql -uroot -p car_wash < car_wash.sql

#in public directory 
php -S localhost:3001

# try it out in browser
http://localhost:3001/#/cars
```

> __Note:__
> Even though loading database form dump isn't a good practice but it just suffice for the purpose of this tutorial. You should use novice migrate if you are collaborating with others.

## Documentation

#### Slim framework
http://docs.slimframework.com

#### Eloquent ORM
http://laravel.com/docs/eloquent

and

https://github.com/illuminate/database/blob/master/README.md
