http = require('http')
url = require('url')

port = 3000
ip = "127.0.0.1"

onRequest = (request, response) ->

  queryData = url.parse(request.url, true).query

  response.writeHead 200, "Content-Type": "text/plain"
  response.write("Request received")
  
  if queryData.message
    console.log(queryData.message)
  else
    console.log("Bad query syntax")
    response.end()

http.createServer(onRequest).listen(port)
console.log "Server running on http://#{ip}:#{port}/"