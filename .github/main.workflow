workflow "on_pull_request" {
  on = "pull_request"
  resolves = ["on-pull-request"]
}

action "on-pull-request" {
  uses = "./.github/actions/merge-on-green"
}

workflow "on_pull_request_review" {
  on = "pull_request_review"
  resolves = ["on-pull-request-review"]
}

action "on-pull-request-review" {
  uses = "./.github/actions/merge-on-green"
}

workflow "on_check_suite" {
  on = "check_suite"
  resolves = ["on-check-suite"]
}

action "on-check-suite" {
  uses = "./.github/actions/merge-on-green"
}
