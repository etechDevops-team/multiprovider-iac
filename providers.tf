provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  alias  = "cloud-prod"
  region = "us-east-2"
  assume_role {
    role_arn     = "arn:aws:iam::985539781710:role/crossaccount-role-prod"
    session_name = "cloud-prodsession"
  }
}