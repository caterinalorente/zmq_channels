# Import
zmq = require 'zmq'
replySocket = zmq.socket 'dealer'

class ReplyChannel

  constructor: (@protocol, @ip, @port, @handleRequest) ->

    # Socket connection
    replySocket.bind "#{@protocol}://#{@ip}:#{@port}"
    console.log "ReplyChannel binded to #{@protocol}://#{@ip}:#{@port} \n"

    # replySocket listens for requests from request channel.
    # When the message from request channel is received
    # reply channel informs the server using the function he was passed
    # in the constructor.
    #
    # - header is removed
    # - content is passed to server who promises a reply
    # that this channel will send back to request channel
    #
    # The server will solve the promise some seconds later
    # to simulate async behaviour.
    # reply channel will then adds the header
    # to the reply and sends it back to request channel
    replySocket.on 'message', (request) ->
      request = JSON.parse request

      handleRequest request.message
      .then (msg) ->
        reply =
          header:request.header
          message:msg

        console.log "Replying to #{reply.header} -- #{reply.message} \n"

        replySocket.send JSON.stringify reply

      .fail (error) ->
        console.error error

      .done()

      # To be uncomented depending if there is one or several petitions
      # replySocket.close()

module.exports = ReplyChannel