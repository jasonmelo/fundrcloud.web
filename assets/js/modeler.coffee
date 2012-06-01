#= require ./libs/jquery-1.7.1.min
#= require ./libs/handlebars
#= require ./libs/plugins
#= require ./libs/underscore
#= require ./libs/backbone
#= require ./libs/moment.min
#= require ./common/namespace

#= require ./modeler/modeler-appview
#= require ./modeler/modeler-models
#= require ./modeler/modeler-router

$ ->
  new ft.ModelerRouter()
  @