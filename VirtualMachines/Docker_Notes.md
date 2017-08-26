#DOCKER NOTES

### Stop All Docker Containers
```shell
docker stop $(docker ps -a -q)
```
### Remove All Docker Containers
```shell
docker rm $(docker ps -a -q)
```
### Stop All Docker Images tagged as "<none>"
```shell
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
```

### Start a mongodb container named mongo-test from a mongodb image
```shell
docker run --name mongo-test -d mongo
```

### Command line inside container
```shell
docker exec -it mongo-test  /bin/bash
```

### Setup Mongo Admin
```shell
$ mongo admin
> db.createUser({ user: “johnUser”, pwd: “test1234”, roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
```
### Logs(-f to follow output)
```shell
docker logs -f mongo-test
```

### Restore Mongo Dump
```shell
docker run -it --link mongo-test:mongo -v ~/DumpLocation/database_dump:/tmp mongo bash -c 'mongorestore -h 172.17.0.2:27017 --db database_name /tmp'
```
### Backup MongoDB
```shell
docker run -it --rm --link mongo-test:mongo -v ~/MongoDump/:/tmp mongo bash -c 'mongodump -h 172.17.0.2:27017 -d database_namne --out=/tmp'
```

### Get Info
```shell
docker inspect <container_hash>
```



docker exec -it some-mongo mongo admin
docker exec -it some-mongo mongo -u admin -p password --authenticationDatabase admin
db.createUser({user: "admin",pwd: "password",roles: [ { role: "root", db: "admin" } ]});
db.addUser( { user: "john",pwd: "test",roles: [ "userAdminAnyDatabase","dbAdminAnyDatabase","readWriteAnyDatabase"] } )
docker exec -it some-mongo /bin/bash
$ mongo --port 27017 -u admin -p password --authenticationDatabase admin


for (var i = 1; i <= 250; i++) {
   db.dogs.insert( { x : i } )
}
