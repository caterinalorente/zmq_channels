# CLIENT

# Call sendRequest method of the instance
# Returns a promise [object] of the sendRequest instance
# When the promise is resolved, print and afterwards check with test

hashMap = {}
RequestChannel = require './request_channel.coffee'
requestChannel = new RequestChannel('tcp', 'localhost', '3000', hashMap)

setInterval () ->
  requestChannel.sendRequest("It's the end of the world as we know it")
  .then (reply) ->
    console.log "Client received #{reply} \n"
  .fail (error) ->
    console.error error
  .done()
, 1000