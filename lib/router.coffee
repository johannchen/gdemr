Router.configure
	layoutTemplate: 'layout'

Router.route '/', ->
	@render 'home'

Router.route '/patients', ->
	@render 'patients'

Router.route '/patients/new', ->
	@render 'patientProfileForm',
		data:
			profile: {}

Router.route '/patients/:_id', ->
	@render 'patient',
		data:
			patient: Patients.findOne(@params._id)

Router.route '/patients/:_id/profile', ->
	@render 'patientProfile',
		data:
			pid: @params._id
			profile: Patients.findOne(@params._id).profile

Router.route '/patients/:_id/profile/edit', ->
	@render 'patientProfileForm',
		data:
			pid: @params._id
			profile: Patients.findOne(@params._id).profile

Router.route '/patients/:_id/visits', ->
	@render 'patientVisits',
		data:
			pid: @params._id
			profile: Patients.findOne(@params._id).profile
			visits: Visits.find({patientId: @params._id}, sort: {visitDate: -1})

Router.route '/patients/:_id/visits/new', ->
	@render 'patientVisitForm',
		data:
			pid: @params._id
			profile: Patients.findOne(@params._id).profile
			visit: {}

Router.route '/patients/:_id/visits/:vid', ->
	@render 'patientVisit',
		data:
			pid: @params._id
			vid: @params.vid
			profile: Patients.findOne(@params._id).profile
			visit: Visits.findOne(@params.vid)

Router.route '/patients/:_id/visits/:vid/edit', ->
	@render 'patientVisitForm',
		data:
			pid: @params._id
			vid: @params.vid
			profile: Patients.findOne(@params._id).profile
			visit: Visits.findOne(@params.vid)


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
