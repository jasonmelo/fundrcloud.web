
exports.index = (req, res) ->
  res.render 'root/index'
    title: 'Home'
    req: req


exports.template = (req, res) ->
  res.render 'root/template'
    title: 'Home'
    req: req