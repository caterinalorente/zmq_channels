ReplyChannel = require './reply_channel'
RequestChannel = require './request_channel'

replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000')
requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000')

setInterval () ->
  request = 'marramamiau'
  requestChannel.sendRequest request
, 2000

requestChannel.waitForReply () ->