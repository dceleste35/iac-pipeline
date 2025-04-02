provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  endpoints {
    ec2 = "http://ip10-0-10-5-cvmih9j6221h46l2ts4g-4566.direct.lab-boris.fr"
  }
}

resource "aws_instance" "demo" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}
