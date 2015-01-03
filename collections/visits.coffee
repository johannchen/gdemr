@Visits = new Mongo.Collection('visits')

Meteor.methods
	addVisit: (visit) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Visits.insert visit
	updateVisit: (id, visit) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Visit.update id,
			$set: visit


@Visits.allow
	insert: (userId, visit) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	remove: (userId, visit) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
	update: (userId, visit, fieldNames, modifier) ->
		Roles.userIsInRole(userId, ['admin', 'doctor'])
		
