Template.patientBehaviors.created = ->
	@isEditingBehavior = new ReactiveVar(null)
	@selectedBehavior = new ReactiveVar(null)
Template.patientBehaviors.helpers
	behaviors: ->
		Patients.findOne(Session.get('pid')).behaviors
	selectedBehavior: ->
		Template.instance().selectedBehavior.get()
	isEditingBehavior: ->
		Template.instance().isEditingBehavior.get()

Template.patientBehaviors.events
	'click .behavior': (event, template) ->
		template.selectedBehavior.set @
	'click #editBehavior': (event, template) ->
		template.isEditingBehavior.set true
	'click #newBehavior': (event, template) ->
		template.isEditingBehavior.set true
		template.selectedBehavior.set {}
	'click #saveBehavior': (event, template) ->
		behavior = $('#behavior').val()
		if behavior
			oldBehavior = template.selectedBehavior.get()
			newBehavior =
				behavior: behavior
				details: $('#details').val()
				updatedBy: Meteor.userId()
				updatedAt: new Date()
			if $.isEmptyObject(oldBehavior)
				newBehavior.createdBy = Meteor.userId()
				newBehavior.createdAt = new Date()
				Meteor.call('addBehavior', Session.get('pid'), newBehavior)
			else
				newBehavior.createdBy = oldBehavior.createdBy
				newBehavior.createdAt = oldBehavior.createdAt
				Meteor.call('updateBehavior', Session.get('pid'), oldBehavior, newBehavior)
			template.selectedBehavior.set newBehavior
			template.isEditingBehavior.set false
		else
			alert "Behavior cannot be blank!"
		false
