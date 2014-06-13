zmq = require 'zmq'
requestSocket = zmq.socket 'req'

class RequestChannel

  # This constructor requires a callback as a parameter because
  # mocha test will expect done() when a reply has been received.
  # When being called in the usual flow it will receive an empty function.
  constructor: (@protocol, @ip, @port, @callback) ->

    # Socket connection
    requestSocket.connect "#{@protocol}://#{@ip}:#{@port}"
    console.log "RequestChannel connected to #{@protocol}://#{@ip}:#{@port}"
    console.log ""
    
    # Wait for reply. When it arrives
    # pass it to the callback
    requestSocket.on 'message', (reply) ->
      callback(reply.toString())

  # Send provided request through socket
  sendRequest: (request) ->
    requestSocket.send request
    console.log "Requesting #{request}"

module.exports = RequestChannel