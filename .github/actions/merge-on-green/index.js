const { Toolkit } = require('actions-toolkit')
const tools = new Toolkit()
const query = `

`

async function start() {
  let data
  try {
    data = await tools.github.graphql(query)
  } catch (error) {
    tools.log.fatal(error)
    tools.exit.failure()
  }

  // do something great with this precious data
  if (data) require(`./process`)(data)
}

start()
