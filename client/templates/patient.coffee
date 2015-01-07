Template.patient.helpers
	lastVisit: ->
		cursor = Visits.find {patientId: Session.get('pid')},
			sort: {visitDate: -1}
			limit: 1
		cursor.fetch()[0]
	recentVisits: ->
		Visits.find {patientId: Session.get('pid')},
			sort: {visitDate: -1}
			limit: 5

Template.patient.events
	'click .visit-link': ->
		Session.set 'currentLink', 'visit'
	'click button#addMedication': ->
		name = $('#medication').val()
		if name
			med =
				name: name
				dose: $('#dose').val()
				active: true
				createdAt: new Date()
				createdBy: Meteor.userId()
				updatedAt: new Date()
				updatedBy: Meteor.userId()
			Meteor.call 'addMedication', Session.get('pid'), med
			$('#medication').val('')
			$('#dose').val('')
		else
			alert "medication name cannot be empty!"
		false
	'click button#addAllergy': ->
		medication = $('#allergy').val()
		if medication
			allergy =
				medication: medication
				reaction: $('#reaction').val()
				createdAt: new Date()
				createdBy: Meteor.userId()
				updatedAt: new Date()
				updatedBy: Meteor.userId()
			Meteor.call 'addAllergy', Session.get('pid'), allergy
			$('#allergy').val('')
			$('#reaction').val('')
		else
			alert "Medication name cannot be empty!"
		false
	'click button#addDiagnosis': ->
		diag = $('#diagnosis').val()
		if diag
			diagnosis =
				diagnosis: diag
				date: $('#diagnosisDate').val()
				createdAt: new Date()
				createdBy: Meteor.userId()
				updatedAt: new Date()
				updatedBy: Meteor.userId()
			Meteor.call 'addDiagnosis', Session.get('pid'), diagnosis
			$('#diagnosis').val('')
			$('#diagnosisDate').val('')
		else
			alert "Diagnosis cannot be empty!"
		false
	'click button#addSurgery': ->
		surg = $('#surgery').val()
		if surg
			surgery =
				surgery: surg
				date: $('#surgeryDate').val()
				createdAt: new Date()
				createdBy: Meteor.userId()
				updatedAt: new Date()
				updatedBy: Meteor.userId()
			Meteor.call 'addSurgery', Session.get('pid'), surgery
			$('#surgery').val('')
			$('#surgeryDate').val('')
		else
			alert "Surgery cannot be empty!"
		false
	'click button#addBehavior': ->
		name = $('#behavior').val()
		if name
			behavior =
				behavior: name
				details: $('#details').val()
				createdAt: new Date()
				createdBy: Meteor.userId()
				updatedAt: new Date()
				updatedBy: Meteor.userId()
			Meteor.call 'addBehavior', Session.get('pid'), behavior
			$('#behavior').val('')
			$('#details').val('')
		else
			alert "Behavior cannot be empty!"
		false
	'click button#addRelation': ->
		name = $('#relation').val()
		if name
			relative =
				relation: name
				details: $('#relationDetails').val()
				createdAt: new Date()
				createdBy: Meteor.userId()
				updatedAt: new Date()
				updatedBy: Meteor.userId()
			Meteor.call 'addRelation', Session.get('pid'), relative
			$('#relation').val('')
			$('#relationDetails').val('')
		else
			alert "Relation cannot be empty!"
		false


