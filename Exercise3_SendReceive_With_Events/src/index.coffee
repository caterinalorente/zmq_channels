###
When importing a require
	1- Variable MUST have same name as the variable
	2- Name of the file or dir inside require
	3- CamelCase
###

# Import
SendChannel = require './send_channel'
ReceiveChannel = require './receive_channel'

# Create sender instance and send
# messages every N seconds
sender = new SendChannel('tcp', '127.0.0.1', '4000')
interval = 1000
setInterval () ->
  sender.send('Is anybody out there?')
, interval

# Create receiver instance and attach a listener
# that will catch the reply emitted when received
receiver = new ReceiveChannel('tcp', '127.0.0.1', '4000')
receiver.on 'messageReceived', (message) -> console.log "Receiving: #{message}"