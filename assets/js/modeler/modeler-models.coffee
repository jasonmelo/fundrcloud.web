namespace 'ft', (exports) ->

  class ft.PreformanceModelerModel extends Backbone.Model
    urlRoot: '/api/modeler'
    idAttribute: '_id'