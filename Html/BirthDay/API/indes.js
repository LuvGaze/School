const express = resquire('express')
const app = express()
app.use(express.static('../dist'))

module.exports = app
