# MONGODB NOTES

##Getting Started
```
# mongo console
$ mongo <dbname>
```
### Select/Show DB
```javascript
> use <dbname>
> show dbs
```

###Drop DB
```shell
$ mongo <dbname> --eval "db.dropDatabase()"
```
### Run Script
```shell
$ mongo <dbname> script.js
```

###Load Backup
```shell
$ mongorestore --db <DESTINATION> <LOCATION OF DUMP>
$ mongorestore --db db_development db_production/
```

##Queries
```javascript
$ mongo
> db.getCollection('guitars').find({type: "Electric"})
// Get Where external_id exists
> db.getCollection('guitars').find({external_id: { $exists: true }})
// Get Where array has size of 3
> db.getCollection('guitars').find({external_id: { $size: 3 }})
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
> var allProfiles = db.profiles.find({company_ids: ID }).toArray();
```

### Find all Profiles with company ids array, more then 0
```javascript
> db.profiles.find({company_ids: { $exists: true, $not: {$size: 0} }});
```

### Cycle through query
```javascript
> var allProfiles = db.profiles.find({company_ids: { $exists: true, $not: {$size: 0} }}).toArray()
> allProfiles.forEach(function(){ return //CODE });
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

### Updates
```javascript
// Find animals type and change to new type
> db.animals.find({type_id: ObjectId("###")}).forEach(function(x) { 
	x.type_id = ObjectId("###")
	db.animals.save(x)
})

// Rename Type Name
> db.animals.update(
	{id: ObjectId(“###”)}, 
	{
		$set: {“name”: ObjectId(“###”)}, 
		$currentDate: {“lastModified”: true}
	}
)
```

