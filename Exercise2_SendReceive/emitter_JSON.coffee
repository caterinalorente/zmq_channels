zmq = require 'zmq'
sock = zmq.socket 'push'
interval = 5000

# zmq supports string and byte[] data, not objects.
# Therefore the message has to be stringified
JSON_message = content:'I hope you have a nice day'
stringified_message = JSON.stringify(JSON_message)

sock.bindSync 'tcp://127.0.0.1:3000'
console.log 'Emitter bound to port 3000'

setInterval () ->
  console.log 'Sending message'
  sock.send stringified_message
, interval