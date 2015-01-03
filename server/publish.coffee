Meteor.publish 'patients', ->
	Patients.find()
Meteor.publish 'visits', ->
	Visits.find()

