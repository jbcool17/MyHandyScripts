#!/usr/bin/env bash
# Drops and Reloads Database
# ./reload_mongodb.sh <database_name> <path_to_dump>
# ./reload_mongodb.sh production /home/user/production_dump

# Drop Database
mongo $1 --eval "db.dropDatabase()"

# Restore Database
mongorestore --db $1 $2

echo "Mongo Script Finished! :->"
