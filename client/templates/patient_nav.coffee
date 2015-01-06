Session.setDefault 'currentLink', 'summary'

UI.registerHelper 'isSummaryLink', (link) ->
	"active" if link is "summary"
UI.registerHelper 'isVisitLink', (link) ->
	"active" if link is "visit"
UI.registerHelper 'isProfileLink', (link) ->
	"active" if link is "profile"

Template.patientNav.helpers
	_id: ->
		Session.get 'pid'
	name: ->
		Patients.findOne(Session.get('pid')).name if Session.get 'pid'
	profile: ->
		Patients.findOne(Session.get('pid')).profile if Session.get 'pid'
	currentLink: ->
		Session.get 'currentLink'

Template.patientNav.events
	'click #summary': ->
		Session.set 'currentLink', 'summary'
	'click #visits': ->
		Session.set 'currentLink', 'visit'
	'click #profile': ->
		Session.set 'currentLink', 'profile'
