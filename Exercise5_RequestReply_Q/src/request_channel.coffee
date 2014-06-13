# Import
Q = require 'q'
zmq = require 'zmq'
requestSocket = zmq.socket 'dealer'

class RequestChannel
  
  constructor: (@protocol, @ip, @port, @hashMap) ->

    # Socket connection
    requestSocket.connect "#{@protocol}://#{@ip}:#{@port}"
    console.log "RequestChannel connected to #{@protocol}://#{@ip}:#{@port} \n"

    # requestSocket listens for replies from reply channel
    # When a reply is received the promise is resolved
    # - header is added
    # - content is passed as a resolved promise to the client
    requestSocket.on 'message', (msg) =>
      reply = JSON.parse msg
      header = reply.header
      message = reply.message
      
      # To be uncomented depending if there is one or several petitions
      # requestSocket.close()
      
      @hashMap[header].resolve message

  # sendRequest method
  # - promises the client to provide him with the reply when received
  # - sends a request = header + content
  # - binds request id with promise to be accessed later
  sendRequest: (msg) ->
    deferred = Q.defer()

    randomId = Math.floor((Math.random() * 100) + 1)

    request =
        header:randomId
        message:msg

    requestSocket.send JSON.stringify request
    console.log "Requesting from #{request.header} -- #{request.message} \n"

    @hashMap[randomId] = deferred

    deferred.promise

module.exports = RequestChannel