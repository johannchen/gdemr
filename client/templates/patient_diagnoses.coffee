Template.patientDiagnoses.created = ->
	@isEditingDiagnosis = new ReactiveVar(null)
	@selectedDiagnosis = new ReactiveVar(null)
Template.patientDiagnoses.helpers
	diagnoses: ->
		Patients.findOne(Session.get('pid')).diagnoses
	selectedDiagnosis: ->
		Template.instance().selectedDiagnosis.get()
	isEditingDiagnosis: ->
		Template.instance().isEditingDiagnosis.get()

Template.patientDiagnoses.events
	'click .diagnosis': (event, template) ->
		template.selectedDiagnosis.set @
	'click #editDiagnosis': (event, template) ->
		template.isEditingDiagnosis.set true
	'click #newDiagnosis': (event, template) ->
		template.isEditingDiagnosis.set true
		template.selectedDiagnosis.set {}
	'click #saveDiagnosis': (event, template) ->
		oldDiagnosis = template.selectedDiagnosis.get()
		newDiagnosis =
			diagnosis: $('#diagnosis').val()
			date: $('#date').val()
			details: $('#details').val()
			updatedBy: Meteor.userId()
			updatedAt: new Date()
		if $.isEmptyObject(oldDiagnosis)
			newDiagnosis.createdBy = Meteor.userId()
			newDiagnosis.createdAt = new Date()
			Meteor.call('addDiagnosis', Session.get('pid'), newDiagnosis)
		else
			newDiagnosis.createdBy = oldDiagnosis.createdBy
			newDiagnosis.createdAt = oldDiagnosis.createdAt
			Meteor.call('updateDiagnosis', Session.get('pid'), oldDiagnosis, newDiagnosis)
		template.selectedDiagnosis.set newDiagnosis
		template.isEditingDiagnosis.set false
		false
