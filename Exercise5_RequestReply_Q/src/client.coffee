# Import
RequestChannel = require './request_channel.coffee'

hashMap = {}
requestChannel = new RequestChannel('tcp', 'localhost', '3000', hashMap)

# Call sendRequest method of the RequestChannel instance every N seconds
# The channel will return a promise [object] of a reply
# If the promise is resolved it will be printed
# If the promise is NOT resolved the error will be catched and printed
setInterval () ->
  requestChannel.sendRequest("It's the end of the world as we know it")
  .then (reply) ->
    console.log "Client received #{reply} \n"
  .fail (error) ->
    console.error error
  .done()
, 1000