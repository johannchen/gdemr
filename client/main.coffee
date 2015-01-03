#TODO subscribe on route
Meteor.subscribe 'patients'
Meteor.subscribe 'visits'

Session.setDefault 'pid', null
