require('coffee-script');

var config = require('./config')
    , express = require('express')
    , app = module.exports = express.createServer();

//
// Express Setup
require("./lib/express-config.coffee")(app, __dirname);

//
// Routes
var root = require("./routes/root")
    , modeler = require("./routes/modeler");

app.get('/modeler', modeler.featured);

app.all('/',        root.index);

//
// Server Listener
var port = process.env.PORT || 7742;
app.listen(port);
console.log("Express server listening on port %d in %s mode", port, app.settings.env);
