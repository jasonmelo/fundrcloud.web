#= require ./libs/jquery-1.7.1.min
#= require ./libs/handlebars
#= require ./libs/plugins
#= require ./libs/underscore
#= require ./libs/backbone
#= require ./libs/moment.min
#= require ./namespace
#= require ./app.js
#= require ./widgets/interview-more
#= require ./widgets/playlist-more

$ ->
  new citi.MoreInterviewsView()
  new citi.MorePlaylistsView()
  @