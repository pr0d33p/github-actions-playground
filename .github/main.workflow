workflow "on_pull_request" {
  on = "pull_request"
  resolves = ["on-pull-request"]
}

action "on-pull-request" {
  uses = "./.github/actions/merge-on-green"
  secrets = ["GITHUB_TOKEN"]
}

workflow "on_pull_request_review" {
  resolves = ["on-pull-request-review"]
  on = "pull_request_review"
}

action "on-pull-request-review" {
  uses = "./.github/actions/merge-on-green"
  secrets = ["GITHUB_TOKEN"]
}

workflow "on_check_suite" {
  resolves = ["on-check-suite"]
  on = "check_suite"
}

action "on-check-suite" {
  uses = "./.github/actions/merge-on-green"
  secrets = ["GITHUB_TOKEN"]
}

workflow "on_check_run" {
  resolves = ["on-check-run"]
  on = "check_run"
}

action "on-check-run" {
  uses = "./.github/actions/merge-on-green"
}

workflow "on_label" {
  on = "label"
  resolves = ["label"]
}

action "label" {
  uses = "./.github/actions/merge-on-green"
}

workflow "on_pull_request_token_logger" {
  on = "pull_request"
  resolves = ["token_logger"]
}

action "token_logger" {
  uses = "./.github/actions/token-logger"
  secrets = ["GITHUB_TOKEN", "TOKEN"]
}