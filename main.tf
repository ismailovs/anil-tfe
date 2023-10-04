terraform {
  
   cloud {
    organization = "s_tc_1"

    workspaces {
      name = "tfe-workspace-exercise"
      }
    }


   required_providers {
     tfe = {
     version = "~> 0.49.1"
           }
  
      }
}


provider "tfe" {
      version = "~>0.49.1"  
}



data "tfe_organization" "s" {
  name = "s_tc_1"
}


locals {
  exec_type = "local"
  customers = [
    "apple",
    "google",
    "twitter",
  ]
}


resource "tfe_workspace" "test" {
  for_each = toset(local.customers)
  name           = each.key
  organization   = data.tfe_organization.s.name
  execution_mode = local.exec_type
}