data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}

resource "aws_key_pair" "Lab_key" {
  key_name   = "Lab_key"
  public_key = file("${var.key_path}.pub")
}


resource "aws_instance" "jenkins_instance" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.Lab_key.id
  security_groups = [aws_security_group.jenkins_sg.name]
  user_data       = file("scripts/install_jenkins.sh")
  tags = {
    Name = "Jenkins"
  }
}
