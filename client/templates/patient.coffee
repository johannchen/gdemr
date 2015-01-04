
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
		Meteor.call('addMedication', Session.get('pid'), med)
		$('#medication').val('')
		$('#dose').val('')
		false
