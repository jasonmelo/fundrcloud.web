Response = require("../models/response")
sanitize = require('validator').sanitize

exports.index = (req, res) ->
  datamodel =
    title: "Modeler UI"

  res.render 'modeler/index'
    title: datamodel?.title || 'Modeler'
    dataRes: datamodel
    req: req

