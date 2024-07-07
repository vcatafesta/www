const http = require('http')
const port = 5000
const host = '127.0.0.1'

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-type': 'text/html' })
  if (req.url == '/') {
    res.write('<h1>Seja bem vindo')
  } else if (req.url == '/canal') {
    res.write('<h1>Seja bem ao canal')
  } else if (req.url == '/curso') {
    res.write('<h1>Seja bem ao curso')
  }
})
server.listen(port, host, () => { console.log("Server running") })
