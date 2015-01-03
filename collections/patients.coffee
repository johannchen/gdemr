@Patients = new Mongo.Collection('patients')

Meteor.methods
	addPatient: (name, profile) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.insert
			name: name
			profile: profile
			createdAt: new Date()
			createdBy: Meteor.userId()
	resetDB: ->
		# for dev, remove on prod
		Patients.remove({})
		Visits.remove({})

@Patients.allow
	insert: (userId, patient) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	remove: (userId, patient) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	update: (userId, patient, fieldNames, modifier) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
		
