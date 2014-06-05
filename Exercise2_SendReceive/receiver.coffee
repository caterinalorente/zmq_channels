zmq = require 'zmq'
sock = zmq.socket 'pull'

sock.connect 'tcp://127.0.0.1:3000'
console.log 'Receiver connected to port 3000'

sock.on 'message', (msg) -> console.log('received: %s', msg.toString())