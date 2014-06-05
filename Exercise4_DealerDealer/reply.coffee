zmq = require 'zmq'

identity = 'reply-' + process.pid

replySocket = zmq.socket 'dealer'
replySocket.identity = identity
replySocket.bind 'tcp://127.0.0.1:3000'
console.log 'ReplyChannel binded to tcp://127.0.0.1:3000'

reply =
  id:identity
  message:"and I feel fine"

setInterval () ->
  replySocket.send JSON.stringify reply
  null
, 1000

replySocket.on 'message', (msg) ->
  request = JSON.parse msg
  console.log "Request from #{request.id} #{request.message}"