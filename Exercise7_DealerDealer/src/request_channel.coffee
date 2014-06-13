zmq = require 'zmq'
identity = "request-" + process.pid
requestSocket = zmq.socket 'dealer'

class RequestChannel
  constructor: (@protocol, @ip, @port) ->
    # Socket connection
    requestSocket.connect "#{@protocol}://#{@ip}:#{@port}"
    console.log "RequestChannel connected to #{@protocol}://#{@ip}:#{@port}"
    console.log ""

  waitForReply: (callback) ->
    requestSocket.on 'message', (message) ->
      reply = JSON.parse message
      callback(reply)

  sendRequest: (content) ->
    request =
      id:identity
      message:content
    
    requestSocket.send JSON.stringify request

module.exports = RequestChannel