zmq = require 'zmq'
requestSocket = zmq.socket 'req'

class RequestChannel
  constructor: (@protocol, @ip, @port) ->
    # Socket connection
    requestSocket.connect "#{@protocol}://#{@ip}:#{@port}"
    console.log "RequestChannel connected to #{@protocol}://#{@ip}:#{@port}"
    console.log ""
      
  sendRequest: (request) ->
    requestSocket.send request
    console.log "Requesting #{request}"

  # This method requires a callback as a parameter because
  # mocha test will expect done() when a reply has been received.
  # When being called in the usual flow it will receive an empty function.
  waitForReply: (callback)  =>
    requestSocket.on 'message', (reply) ->
      callback(reply.toString())

module.exports = RequestChannel