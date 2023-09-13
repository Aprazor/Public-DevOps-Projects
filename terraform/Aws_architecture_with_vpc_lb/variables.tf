variable "ec2_instances" {

  type = map(object({
    name          = "ec2_instances"
    ami           = string
    instance_type = string

  }))
  default = {
    "webserver" = {
      ami           = "ami-0c55b159cbfafe1f0"
      instance_type = "t2.micro"
    }

  "appserver" = {
      ami           = "ami-0c55b159cbfafe1f0"
      instance_type = "t2.large"
  }
}
}
