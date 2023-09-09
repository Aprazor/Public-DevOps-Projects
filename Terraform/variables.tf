variable "ami" {
  default     = "ami-0f409bae3775dc8e5"
  description = "AMI us-east1"
}

variable "ssh_key" {
  default = "p1-j1"
}

variable "instance_type" {
  default = {
    default = "t2.micro"
    small   = "t2.small"
  }
}

variable "instance_name" {
  default = ["Jenkins_server", "Ansible_server", "Docker_host", "EKS_host", "tomcat_server"]
  type    = list(string)
}

# variable "instance_type" {
#     type = map
#     default = {
#         "production" = "m5.large"
#         "development" = "t2.micro"
#         }
#     }
#     production = {
#         Jenkins_server = "t2.large"
#         Ansible_server = "t2.large"
#         Docker_host = "t2.small"
#         EKS_host = "t2.small"
#         tomcat_server = "t2.large"
#     }

output "jenkins_public_ip" {
  value       = aws_instance.Jenkins_server.public_ip
  description = "Prints the Public IP of Jenkins Server"
}

output "ansible_public_ip" {
  value       = aws_instance.Ansible_server.public_ip
  description = "Prints the Public IP of Ansible Server"
}

output "EKS_host" {
  value       = aws_instance.EKS_host.public_ip
  description = "Prints the Public IP of EKS Host"
}

