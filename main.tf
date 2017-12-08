variable "region" {
  default = "us-east-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}  

tags {
    name = "HelloWorld"
    "billing-id" = "faa353f3"
   }
