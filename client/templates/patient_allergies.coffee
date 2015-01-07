Template.patientAllergies.created = ->
	@isEditingAllergy = new ReactiveVar(null)
	@selectedAllergy = new ReactiveVar(null)
Template.patientAllergies.helpers
	allergies: ->
		Patients.findOne(Session.get('pid')).allergies
	selectedAllergy: ->
		Template.instance().selectedAllergy.get()
	isEditingAllergy: ->
		Template.instance().isEditingAllergy.get()

Template.patientAllergies.events
	'click .allergy': (event, template) ->
		template.selectedAllergy.set @
	'click #editAllergy': (event, template) ->
		template.isEditingAllergy.set true
	'click #newAllergy': (event, template) ->
		template.isEditingAllergy.set true
		template.selectedAllergy.set {}
	'click #saveAllergy': (event, template) ->
		medication = $('#medication').val()
		if medication
			oldAllergy = template.selectedAllergy.get()
			newAllergy =
				medication: medication
				reaction: $('#reaction').val()
				details: $('#details').val()
				updatedBy: Meteor.userId()
				updatedAt: new Date()
			if $.isEmptyObject(oldAllergy)
				newAllergy.createdBy = Meteor.userId()
				newAllergy.createdAt = new Date()
				Meteor.call('addAllergy', Session.get('pid'), newAllergy)
			else
				newAllergy.createdBy = oldAllergy.createdBy
				newAllergy.createdAt = oldAllergy.createdAt
				Meteor.call('updateAllergy', Session.get('pid'), oldAllergy, newAllergy)
			template.selectedAllergy.set newAllergy
			template.isEditingAllergy.set false
		else
			alert "Medication cannot be blank!"
		false
