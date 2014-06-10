# SERVER

Q = require 'q'

# When the message from ReplyChannel is received,
# the promise is solved and returned to ReplyChannel

handleRequest = (msg) ->
  deferred = Q.defer()
  # console.log "Server received #{msg} \n"

  setTimeout () -> # Simulate asynchronous behaviour
    deferred.resolve "and I feel fine"
  , 2000

  deferred.promise

ReplyChannel = require './reply_channel.coffee'
replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000', handleRequest)