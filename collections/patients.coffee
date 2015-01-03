@Patients = new Mongo.Collection('patients')

Meteor.methods
	addPatient: (profile) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.insert
			profile: profile
			createdAt: new Date()
			createdBy: Meteor.userId()

@Patients.allow
	insert: (userId, patient) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	remove: (userId, patient) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	update: (userId, patient, fieldNames, modifier) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
		
