require('coffee-script');

var config = require('./../../Citiology/Citiology.Node.Web/config')
    , express = require('express')
    , app = module.exports = express.createServer();

//
// Express Setup
require("./../../Citiology/Citiology.Node.Web/lib/express-config.coffee")(app, __dirname);

//
// Routes
var root = require("./../../Citiology/Citiology.Node.Web/routes/root")
    , permissionFilter = require("./../../Citiology/Citiology.Node.Web/services/jm.permissions.coffee")
    , interview = require("./../../Citiology/Citiology.Node.Web/routes/interview")
    , playlist = require("./../../Citiology/Citiology.Node.Web/routes/playlist")
    , venue = require("./../../Citiology/Citiology.Node.Web/routes/venue")
    , user = require("./../../Citiology/Citiology.Node.Web/routes/user")
    , intheloop = require("./../../Citiology/Citiology.Node.Web/routes/intheloop");

app.get('/interview',               permissionFilter.restrictToPermission('INTERVIEW_VIEW'),    interview.featured);
app.get('/interview/:id',           permissionFilter.restrictToPermission('INTERVIEW_VIEW'),    interview.index);

app.get('/api/interview/type/:type',permissionFilter.restrictToPermission('INTERVIEW_VIEW'),    interview.interviewsByType);
app.get('/api/interview/:id',       permissionFilter.restrictToPermission('INTERVIEW_VIEW'),    interview.getInterview);

app.get('/playlist',                permissionFilter.restrictToPermission('PLAYLIST_VIEW'),     playlist.recent);
app.get('/playlist/:id',            permissionFilter.restrictToPermission('PLAYLIST_VIEW'),     playlist.index);

app.get('/api/playlist/type/:type', permissionFilter.restrictToPermission('PLAYLIST_VIEW'),     playlist.playlistsByType);
app.get('/api/playlist/venue/:id',  permissionFilter.restrictToPermission('PLAYLIST_VIEW'),     playlist.playlistsByVenue);
app.get('/api/playlist/:id',        permissionFilter.restrictToPermission('PLAYLIST_VIEW'),     playlist.getPlaylist);

app.get('/venue/:id',               permissionFilter.restrictToPermission('VENUE_VIEW'),        venue.index);
app.get('/api/venue/:id',           permissionFilter.restrictToPermission('VENUE_VIEW'),        venue.getVenue);

app.get('/api/user/:id',            permissionFilter.restrictToPermission('USER_VIEW'),         user.getUser);

app.get('/intheloop',               permissionFilter.restrictToPermission('VENUE_VIEW'),        intheloop.index);

app.all('/',                        permissionFilter.restrictToPermission('ALL_VIEW'),          interview.featured);

//
// Server Listener
var port = process.env.PORT || 7742;
app.listen(port);
console.log("Express server listening on port %d in %s mode", port, app.settings.env);
