RequestChannel = require '../src/request_channel'
ReplyChannel = require '../src/reply_channel'

describe 'Request Reply test', ->

  # Variables to be used MUST be declared at the
  # beginning to avoid scope issues
  MOCK_REQUEST = "It's the end of the world as we know it"
  MOCK_REPLY = "and I feel fine"

  before ->
    replyChannel = new ReplyChannel('tcp', '127.0.0.1', '4000', MOCK_REPLY)
  
  it 'should send a request and receive a reply correctly', (done) ->

    requestChannel = new RequestChannel('tcp', '127.0.0.1', '4000', (reply) ->
      console.log "Reply from #{reply.id} #{reply.message} \n"
      reply.message.should.be.eql MOCK_REPLY
      done())      

    requestChannel.sendRequest MOCK_REQUEST