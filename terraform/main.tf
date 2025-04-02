provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  endpoints {
    ec2 = "http://ip10-0-2-5-cvmjg8k34iqh49gh850g-4566.direct.lab-boris.fr"
  }
}

resource "random_id" "ami_id" {
  byte_length = 4
}

resource "aws_instance" "demo" {
  ami = "ami-${random_id.ami_id.hex}"
  instance_type = "t2.micro"

  tags = {
    Name = "Commit-${random_id.ami_id.hex}"
  }
}
