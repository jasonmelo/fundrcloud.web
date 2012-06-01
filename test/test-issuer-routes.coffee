should = require("should")
issuer = require("../routes/issuer")

request = {}
response =
  viewName: ""
  data: {}
  render: (view, viewData) ->
    @viewName = view
    @data = viewData

describe "Routing", ->
  describe "Issuer Route", ->
    it "should provide the a title and the index view name", ->
      issuer.index request, response
      response.viewName.should.equal "issuer"