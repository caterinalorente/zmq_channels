zmq = require 'zmq'
identity = "request-" + process.pid
requestSocket = zmq.socket 'dealer'
requestSocket.identity = identity

class RequestChannel
  constructor: (@protocol, @ip, @port) ->
    requestSocket.connect "#{@protocol}://#{@ip}:#{@port}"
    console.log "RequestChannel connected to #{@protocol}://#{@ip}:#{@port}"

  sendRequest: (content) ->
    request =
        id:identity
        message:content
          
    requestSocket.send JSON.stringify request

  waitForReply: () =>
    requestSocket.on 'message', (msg) ->
      reply = JSON.parse msg
      console.log "Reply from #{reply.id} #{reply.message}"

module.exports = RequestChannel