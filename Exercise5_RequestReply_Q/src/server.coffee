# Import
Q = require 'q'

# The server promises reply channel a reply that is
# sent inside reply channel's constructor as a function
handleRequest = (msg) ->
  deferred = Q.defer()
  # console.log "Server received #{msg} \n"

  # Simulate asynchronous behaviour by setting a timeout
  # before resolving the promise
  setTimeout () ->
    deferred.resolve "and I feel fine"
  , 2000

  deferred.promise

ReplyChannel = require './reply_channel.coffee'
replyChannel = new ReplyChannel('tcp', '127.0.0.1', '3000', handleRequest)