# MONGODB NOTES

##Getting Started
###Drop DB
```javascript
mongo <dbname> --eval "db.dropDatabase()"
```
### Run Script
```javascript
mongo <dbname> script.js
```
### Select/Show DB
```javascript
> use <dbname>
> show dbs
```
###Load Backup
```javascript
mongorestore --db <DESTINATION> <LOCATION OF FILES JSON>
mongorestore --db jobadvisor_test jobadvisor_production/
```

##Queries
```javascript
$ mongo
> db.getCollection('companies').find({short_name: "Clearswift"})
```

### Get industry with name
```javascript
> db.getCollection('industries').find({name: "Automotive"})
```

### Get Count - How many companies in industry
```javascript
> db.getCollection('companies').find({industry_ids: ObjectId("539d4e7f7e74914cf4000002")});
```

### Set toArray() to hold data in variable
```javascript
var allProfiles = db.profiles.find({company_ids: ID }).toArray();
```

### Find all Profiles with company ids, more the 0 in array
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
> db.profiles.find({company_ids: { $exists: true }});
```

### Get all that doesn’t have specific field
```javascript
> db.profiles.find({company_ids: { $exists: false }});
```

### Check if field exists - Is ‘first_name’ in profile?
```javascript
> allProfiles.forEach(function(profile){
var first_name = "first_name" in profile ? profile.first_name : "Unknown";
});
```

### Generate for CSV
```javascript
print("email,name,comment")
final_output.forEach(function(record){
	print([record.email, record.name, record.comment);
});
```
