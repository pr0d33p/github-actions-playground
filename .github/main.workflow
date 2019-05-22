workflow "automerge pull requests on updates" {
  on = "pull_request"
  resolves = ["automerge"]
}

workflow "automerge pull requests on reviews" {
  on = "pull_request_review"
  resolves = ["automerge"]
}

workflow "automerge pull requests on status updates" {
  on = "status"
  resolves = ["automerge"]
}

action "automerge" {
  uses = "pascalgn/automerge-action@6614ad80c8cdb1da2c260221cd93b62d29f49413"
  secrets = [
    "GITHUB_TOKEN",
    "TOKEN",
  ]
  env = {
    LABELS = "!wip,!work in progress,documentation-updated"
    AUTOMERGE = "ready-to-merge"
    AUTOREBASE = "ready-to-rebase-and-merge"
    MERGE_METHOD = "squash"
  }
}
