zmq = require 'zmq'
replySocket = zmq.socket 'rep'

# Socket connection
replySocket.bind "tcp://127.0.0.1:3000", (error) ->
  if error
    throw error
  else
    console.log "Server connected to tcp://127.0.0.1:3000"

# Request received
replySocket.on 'message', (received_reply) ->
  console.log "Received request: #{received_reply.toString()}"
  # Be polite and send reply
  reply = 'Woof woof!'
  console.log "Sending #{reply}"
  replySocket.send reply
  null