provider "aws" {
   profile = "user1"
   region = "us-east-1"
}

resource "aws_instance" "instance-1" {
   ami = "ami-047a51fa27710816e"
   instance_type = var.types[count.index]
   count = 3
}


variable "types" {
  type = list
  default = ["t2.micro","t2.small","t2.nano"]
}
