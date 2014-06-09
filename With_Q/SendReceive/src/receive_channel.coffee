zmq = require 'zmq'
socket = zmq.socket 'pull'

{EventEmitter} = require 'events'

class ReceiveChannel extends EventEmitter
  constructor: (@protocol, @ip, @port) ->
    socket.connect "#{@protocol}://#{@ip}:#{@port}"
    console.log "Receiver connected to #{@protocol}://#{@ip}:#{@port}"

    socket.on 'message', (msg) =>
      receivedData = JSON.parse msg

      console.log "Emitting #{receivedData.content}"
      @emit 'messageReceived', receivedData.content

module.exports = ReceiveChannel