mongoose = require("mongoose")

db = require('../lib/mongodb-store')
db.init()

playlist = require("./../../../../Desktop/xfr/models/playlist")
profile = require("./../../../../Desktop/xfr/models/profile")

module.exports =

  _schema: null

  _schemaDefinition:

    _id: String
    Interviewer: [profile]
    Interviewee: [profile]
    Playlists: [playlist]
    Title: String
    Subject: String
    Image1: String
    Summary: String
    Content: String
    UrlKey: String
    Featured: Boolean
    PublishDate: Date
    CreatedAt: Date

  schema: ->
    module.exports._schema = new mongoose.Schema(module.exports._schemaDefinition) unless module.exports._schema
    module.exports._schema

  _model: null

  model: (new_instance) ->
    unless module.exports._model
      schema = module.exports.schema()
      mongoose.model "FullInterview", schema, "FullInterview"
      module.exports._model = mongoose.model("FullInterview")

    (if new_instance then new module.exports._model() else module.exports._model)