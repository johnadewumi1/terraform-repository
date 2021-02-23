provider "aws" {
   profile = "user1"
   region = "us-east-1"
 }

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}

variable "elb_names" {
  type = list
  default = ["dev-loadbalancer","stage-loadbalancer","prod-loadbalancer"]
}
