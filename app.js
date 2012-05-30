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

app.get('/modeler', modeler.index);

app.all('/',        root.index);
app.all('/template',root.template);

//
// Init MongoDB & Redis
global.SERVER_NAME = 'citiology:jester@ds029317.mongolab.com:29317';
global.DB_NAME = 'citiologyweb';

var mongo = require("./lib/mongodb-store");
mongo.init();

//
// Server Listener
var port = process.env.PORT || 5000;
app.listen(port);
console.log("Express server listening on port %d in %s mode", port, app.settings.env);
