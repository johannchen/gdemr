#TODO: use reactive variable instead of Session
Session.setDefault 'med', null
Session.setDefault 'editingMed', null

Template.patientMedications.helpers
	currentMedications: ->
		# is it a way to filter embedded documents in mongo?
		currentMeds = []
		meds = Patients.findOne(Session.get('pid')).medications
		if meds
			for med in meds
				currentMeds.push(med) if med.active
		currentMeds
	pastMedications: ->
		pastMeds = []
		meds = Patients.findOne(Session.get('pid')).medications
		if meds
			for med in meds
				pastMeds.push(med) unless med.active
		pastMeds
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
		oldMed = Session.get('med')
		newMed = 
			name: $('#medication').val()
			dose: $('#dose').val()
			details: $('#details').val()
			active: oldMed.active
			createdBy: oldMed.createdBy
			createdAt: oldMed.createdAt
			updatedBy: Meteor.userId()
			updatedAt: new Date()
		Meteor.call('updateMedication', Session.get('pid'), oldMed, newMed)
		Session.set 'med', newMed
		Session.set 'editingMed', null
		false
	'click button#startMed': ->
		med = Session.get 'med'
		Meteor.call 'startMedication', Session.get('pid'), med
		med.active = true
		Session.set 'med', med
	'click button#stopMed': ->
		med = Session.get 'med'
		Meteor.call 'stopMedication', Session.get('pid'), med
		med.active = false 
		Session.set 'med', med

