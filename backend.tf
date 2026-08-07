terraform {
  backend "s3" {
    bucket       = "tfbkt5"
    key          = "projects/terraform-demo/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}