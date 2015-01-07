@Patients = new Mongo.Collection('patients')

Meteor.methods
	addPatient: (name, profile) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.insert
			name: name
			profile: profile
			createdAt: new Date()
			createdBy: Meteor.userId()
	addMedication: (id, med) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update id,
			$push:
				medications: med
	updateMedication: (id, oldMed, newMed) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update {_id: id, medications: oldMed},
			$set: {"medications.$": newMed}
	startMedication: (id, med) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update {_id: id, medications: med},
			$set: {"medications.$.active": true}
	stopMedication: (id, med) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update {_id: id, medications: med},
			$set: {"medications.$.active": false}
	addAllergy: (id, allergy) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update id,
			$push:
				allergies: allergy
	updateAllergy: (id, oldAllergy, newAllergy) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update {_id: id, allergies: oldAllergy},
			$set: {"allergies.$": newAllergy}
	addDiagnosis: (id, diagnosis) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update id,
			$push:
				diagnoses: diagnosis
	updateDiagnosis: (id, oldDiagnosis, newDiagnosis) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update {_id: id, diagnoses: oldDiagnosis},
			$set: {"diagnoses.$": newDiagnosis}
	addSurgery: (id, surgery) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update id,
			$push:
				surgeries: surgery
	updateSurgery: (id, oldSurgery, newSurgery) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update {_id: id, surgeries: oldSurgery},
			$set: {"surgeries.$": newSurgery}
	addBehavior: (id, behavior) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update id,
			$push:
				behaviors: behavior
	updateBehavior: (id, oldBehavior, newBehavior) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update {_id: id, behaviors: oldBehavior},
			$set: {"behaviors.$": newBehavior}
	addRelation: (id, relation) ->
		throw new Meteor.Error "not-authorized" unless Roles.userIsInRole(Meteor.userId(), ['admin', 'doctor'])
		Patients.update id,
			$push:
				relations: relation
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
		
