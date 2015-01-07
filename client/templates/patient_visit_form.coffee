Template.patientVisitForm.events
	'click button.save': ->
		visitDate = $('#visitDate').val()
		chiefComplaint = $('#complaint').val()
		if visitDate and chiefComplaint
			pid = $('#pid').val()
			vid = $('#vid').val()
			visit =
				patientId: pid
				doctorId: Meteor.userId()
				visitDate: $('#visitDate').val()
				chiefComplaint: $('#complaint').val()
				subjective: $('#subjective').val()
				assessment: $('#assessment').val()
				tests: $('#tests').val()
				plan: $('#plan').val()
				followUp: $('#followUp').val()
				nationality: $('#nationality').val()
				physical:
					general: $('#general').val()
					respiratory: $('#respiratory').val()
					cardiac: $('#cardiac').val()
					abdomen: $('#abdomen').val()
					gu: $('#gu').val()
					rectal: $('#rectal').val()
					extremities: $('#extremities').val()
					back: $('#back').val()
					skin: $('#skin').val()
					breast: $('#breast').val()
					neuro: $('#neuro').val()
					psych: $('#psych').val()
				vitalSign:
					temperature: $('#temperature').val()
					bp: $('#bp').val()
					pulse: $('#pulse').val()
					rr: $('#rr').val()
					o2: $('#o2').val()
					weight: $('#weight').val()
					height: $('#height').val()
					bmi: $('#bmi').val()
					hc: $('#hc').val()
				updatedAt: new Date()
				updatedBy: Meteor.userId()

			if (vid)
				#update visit
				Meteor.call('updateVisit', vid, visit)
				Router.go '/patients/' + pid + '/visits/' + vid 
			else
				visit.createdAt = new Date()
				visit.createdBy = Meteor.userId()
				Meteor.call 'addVisit', visit, (error, result) ->
					if error
					else
						Router.go '/patients/' + pid + '/visits/' + result
		else
			alert "Visit Date or Chief Complaint cannot be blank!"
		false
