Template.patientVisitForm.events
	'click button.save': ->
		pid = $('#pid').val()
		vid = $('#vid').val()
		data =
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
			patientId: pid

		if (vid)
			#update visit
			Visits.update vid,
				$set: data
		else
			#insert visit
			vid = Visits.insert data
			
		Router.go '/patients/' + pid + '/visits/' + vid
