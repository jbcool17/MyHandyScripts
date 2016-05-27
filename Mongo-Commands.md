# MONGODB NOTES

##Getting Started
```
# mongo console
mongo <dbname>
```
### Select/Show DB
```javascript
> use <dbname>
> show dbs
```

###Drop DB
```javascript
mongo <dbname> --eval "db.dropDatabase()"
```
### Run Script
```javascript
mongo <dbname> script.js
```

###Load Backup
```javascript
mongorestore --db <DESTINATION> <LOCATION OF DUMP>
mongorestore --db jobadvisor_test jobadvisor_production/
```

##Queries
```javascript
$ mongo
> db.getCollection('guitar').find({type: "Electric"})
```

### Get industry with name or id
```javascript
> db.seals.find()
> db.getCollection('animals').find({name: "Wolf"})
> db.getCollection('birds').find({some_id: ObjectId("####") });
```

### Get Count - How many companies in industry
```javascript
> db.profiles.find({company_ids: ObjectId("###")}).toArray().count();
```

### Set toArray() to hold data in variable, otherwise it disappears on the next line
```javascript
var allProfiles = db.profiles.find({company_ids: ID }).toArray();
```

### Find all Profiles with company ids array, more then 0
```javascript
db.profiles.find({company_ids: { $exists: true, $not: {$size: 0} }});
```

### Cycle through query
```javascript
var allProfiles = db.profiles.find({company_ids: { $exists: true, $not: {$size: 0} }}).toArray()
allProfiles.forEach(function(){ return //CODE });
```

### Get all that have specific field
```javascript
> db.posts.find({comments: { $exists: true }});
```

### Get all that doesn’t have specific field
```javascript
> db.posts.find({comments: { $exists: false }});
```

### Check if field exists - Is ‘first_name’ in profile? - similar to above
```javascript
> var allProfiles = db.profiles.find({company_ids: { $exists: true, $not: {$size: 0} }}).toArray()
> allProfiles.forEach(function(profile){
	var first_name = "first_name" in profile ? profile.first_name : "Unknown";
	// edit me
});
```

### Generate for CSV
```javascript
print("email,name,comment")
final_output.forEach(function(record){
	print([record.email, record.name, record.comment);
});
```
