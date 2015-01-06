
Template.patient.events
	'click button#addMedication': ->
		med =
			name: $('#medication').val()
			dose: $('#dose').val()
			active: true
			createdAt: new Date()
			createdBy: Meteor.userId()
			updatedAt: new Date()
			updatedBy: Meteor.userId()
		Meteor.call 'addMedication', Session.get('pid'), med
		$('#medication').val('')
		$('#dose').val('')
		false
	'click button#addAllergy': ->
		allergy = 
			medication: $('#allergy').val()
			reaction: $('#reaction').val()
			createdAt: new Date()
			createdBy: Meteor.userId()
			updatedAt: new Date()
			updatedBy: Meteor.userId()
		Meteor.call 'addAllergy', Session.get('pid'), allergy
		$('#allergy').val('')
		$('#reaction').val('')
		false
	'click button#addDiagnosis': ->
		diagnosis =
			diagnosis: $('#diagnosis').val()
			date: $('#diagnosisDate').val()
			createdAt: new Date()
			createdBy: Meteor.userId()
			updatedAt: new Date()
			updatedBy: Meteor.userId()
		Meteor.call 'addDiagnosis', Session.get('pid'), diagnosis
		$('#diagnosis').val('')
		$('#diagnosisDate').val('')
		false
	'click button#addSurgery': ->
		surgery =
			surgery: $('#surgery').val()
			date: $('#surgeryDate').val()
			createdAt: new Date()
			createdBy: Meteor.userId()
			updatedAt: new Date()
			updatedBy: Meteor.userId()
		Meteor.call 'addSurgery', Session.get('pid'), surgery
		$('#surgery').val('')
		$('#surgeryDate').val('')
		false
	'click button#addBehavior': ->
		behavior =
			behavior: $('#behavior').val()
			details: $('#details').val()
			createdAt: new Date()
			createdBy: Meteor.userId()
			updatedAt: new Date()
			updatedBy: Meteor.userId()
		Meteor.call 'addBehavior', Session.get('pid'), behavior
		$('#behavior').val('')
		$('#details').val('')
		false


	

