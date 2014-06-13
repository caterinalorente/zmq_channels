zmq = require 'zmq'
identity = "request-" + process.pid
requestSocket = zmq.socket 'dealer'

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
    requestSocket.on 'message', (message) =>
      reply = JSON.parse message
      @callback(reply)

  # Construct JSON request and
  # send it through socket
  sendRequest: (content) ->
    request =
      id:identity
      message:content
    
    requestSocket.send JSON.stringify request

module.exports = RequestChannel