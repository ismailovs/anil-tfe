terraform {
  required_providers {
    tfe = {
      version = "~> 0.49.1"
    }
  }


  cloud {
    organization = "s_tc_1"

    workspaces {
      name = "tfe-workspace-exercise"
      }
    }
}

provider "tfe" {
  version = "~> 0.49.1"
  ...
}