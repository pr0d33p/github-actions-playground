workflow "on_pull_request" {
  on = "pull_request"
  resolves = ["merge-on-green"]
}

action "merge-on-green" {
  uses = "./.github/actions/merge-on-green"
}

workflow "on_pull_request_review" {
  on = "pull_request_review"
  resolves = ["merge-on-green-1"]
}

action "merge-on-green-1" {
  uses = "./.github/actions/merge-on-green"
}

workflow "on_status" {
  on = "status"
  resolves = ["merge-on-green-2"]
}

action "merge-on-green-2" {
  uses = "./.github/actions/merge-on-green"
}
