# Import
ReplyChannel = require './reply_channel'
RequestChannel = require './request_channel'

# Channel instances creation
replyChannel = new ReplyChannel('tcp', '127.0.0.1', '4000', 'and I feel fine')
requestChannel = new RequestChannel('tcp', '127.0.0.1', '4000', (reply) ->
  console.log "Reply from #{reply.id} #{reply.message} \n")

# Request every second
setInterval () ->
  requestChannel.sendRequest "It's the end of the world as we know it"
, 1000