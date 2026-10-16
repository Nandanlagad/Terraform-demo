terraform {
  backend "s3" {
    bucket       = "nandan-terraform-state-816301969117"
    key          = "projects/terraform-demo/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
