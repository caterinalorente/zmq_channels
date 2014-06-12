RequestChannel = require './request_channel'
ReplyChannel = require './reply_channel'

replyChannel = new ReplyChannel('tcp', 'localhost', '4000')
requestChannel = new RequestChannel('tcp', 'localhost', '4000')

setInterval () ->
  requestChannel.sendRequest "It's the end of the world as we know it"
  replySocket.sendReply "and I feel fine"
  null
, 1000

requestChannel.waitForReply()