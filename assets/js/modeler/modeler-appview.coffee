namespace 'ft', (exports) ->

  class ft.ModelerView extends Backbone.View

    initialize: (options) =>
      @eventagr = options.eventagr
      @viewloader = options.viewloader

      @model = new ft.PreformanceModelerModel()

      #@model.on 'change:dealLabel', @renderDealLabel

namespace 'ft', (exports) ->

  class ft.NewModelerView extends Backbone.View

    initialize: (options) =>
      @eventagr = options.eventagr
      @viewloader = options.viewloader

      @model = new ft.PreformanceModelerModel()

      #@model.on 'change:dealLabel', @renderDealLabel