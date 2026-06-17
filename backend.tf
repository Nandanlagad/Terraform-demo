terraform {

  backend "s3" {

    bucket         = "nandan-tf-remote-backend-2026"

    key            = "terraform-demo/terraform.tfstate"

    region         = "ap-south-1"

    dynamodb_table = "terraform-locks"

  }

}