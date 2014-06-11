RequestChannel = require '../src/request'
ReplyChannel = require '../src/reply'

describe 'Request Reply test', ->
  # Variables to be used MUST be declared at the
  # beginning to avoid scope issues  
  requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000')
  replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000')
  MOCK_MESSAGE = "Marramamiau"
  MOCK_RESPONSE = "Woof woof!"

  it 'should send a request and receive a reply correctly', (done) ->
    requestChannel.sendRequest MOCK_MESSAGE
    done()
