bluebird = require 'bluebird'
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
    handleRequest = (msg) ->
      deferred = bluebird.defer()
      console.log "Server received #{msg} \n"

      setTimeout () -> # Simulate asynchronous behaviour
        deferred.resolve "and I feel fine"
      , 1000

      deferred.promise

    requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000', hashMap)
    replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000', handleRequest)
    MOCK_MESSAGE = "It's the end of the world as we know it"

  it 'should send a rquest and receive a reply correctly', (done) ->
    requestChannel.sendRequest MOCK_MESSAGE
    .then (reply) ->
      console.log "Client received #{reply} \n"
      done()
    .catch (error) ->
      console.error error
      done()