namespace 'ft', (exports) ->

  class ft.ModelerRouter extends Backbone.Router

    routes:
      "":                   "modeler"
      "modeler":            "modeler"
      "modeler/:id":        "showModeler"
      "modeler/:id/:page":  "showModeler"

    initialize: ->
      @eventagr = _.extend({}, Backbone.Events)
      @viewloader = new ft.ViewLoader()
      Backbone.history.start {pushState: true}

    modeler: ->
      new ft.NewModelerView
        el: "#modeler-view"
        eventagr: @eventagr
        viewloader: @viewloader

    showModeler: (id, page) ->
      new ft.ModelerView
        el: "#modeler-view"
        eventagr: @eventagr
        viewloader: @viewloader

