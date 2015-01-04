DateFormats =
  short: "YYYY-MM-DD"
  long: "dddd MM.DD.YYYY HH:mm"
	zh: "L"

UI.registerHelper "formatDate", (datetime, format) ->
  if moment and typeof datetime isnt "undefined"
    f = DateFormats[format]
    moment(datetime).format f
  else
    datetime

UI.registerHelper "userName", (id) ->
	if id
		username = Meteor.users.findOne(id).profile.name
		if username
			username
		else
			Meteor.users.findOne(id).emails[0].address

