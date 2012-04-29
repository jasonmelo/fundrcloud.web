fs = require("fs")
console.log "NODE_ENV: #{process.env.NODE_ENV}"
console.log "NODE_CONFIG: #{process.env.NODE_CONFIG}"
environment = process.env.NODE_CONFIG || 'dev'
tmp = JSON.parse(fs.readFileSync(process.cwd() + '/config.json', encoding='utf8'))[environment]
module.exports = tmp