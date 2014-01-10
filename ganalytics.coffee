GAnalytics =
  load: (i, s, o, g, r, a, m) ->
    i["GoogleAnalyticsObject"] = r
    i[r] = i[r] or ->
      (i[r].q = i[r].q or []).push arguments_
    i[r].l = 1 * new Date()
    a = s.createElement(o)
    m = s.getElementsByTagName(o)[0]
    a.async = 1
    a.src = g
    m.parentNode.insertBefore a, m

@GAnalytics = GAnalytics

if Meteor.settings and Meteor.settings.public and Meteor.settings.public.ganalytics and Meteor.settings.public.ganalytics.key
  GAnalytics.load(window, document, 'script', '//www.google-analytics.com/analytics.js','ga')
  ga('create', Meteor.settings.public.ganalytics.key, 'auto')
else
  console.log 'Ganalytics missing in public settings'