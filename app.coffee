express = require 'express'

routes = require './routes'

app = express()

app.set 'port', process.env.PORT or 3000

app.use '/', routes
app.use (req, res) -> # Handler error 404
  res.sendStatus 404

module.exports = app
