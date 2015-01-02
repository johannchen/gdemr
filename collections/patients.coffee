@Patients = new Mongo.Collection('patients')

@Patients.allow
	insert: (userId, patient) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	remove: (userId, patient) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	update: (userId, patient, fieldNames, modifier) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
		
