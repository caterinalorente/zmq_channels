zmq = require 'zmq'
identity = 'reply-' + process.pid
replySocket = zmq.socket 'dealer'

class ReplyChannel
  constructor: (@protocol, @ip, @port) ->
    # Socket connection
    replySocket.bind "#{@protocol}://#{@ip}:#{@port}"
    console.log "ReplyChannel binded to #{@protocol}://#{@ip}:#{@port}"

  waitForRequest: () ->
    replySocket.on 'message', (message) ->
      request = JSON.parse message
      console.log "Request from #{request.id} #{request.message}"

  sendReply: (content) ->
    reply =
      id:identity
      message:content

    replySocket.send JSON.stringify reply

module.exports = ReplyChannel