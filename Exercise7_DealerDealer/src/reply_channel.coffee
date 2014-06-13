zmq = require 'zmq'
identity = 'reply-' + process.pid
replySocket = zmq.socket 'dealer'

class ReplyChannel

  constructor: (@protocol, @ip, @port, @content) ->

    # Socket connection
    replySocket.bind "#{@protocol}://#{@ip}:#{@port}"
    console.log "ReplyChannel binded to #{@protocol}://#{@ip}:#{@port}"

    # Wait for request. When it arrives
    # construct JSON reply and send it through socket
    replySocket.on 'message', (message) =>
      request = JSON.parse message
      console.log "Request from #{request.id} #{request.message}"

      reply =
        id:identity
        message:@content

      replySocket.send JSON.stringify reply

module.exports = ReplyChannel