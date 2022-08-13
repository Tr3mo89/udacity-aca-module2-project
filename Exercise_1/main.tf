# TODO: Designate a cloud provider, region, and credentials

# variable access_key {
#     type = string
#     description="Importing AWS access key from the CLI"
# }

# variable secret_key {
#     type = string
#     description="Importing AWS secret key from the CLI"
# }


provider "aws" {
  region = "us-east-1"
  # Not using the credentials via CLI => profile configured in .aws/credentials
  # access_key = var.access_key
  # secret_key = var.secret_key
}



# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
  ami           = "ami-090fa75af13c156b4" #Amazon Linux 2 Kernel 5.10 AMI 2.0.20220719.0 x86_64 HVM gp2
  instance_type = "t2.micro"
  count         = 4

  tags = {
    Name = "Udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "udacity_m4" {
  ami           = "ami-090fa75af13c156b4" #Amazon Linux 2 Kernel 5.10 AMI 2.0.20220719.0 x86_64 HVM gp2
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "Udacity M4"
  }
}