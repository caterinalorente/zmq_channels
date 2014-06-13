# REPLY CHANNEL

zmq = require 'zmq'
replySocket = zmq.socket 'dealer'

class ReplyChannel
  constructor: (@protocol, @ip, @port, @handleRequest) ->
    replySocket.bind "#{@protocol}://#{@ip}:#{@port}"
    console.log "ReplyChannel binded to #{@protocol}://#{@ip}:#{@port} \n"

# replySocket listens for requests from RequestChannel
# When a request is received,
# - header is removed
# - content is passed to server who promises a reply

    replySocket.on 'message', (request) ->
      request = JSON.parse request

# When the promise is solved, ReplyChannel adds header
# to the reply and sends it back to RequestChannel

      handleRequest request.message
      .then (msg) ->

        reply =
          header:request.header
          message:msg

        console.log "Replying to #{reply.header} -- #{reply.message} \n"

        replySocket.send JSON.stringify reply
        # To be uncomented depending if there is
        # only one or several petitions
        # replySocket.close()

module.exports = ReplyChannel