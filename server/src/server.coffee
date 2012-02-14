{log}     = require('./util')
io        = require('socket.io')
express   = require('express')
async     = require('async')

class Server
  # Lifecycle
  # ---------------------------------------------------------------------------
  
  constructor: (port) ->
    @port = port
  
  @start: (port) ->
    new Server(port).start()
  
  start: () ->
    log "Starging on port #{@port}"

    socket = io.listen(@port)
    socket.sockets.on 'connection', (client) ->
      client.on 'start', (data) ->
        log 'path started', data
        socket.sockets.emit 'start', data
      client.on 'move', (data) ->
        log 'path moved', data
        socket.sockets.emit 'move', data
      client.on 'close', (data) ->
        log 'path closed', data
        socket.sockets.emit 'close', data
      client.on 'clean', (data) ->
        socket.sockets.emit 'clean', data

  
  # Sending socket messages
  # ---------------------------------------------------------------------------
  

    # client.emit(type, data)


module.exports = Server