data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "webdev" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

moved {
  from = aws_instance.webprod
  to = aws_instance.webprd
}

resource "aws_instance" "webprd" {
  provider      = aws.cloud-prod
  ami           = "ami-0604f27d956d83a4d"
  instance_type = "t3.micro"

  tags = {
    Name = "prodserver"
  }
}