const fse = require('fs-extra')

const eventPath = process.env.GITHUB_EVENT_PATH
const eventName = process.env.GITHUB_EVENT_NAME

const eventDataStr = fse.readFileSync(eventPath, 'utf8')
const eventData = JSON.parse(eventDataStr)

console.log(eventData)
console.log(eventName)

// if (
//   eventData.action === 'labeled' ||
//   eventData.action === 'submitted' ||
//   eventData.action === 'completed'
// ) {
//   return
// }
