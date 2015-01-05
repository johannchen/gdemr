Router.configure
	layoutTemplate: 'layout'

Router.route '/', ->
	@render 'home'

Router.route '/patients', ->
	@render 'patients'

Router.route '/patients/new', ->
	@render 'patientProfileForm',
		data:
			patient:
				profile: {}

Router.route '/patients/:_id', ->
	@render 'patient',
		data:
			patient: Patients.findOne(@params._id)

Router.route '/patients/:_id/profile', ->
	@render 'patientProfile',
		data:
			pid: @params._id
			patient: Patients.findOne(@params._id)

Router.route '/patients/:_id/profile/edit', ->
	@render 'patientProfileForm',
		data:
			pid: @params._id
			patient: Patients.findOne(@params._id)

Router.route '/patients/:_id/visits', ->
	@render 'patientVisits',
		data:
			pid: @params._id
			visits: Visits.find({patientId: @params._id}, sort: {visitDate: -1})

Router.route '/patients/:_id/visits/new', ->
	@render 'patientVisitForm',
		data:
			pid: @params._id
			visit: {}

Router.route '/patients/:_id/visits/:vid', ->
	@render 'patientVisit',
		data:
			pid: @params._id
			vid: @params.vid
			visit: Visits.findOne(@params.vid)

Router.route '/patients/:_id/visits/:vid/edit', ->
	@render 'patientVisitForm',
		data:
			pid: @params._id
			vid: @params.vid
			visit: Visits.findOne(@params.vid)

Router.route '/patients/:_id/medications', ->
	@render 'patientMedications',
		data:
			pid: @params._id

Router.route '/patients/:_id/allergies', ->
	@render 'patientAllergies',
		data:
			pid: @params._id

###
Router.route '/profile', ->
	@render 'profile'
	return

Router.route '/profile/edit', ->
	@render 'profile_edit'
	return


Router.route '/admin/accounts',
	template: 'accountsAdmin',
	onBeforeAction: ->
		@redirect('/') unless Roles.userIsInRole(Meteor.user(), ['admin'])
		@next()
###
