FROM node:10-slim

# Labels for GitHub to read your action
LABEL "com.github.actions.name"="merge-on-green"
LABEL "com.github.actions.description"="Merges On Green"
# Here are all of the available icons: https://feathericons.com/
LABEL "com.github.actions.icon"="activity"
# And all of the available colors: https://developer.github.com/actions/creating-github-actions/creating-a-docker-container/#label
LABEL "com.github.actions.color"="white"

# Copy the rest of your action's code
COPY . .

# Install dependencies
RUN yarn

# Run `node /index.js`
ENTRYPOINT ["node", "/index.js"]
