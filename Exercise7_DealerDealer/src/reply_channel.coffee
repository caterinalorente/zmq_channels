zmq = require 'zmq'
identity = 'reply-' + process.pid
replySocket = zmq.socket 'dealer'
replySocket.identity = identity

class ReplyChannel
  constructor: (@protocol, @ip, @port) ->
    replySocket.bind "#{@protocol}://#{@ip}:#{@port}"
    console.log "ReplyChannel binded to #{@protocol}://#{@ip}:#{@port}"
  
  sendReply: (content) ->
    reply =
      id:identity
      message:content

    replySocket.send JSON.stringify reply

    # replySocket.on 'message', (msg) ->
    #   request = JSON.parse msg
    #   console.log "Request from #{request.id} #{request.message}"

module.exports = ReplyChannel