colors = require 'colors'
debug = require 'debug'
socket_io = require 'socket.io'

app = require './app'
debug = debug 'app'

port = app.get 'port'

server = app.listen port, ->
  debug 'Express server listening on port %s'.magenta, String(server.address().port).green

io = socket_io.listen server

io.sockets.on 'connection', (socket) ->
  debug 'Connected'.blue

  socket.on 'disconnection', (socket) ->
    debug 'Disconnected'.red
