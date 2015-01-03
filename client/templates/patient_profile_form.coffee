UI.registerHelper 'isMale', (gender) ->
	if gender is 'M' then true else false
UI.registerHelper 'isFemale', (gender) ->
	if gender is 'F' then true else false

#TODO: use template.find instead of jquery
Template.patientProfileForm.events
	'click button.save': ->
		name = $('#name').val()
		profile =
			gender: $('input[name=gender]:checked').val()
			birthday: $('#birthday').val()
			email: $('#email').val()
			phone: $('#phone').val()
			insurance: $('#insurance').val()
			occupation: $('#occupation').val()
			company: $('#company').val()
			nationality: $('#nationality').val()
			address:
				province: $('#province').val()
				city: $('#city').val()
				district: $('#district').val()
				street: $('#street').val()
				complex: $('#complex').val()
			updatedAt: new Date()
			updatedBy: Meteor.userId()

		pid = $('#pid').val()
		if (pid)
			Patients.update pid,
				$set: {profile: data},
			Router.go '/patients/' + pid + '/profile'
		else
			Meteor.call 'addPatient', name, profile, (error, result) ->
				if (error)
				else
					# set session patientId? more effectient than set data in route?
					Session.set 'pid', result
					Router.go '/patients/' + result + '/profile'
			
