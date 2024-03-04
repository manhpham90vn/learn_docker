const express = require('express')
const os = require('os')

const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World! from ' + os.hostname() + ' on ' + os.platform() + ' with ' + os.cpus().length + ' cpus.')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})