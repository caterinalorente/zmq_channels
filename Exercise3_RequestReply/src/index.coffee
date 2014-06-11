ReplyChannel = require './reply'
RequestChannel = require './request'

replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000')
requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000')

setInterval () ->
  request = 'marramamiau'
  requestChannel.sendRequest request
, 2000

requestChannel.printReply()