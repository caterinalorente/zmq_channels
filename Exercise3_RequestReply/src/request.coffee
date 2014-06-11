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

  printReply: () ->
    requestSocket.on 'message', (reply) ->
      console.log ("Received reply #{reply} \n")
      reply.toString()

module.exports = RequestChannel