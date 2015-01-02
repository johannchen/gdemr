Template.patients.helpers
	patients: ->
		Patients.find()
	_id: ->
		# patient id
		@_id

#Template.patients.events
#click patient name, set patient session id 
