config = require('../config.coffee')
express = require('express')

module.exports = (app, rootDir) ->
  app.configure ->
    publicDir = "#{rootDir}/public"
    viewsDir  = "#{rootDir}/views"

    app.set "views", viewsDir
    app.set "view engine", "jade"
    app.set "view options",
      layout: false

    app.use express.logger()
    app.use require('connect-assets')
      buildDir: publicDir
    app.use express.static(publicDir)
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.session
      secret: "998dsfN98fdndf89snsdfnfsdsdf98sdf89hSFDh8sdfSADG68gSDR"

    app.use app.router

    app.use (err, req, res, next) ->
      console.log err
      console.log err.stack
      if req.accepts("html")
        res.status err.status or 500
        if err and err.toString() is 'Error: Unauthorized'
          res.redirect('/login')
        else
          res.render "500",
            title: "Error"
            metaKeys: ""
            metaDesc: ""
            req: req
            status: err.status or 500
            error: err
        return
      if req.accepts("json")
        res.send
          error: err
        return
      res.type("txt").send err
    app.use (req, res, next) ->
      if req.accepts("html")
        res.status 404
        res.render "404",
          title: "Not Found"
          metaKeys: ""
          metaDesc: ""
          url: req.url
        return
      if req.accepts("json")
        res.send
          error: "Not found"
        return
      res.type("txt").send "Not found"

  app.configure "development", ->
    app.use express.errorHandler(
      dumpExceptions: true
      showStack: true
    )
  app.configure "production", ->
    app.use express.errorHandler()
