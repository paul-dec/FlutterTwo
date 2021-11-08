const express = require('express')
const mongoose = require('mongoose')
const bodyParser = require('body-parser')
const cors = require('cors')

const dotenv = require('dotenv').config()
const app = express()

mongoose.connect(process.env.URL_DB, { useNewUrlParser: true, useUnifiedTopology: true }, () => console.log("Connected to MongoDB"))

app.use(cors())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

// Routes
const user = require('./routes/userRoute')
user(app)

app.listen(process.env.APP_PORT, () => { console.log('Listening on port: ' + process.env.APP_PORT) })