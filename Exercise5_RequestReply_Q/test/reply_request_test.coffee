# Import
Q = require 'q'
RequestChannel = require '../src/request_channel'
ReplyChannel = require '../src/reply_channel'

describe 'Request Reply test with promises', ->
  # Variables to be used MUST be declared at the
  # beginning to avoid scope issues
  hashMap = {}
  requestChannel = null
  replyChannel = null
  MOCK_MESSAGE = null
    
  before ->
    # The server promises reply channel a reply that is
    # sent inside reply channel's constructor as a function
    handleRequest = (msg) ->
      deferred = Q.defer()
      console.log "Server received #{msg} \n"

      # Simulate asynchronous behaviour by setting a timeout
      # before resolving the promise
      setTimeout () ->
        deferred.resolve "and I feel fine"
      , 1000

      deferred.promise

    requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000', hashMap)
    replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000', handleRequest)
    
    MOCK_MESSAGE = "It's the end of the world as we know it"

  it 'should send a rquest and receive a reply correctly', (done) ->
    # Call sendRequest method of the RequestChannel instance every N seconds
    # The channel will return a promise [object] of a reply
    # If the promise is resolved it will be printed
    # If the promise is NOT resolved the error will be catched and printed
    requestChannel.sendRequest MOCK_MESSAGE
    .then (reply) ->
      console.log "Client received #{reply} \n"
      done()
    .fail (error) ->
      console.error error
      done()