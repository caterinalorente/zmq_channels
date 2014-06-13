ReplyChannel = require './reply_channel'
RequestChannel = require './request_channel'

replyChannel = new ReplyChannel('tcp', '127.0.0.1', '4000')
requestChannel = new RequestChannel('tcp', '127.0.0.1', '4000')

setInterval () ->
  requestChannel.sendRequest "It's the end of the world as we know it"
  replyChannel.sendReply "and I feel fine"
, 1000

console.log "1"
replyChannel.waitForRequest()
console.log "2"
requestChannel.waitForReply((reply) ->
  console.log "Reply from #{reply.id} #{reply.message} \n")