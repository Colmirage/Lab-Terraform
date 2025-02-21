terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}


provider "github" {
  token = var.github_token
}


variable "github_token" {
  description = "Token de acceso personal para autenticación con GitHub"
  type        = string
}



resource "github_repository" "example_repo" {
  name        = "repo_terraform"
  description = "Repositorio creado con Terraform"
  visibility  = "public"
  auto_init = true

}



resource "github_branch" "development" {
  repository = github_repository.example_repo.name
  branch     = "development"
}

resource "github_branch" "staging" {
  repository = github_repository.example_repo.name
  branch     = "staging"
}

resource "github_branch" "feature" {
  repository = github_repository.example_repo.name
  branch     = "feature"
}
