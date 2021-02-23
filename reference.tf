provider "aws" {
   profile = "user1"
   region = "us-east-1"
}


resource "aws_instance" "myec2" {
  ami  = "ami-047a51fa27710816e"
  instance_type = var.instancetype
}

resource "aws_eip" "lb" {
  vpc = true
  }

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}


resource "aws_security_group" "allow_tls" {
  name        = "john_security group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }
}
