#= require ./libs/jquery-1.7.1.min
#= require ./libs/bootstrap
#= require ./libs/handlebars
#= require ./libs/plugins
#= require ./libs/underscore
#= require ./libs/backbone
#= require ./libs/moment.min
#= require ./libs/d3.v2.min

#= require ./common/namespace

#= require ./common/ft.notification-view
#= require ./common/ui-interactions
#= require ./common/view-loader

#= require ./modeler/modeler-appview
#= require ./modeler/modeler-models
#= require ./modeler/modeler-router

$ ->
  new ft.ModelerRouter()

  data = d3.range(40).map((i) ->
    x: i / 39
    y: (Math.sin(i / 3) + 2) / 4
  )

  margin =
    top: 10
    right: 10
    bottom: 20
    left: 40

  width = 760 - margin.left - margin.right
  height = 400 - margin.top - margin.bottom
  x = d3.scale.linear().domain([ 0, 1 ]).range([ 0, width ])
  y = d3.scale.linear().domain([ 0, 1 ]).range([ height, 0 ])
  xAxis = d3.svg.axis().scale(x).orient("bottom")
  yAxis = d3.svg.axis().scale(y).orient("left")

  line = d3.svg.line().x((d) ->
    x d.x
  ).y((d) ->
    y d.y
  )

  area = d3.svg.area().x(line.x()).y1(line.y()).y0(y(0))

  svg = d3.select("#modeler-chart-main")
    .append("svg")
    .datum(data)
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

  svg.append("path").attr("class", "area").attr "d", area
  svg.append("g").attr("class", "x axis").attr("transform", "translate(0," + height + ")").call xAxis
  svg.append("g").attr("class", "y axis").call yAxis
  svg.append("path").attr("class", "line").attr "d", line
  svg.selectAll(".dot").data(data.filter((d) ->
    d.y
  )).enter().append("circle").attr("class", "dot").attr("cx", line.x()).attr("cy", line.y()).attr "r", 3.5

  @