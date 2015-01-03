Session.setDefault 'currentLink', 'summary'

UI.registerHelper 'isSummaryLink', (link) ->
	"active" if link is "summary"
UI.registerHelper 'isVisitLink', (link) ->
	"active" if link is "visit"
UI.registerHelper 'isMedicationLink', (link) ->
	"active" if link is "medication"
UI.registerHelper 'isProfileLink', (link) ->
	"active" if link is "profile"

Template.patientNav.helpers
	patient: ->
		Patients.findOne(Session.get('pid')) if Session.get 'pid'
	currentLink: ->
		Session.get 'currentLink'

Template.patientNav.events
	'click #summary': ->
		Session.set 'currentLink', 'summary'
	'click #visits': ->
		Session.set 'currentLink', 'visit'
	'click #medications': ->
		Session.set 'currentLink', 'medication'
	'click #profile': ->
		Session.set 'currentLink', 'profile'
