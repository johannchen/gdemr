Session.setDefault 'patientSearch', null

Template.menu.events
	'submit form': ->
		Session.set 'patientSearch', $('#patientName').val()
		Router.go '/patients'
		false

