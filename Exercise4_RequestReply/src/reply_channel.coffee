zmq = require 'zmq'
replySocket = zmq.socket 'rep'

class ReplyChannel

  constructor: (@protocol, @ip, @port) ->

    # Socket connection
    replySocket.bind "#{@protocol}://#{@ip}:#{@port}"
    console.log "ReplyChannel connected to #{@protocol}://#{@ip}:#{@port}"

    # Request received
    replySocket.on 'message', (received_request) ->
      # console.log "Received request: #{received_request.toString()}"
      # Be polite and send reply
      reply = 'Woof woof!'
      replySocket.send reply

module.exports = ReplyChannel