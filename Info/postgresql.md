# POSTGRESQL NOTES  


```
$ sudo su - postgres
$ psql

# show users
$ \du

# show tables
$ \db

# list all db
$ \list

$ CREATE USER deploy;

$ ALTER ROLE deploy WITH createdb;

$ CREATE DATABASE <NAME>;

# change db owner
$ ALTER DATABASE test OWNER TO deploy;
```
