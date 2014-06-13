#Import
SendChannel = require '../src/send_channel'
ReceiveChannel = require '../src/receive_channel'

describe 'Send Receive test', ->
  # Variables to be used MUST be declared at the
  # beginning to avoid scope issues
  sender = null
  receiver = null
  MOCK_MESSAGE = null
    
  before ->
    sender = new SendChannel('tcp', '127.0.0.1', '4000')
    receiver = new ReceiveChannel('tcp', '127.0.0.1', '4000')
    MOCK_MESSAGE = 'Mojo Jojo rulez!'

  it 'should send and receive a message correctly', (done) ->
    sender.send MOCK_MESSAGE

    # When a message is received a `messageReceived` event is sent
    # containing the message received
    receiver.on 'messageReceived', (message) ->
      console.log MOCK_MESSAGE
      message.should.be.eql MOCK_MESSAGE
      done()