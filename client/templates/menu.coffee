Session.setDefault 'patientSearch', null

Template.menu.events
	'click button.search': ->
		Session.set 'patientSearch', $('#patientName').val()
		#$('#patientName').val('')
		Router.go '/patients'
		#false

