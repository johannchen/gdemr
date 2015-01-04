#TODO: use reactive variable instead of Session
Session.setDefault 'med', null
Session.setDefault 'editingMed', null

Template.patientMedications.helpers
	medications: ->
		Patients.findOne(Session.get('pid')).medications
	selectedMed: ->
		Session.get 'med'
	editingMed: ->
		Session.get 'editingMed'


Template.patientMedications.events
	'click .med': ->
		Session.set 'med', @
	'click #editMed': ->
		Session.set 'editingMed', true
	'click #saveMed': ->
		newMed = 
			name: $('#medication').val()
			dose: $('#dose').val()
			details: $('#details').val()
			updatedBy: Meteor.userId()
			updatedAt: new Date()
		Meteor.call('updateMedication', Session.get('pid'), Session.get('med'), newMed)
		Session.set 'editingMed', null
		false

