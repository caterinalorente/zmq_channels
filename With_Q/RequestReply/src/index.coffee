###
When importing a require
  1- Variable MUST have same name as the variable
  2- Name of the file or dir inside require
  3- CamelCase
###

RequestChannel = require '../src/request_channel'
ReplyChannel = require '../src/reply_channel'

# request = new RequestChannel("tcp", "127.0.0.1", "3000")
reply = new ReplyChannel('tcp', '127.0.0.1', '3000')