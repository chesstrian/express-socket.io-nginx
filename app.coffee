express = require 'express'

routes = require './routes'

app = express()

app.set 'port', process.env.PORT or 3000

app.enable 'trust proxy'
app.use '/', routes
app.use (req, res, next) -> # Catch 404 and forward to error handler
  error = new Error 'Not Found'
  error.status = 404
  next error

module.exports = app
