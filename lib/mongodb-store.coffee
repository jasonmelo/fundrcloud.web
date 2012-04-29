mongoose = require("mongoose")
module.exports =
  _db: null
  init: ->
    unless module.exports._db
      path = "mongodb://" + global.SERVER_NAME + "/" + global.DB_NAME
      console.log "connecting to MONGO via " + path
      module.exports._db = mongoose.connect(path)
    module.exports._db