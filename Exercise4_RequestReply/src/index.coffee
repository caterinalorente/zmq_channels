# Import
ReplyChannel = require './reply_channel'
RequestChannel = require './request_channel'

# Channel instances creation
replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000')
requestChannel = new RequestChannel('tcp', '127.0.0.1', '3000', (reply) -> 
  console.log "Received reply #{reply} \n")

# Request every second
setInterval () ->
  request = 'marramamiau'
  requestChannel.sendRequest request
, 1000