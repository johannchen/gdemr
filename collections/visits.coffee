@Visits = new Mongo.Collection('visits')

@Visits.allow
	insert: (userId, visit) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	remove: (userId, visit) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	update: (userId, visit, fieldNames, modifier) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
		
