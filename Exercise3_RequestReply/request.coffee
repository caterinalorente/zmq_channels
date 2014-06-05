zmq = require 'zmq'
requestSocket = zmq.socket 'req'
requestSocket.connect 'tcp://127.0.0.1:3000'
console.log 'Client connected to tcp://127.0.0.1:3000'

setInterval () ->
  message = 'marramamiau'
  requestSocket.send message
  console.log "Sending #{message}"
, 2000

requestSocket.on 'message', (reply) ->
  console.log ("Received #{reply}")