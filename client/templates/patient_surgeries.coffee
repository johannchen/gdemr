Template.patientSurgeries.created = ->
	@isEditingSurgery = new ReactiveVar(null)
	@selectedSurgery = new ReactiveVar(null)
Template.patientSurgeries.helpers
	surgeries: ->
		Patients.findOne(Session.get('pid')).surgeries
	selectedSurgery: ->
		Template.instance().selectedSurgery.get()
	isEditingSurgery: ->
		Template.instance().isEditingSurgery.get()

Template.patientSurgeries.events
	'click .surgery': (event, template) ->
		template.selectedSurgery.set @
	'click #editSurgery': (event, template) ->
		template.isEditingSurgery.set true
	'click #newSurgery': (event, template) ->
		template.isEditingSurgery.set true
		template.selectedSurgery.set {}
	'click #saveSurgery': (event, template) ->
		oldSurgery = template.selectedSurgery.get()
		newSurgery =
			surgery: $('#surgery').val()
			date: $('#date').val()
			details: $('#details').val()
			updatedBy: Meteor.userId()
			updatedAt: new Date()
		if $.isEmptyObject(oldSurgery)
			newSurgery.createdBy = Meteor.userId()
			newSurgery.createdAt = new Date()
			Meteor.call('addSurgery', Session.get('pid'), newSurgery)
		else
			newSurgery.createdBy = oldSurgery.createdBy
			newSurgery.createdAt = oldSurgery.createdAt
			Meteor.call('updateSurgery', Session.get('pid'), oldSurgery, newSurgery)
		template.selectedSurgery.set newSurgery
		template.isEditingSurgery.set false
		false
