namespace 'ft', (exports) ->

  class ft.ModelerRouter extends Backbone.Router

    routes:
      "":                   "modeler"
      "modeler":            "modeler"
      "modeler/:id":        "showModel"
      "modeler/:id/:page":  "showModel"

    initialize: ->
      @bbEvent = _.extend({}, Backbone.Events)
      @viewLoader = new ft.ViewLoader()

      if not Backbone.history.start {pushState: true}
        @navigate("buyer", true)

    buyer: ->
      view = new ln.BuyerView()
      $("#buyer-content").html view.render().el

    showDeal: (id, page) ->
      dealView = new ln.BuyerDealView
        el: "#deal-view"
        bbEvent: @bbEvent
        viewLoader: @viewLoader
      dealView.showPage(id, page)

