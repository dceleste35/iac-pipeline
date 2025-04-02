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

# Récupérer la date/heure actuelle
resource "time_static" "build_time" {}

# Nettoyer le timestamp pour l'AMI ID
locals {
  date_suffix = replace(replace(replace(time_static.build_time.rfc3339, "[:T+-]", ""), "Z", ""), ".", "")
}

resource "aws_instance" "demo" {
  ami           = "ami-${local.date_suffix}"
  instance_type = "t2.micro"

  tags = {
    Name = "Build-${local.date_suffix}"
  }
}
