Response = require("../models/response")
sanitize = require('validator').sanitize

#DbProxy = require("../lib/proxies/mongodb-proxy.coffee")
#dbProxy = new DbProxy
#  encryptedMode: false

exports.index = (req, res) ->
  dbProxy.getInterview req.params.id, req, (data, err) ->
    response = new Response(data, err)
    if data isnt null
      keys = data?.Title + ',' + data?.Interviewee[0]?.DisplayName
      summary = sanitize(data?.Summary)
        .xss(true)
        .replace(/<(?:.|\n)*?>/gm, '')
    res.render 'interview/index'
      title: data?.Title || 'Interview'
      metaKeys: keys || ''
      metaDesc: summary || ''
      dataRes: citiResponse
      req: req

exports.getInterview = (req, res) ->
  dbProxy.getInterview req.params.id, req, (data, err) ->
    citiResponse = new CitiResponse(data, err)
    res.send(citiResponse)

