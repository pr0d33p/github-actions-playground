const fse = require('fs-extra')
const { Toolkit } = require('actions-toolkit')

const tools = new Toolkit({
  secrets: ['GITHUB_TOKEN'],
})

async function process(event) {
  const owner = event.repository.owner.login
  const repo = event.repository.name
  const pull_number = event.pull_request.number
  // Check if green
  if (true) {
    try {
      // Call merge API
      data = await tools.github.pulls.merge({
        owner,
        repo,
        pull_number,
      })
    } catch (error) {
      tools.log.fatal(error)
      tools.exit.failure()
    }
  } else {
    console.log(`This isn't ready to go yet`)
  }
}

async function start() {
  const eventPath = process.env.GITHUB_EVENT_PATH
  const eventName = process.env.GITHUB_EVENT_NAME

  const eventDataStr = fse.readFileSync(eventPath, 'utf8')
  const eventData = JSON.parse(eventDataStr)

  if (eventName === 'pull_request' && eventData.action === 'labeled') {
    await process(eventData)
  } else if (
    eventData.action === 'pull_request_review' &&
    eventData.action === 'submitted'
  ) {
    await process(eventData)
  } else if (
    eventData.action === 'check_suite' &&
    eventData.action === 'completed'
  ) {
    // await process(eventData)
  } else {
    console.log('Looks like there is nothing to do here')
  }
}

start()
