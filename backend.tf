terraform {
  backend "s3" {
    bucket="piotr-koszyk-bucket"
    key = "terraform.state"
    region = "eu-central-1"
  }
}