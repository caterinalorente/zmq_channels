RequestChannel = require '../src/request_channel'
ReplyChannel = require '../src/reply_channel'

describe 'Request Reply test', ->
  # Variables to be used MUST be declared at the
  # beginning to avoid scope issues
  requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000')
  replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000')
  MOCK_REQUEST = "Marramamiau"
  MOCK_REPLY = "Woof woof!"

  it 'should send a request and receive a reply correctly', (done) ->
    requestChannel.sendRequest(MOCK_REQUEST)

    requestChannel.waitForReply((reply) ->
      console.log "Received reply #{reply} \n"
      reply.should.be.eql MOCK_REPLY
      done())