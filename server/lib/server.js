(function() {
  var Server, async, express, io, log;

  log = require('./util').log;

  io = require('socket.io');

  express = require('express');

  async = require('async');

  Server = (function() {

    function Server(port) {
      this.port = port;
    }

    Server.start = function(port) {
      return new Server(port).start();
    };

    Server.prototype.start = function() {
      var socket;
      log("Starging on port " + this.port);
      socket = io.listen(this.port);
      return socket.sockets.on('connection', function(client) {
        client.on('start', function(data) {
          log('path started', data);
          return socket.sockets.emit('start', data);
        });
        client.on('move', function(data) {
          log('path moved', data);
          return socket.sockets.emit('move', data);
        });
        client.on('close', function(data) {
          log('path closed', data);
          return socket.sockets.emit('close', data);
        });
        return client.on('clean', function(data) {
          return socket.sockets.emit('clean', data);
        });
      });
    };

    return Server;

  })();

  module.exports = Server;

}).call(this);
