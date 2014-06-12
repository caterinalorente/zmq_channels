zmq = require 'zmq'

identity = "request-" + process.pid

requestSocket = zmq.socket 'dealer'
requestSocket.identity = identity
requestSocket.connect 'tcp://127.0.0.1:3000'
console.log 'RequestChannel connected to tcp://127.0.0.1:3000'

request =
    id:identity
    message:"It's the end of the world as we know it"

setInterval () ->
  requestSocket.send JSON.stringify request
  null
, 1000

requestSocket.on 'message', (msg) ->
  reply = JSON.parse msg
  console.log "Reply from #{reply.id} #{reply.message}"