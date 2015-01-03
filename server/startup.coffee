Meteor.startup ->
  # create roles 
  Roles.createRole "admin"  unless Meteor.roles.findOne(name: "admin")
  Roles.createRole "doctor"  unless Meteor.roles.findOne(name: "doctor")
  
  # bootstrap the admin user if they exist
	me = Meteor.users.findOne(emails: {$elemMatch: {address: "johannchen@gmail.com"}})
	if me
		unless Roles.userIsInRole(me._id, ['admin'])
			Roles.addUsersToRoles me._id, ["admin"]

	# for dev, remove them on prod
	Meteor.methods
		removeAllPatients: ->
			Patients.remove({})
		removeAllVisits: ->
			Visits.remove({})
