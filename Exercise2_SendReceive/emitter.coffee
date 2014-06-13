# Import
zmq = require 'zmq'
sock = zmq.socket 'push'

# Socket connection
sock.bindSync 'tcp://127.0.0.1:3000'
console.log 'emitter bound to port 3000'

# Send message every 2 seconds
setInterval () ->
  console.log 'Sending message'
  sock.send 'Good day to you!'
, 2000