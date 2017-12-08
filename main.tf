variable "region" {
  default = "us-east-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "terraform-demo" {
  cidr_block = "${var.cidr}"
  tags {
    Name = "terraform-demo"
  }
}

resource "aws_subnet" "instance_subnet" {
  vpc_id     = "${aws_vpc.terraform-demo.id}"
  cidr_block = "${cidrsubnet(var.cidr,2,0)}"
  tags {
    Name="instance_subnet"
  }
}


resource "aws_instance" "app" {
  ami           = "ami-cd0f5cb6"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.instance_subnet.id}"
  
  tags {
    name = "HelloWorld"
    "billing-id" = "faa353f3"
   }
}
