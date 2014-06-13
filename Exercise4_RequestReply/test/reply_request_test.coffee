# Import
RequestChannel = require '../src/request_channel'
ReplyChannel = require '../src/reply_channel'

describe 'Request Reply test', ->

  # Variables to be used MUST be declared at the
  # beginning to avoid scope issues
  MOCK_REQUEST = "Marramamiau"
  MOCK_REPLY = "Woof woof!"

  before ->
    replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000')

  it 'should send a request and receive a reply correctly', (done) ->
    requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000', (reply) ->
      console.log "Received reply #{reply} \n"
      reply.should.be.eql MOCK_REPLY
      done())
    
    requestChannel.sendRequest(MOCK_REQUEST)