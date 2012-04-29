CitiResponse = require("../models/response")
sanitize = require('validator').sanitize

DbProxy = require("../../../../Desktop/xfr/lib/proxies/mongodb-proxy.coffee")
dbProxy = new DbProxy
  encryptedMode: false

exports.featured = (req, res) ->
  interviewRequest =
    Featured: true
  dbProxy.queryInterviews interviewRequest, req, (data, err) ->
    citiResponse = new CitiResponse(data, err)
    res.render 'interview/featured'
      title: 'Interviews'
      metaKeys: 'Citiology,NYC,NY Nightlife,Cityology,NY,Interview,In The Know,Dj Spotlight'
      metaDesc: 'Citiology is a social network for New Yorkers who love to experience the best nightlife. Our diverse network of nightlife mavens are the people to turn to when planning a night out.'
      dataRes: citiResponse
      req: req

exports.index = (req, res) ->
  dbProxy.getInterview req.params.id, req, (data, err) ->
    citiResponse = new CitiResponse(data, err)
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

exports.interviewsByType = (req, res) ->
  featuredBool = false
  featuredBool = true if req.params.type is 'featured'
  interviewRequest =
    Featured: featuredBool
  dbProxy.queryInterviews interviewRequest, req, (data, err) ->
    console.log 'trying response send'
    citiResponse = new CitiResponse(data, err)
    res.send(citiResponse)

exports.getInterview = (req, res) ->
  dbProxy.getInterview req.params.id, req, (data, err) ->
    citiResponse = new CitiResponse(data, err)
    res.send(citiResponse)

