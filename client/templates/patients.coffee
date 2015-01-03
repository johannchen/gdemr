Template.patients.helpers
	patients: ->
		search = Session.get 'patientSearch'
		console.log search
		#TODO: search
		Patients.find(name: {$regex: search, $options: 'i'}) if search

Template.patients.events
	'click .patient': ->
		Session.set 'pid', @_id
