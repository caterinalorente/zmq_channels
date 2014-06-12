zmq = require 'zmq'
socket = zmq.socket 'push'

class SendChannel
  constructor: (@protocol, @ip, @port)->
    socket.bind "#{@protocol}://#{@ip}:#{@port}"
    console.log "Emitter bound to #{@protocol}://#{@ip}:#{@port}"

  send: (message) ->
  # zmq supports string and byte[] data, not objects.
  # Therefore the message has to be stringified
    jsonMessage = content : message
    stringifiedMessage = JSON.stringify jsonMessage

    console.log "Sending: #{stringifiedMessage}"
    socket.send stringifiedMessage

module.exports = SendChannel