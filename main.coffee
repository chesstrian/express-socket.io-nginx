colors = require 'colors'
debug = require 'debug'
socket_io = require 'socket.io'

app = require './app'
debug = debug 'app'

port = app.get 'port'

server = app.listen port, ->
  debug 'Express server listening on port %s'.magenta, String(server.address().port).green

sockets =  socket_io transports: ['websocket', 'flashsocket','htmlfile','xhr-polling','jsonp-polling']

io = sockets.listen server,
  resource: '/socket.io/'
  'sync disconnect on unload': true

io.sockets.on 'connection', (socket) ->
  debug 'Connected'.blue

io.sockets.on 'disconnection', (socket) ->
  debug 'Disconnected'.red
