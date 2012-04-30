
exports.index = (req, res) ->
  res.render 'root/index'
    title: 'Home'
    req: req