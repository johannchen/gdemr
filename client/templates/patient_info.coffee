Template.patientInfo.helpers
	patient: ->
		Patients.findOne(Session.get('pid')) if Session.get 'pid'
