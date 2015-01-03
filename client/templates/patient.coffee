
Template.patient.events
	'click button#addMedication': ->
		#_id: new Mongo.ObjectId()
		med =
			name: $('#medication').val()
			dose: $('#dose').val()
			active: true
			createdAt: new Date()
			createdBy: Meteor.userId()
		Meteor.call('addMedication', Session.get('pid'), med)
		$('#medication').val('')
		$('#dose').val('')
		false
