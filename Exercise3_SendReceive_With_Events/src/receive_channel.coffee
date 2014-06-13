# Import
zmq = require 'zmq'
socket = zmq.socket 'pull'

{EventEmitter} = require 'events'

class ReceiveChannel extends EventEmitter

  constructor: (@protocol, @ip, @port) ->

    # Socket connection
    socket.connect "#{@protocol}://#{@ip}:#{@port}"
    console.log "Receiver connected to #{@protocol}://#{@ip}:#{@port}"

    # Wait for message. When it arrives emit it
    # so that in can be catched by the correspondent listener
    socket.on 'message', (msg) =>
      receivedData = JSON.parse msg

      console.log "Emitting #{receivedData.content}"
      @emit 'messageReceived', receivedData.content

module.exports = ReceiveChannel