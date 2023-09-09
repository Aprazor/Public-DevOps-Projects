

data "aws_key_pair" "p1_key" { ##we are using the data block to use already avaialable key from aws rather than locally providing it
  key_name = "p1-j1"
  # key_pair_id = key-0c04611cdf23a367c
}

## Instances
resource "aws_instance" "Jenkins_server" {
  ami                    = "${var.ami}"
  instance_type          = var.instance_type["small"]
  vpc_security_group_ids = [aws_security_group.CICD.id]
  tags = {
    "Name" = var.instance_name[0]

  }
  key_name   = data.aws_key_pair.p1_key.key_name
  depends_on = [] ##>>>>>>>>>>add sg
  #   # Specify the existing security group ID here

  provisioner "local-exec" {
    command = "echo Jenkins_IP: ${aws_instance.Jenkins_server.public_ip} >> /tmp/ips.txt"
  }
}

resource "aws_instance" "Ansible_server" {
  ami           = "${var.ami}"
  instance_type = var.instance_type["small"]
  tags = {
    "Name" = var.instance_name[1]
  }
  key_name               = data.aws_key_pair.p1_key.key_name
  vpc_security_group_ids = [aws_security_group.CICD.id]
  #   connection {
  #     type = "ssh"
  #     user         = "ec2-user"
  #     host         = aws_instance.jenkins_server.public_ip
  #     private_key  = data.aws_key_pair.p1_key  #confirm this with your key
  #     # private_key  = file(var.ssh_key.default)
  #   }
  provisioner "local-exec" {
    command = "echo Ansible_IP: ${aws_instance.Ansible_server.public_ip} >> /tmp/ips.txt"
  }
}
#   # Specify the existing security group ID here
# vpc_security_group_ids = ["sg-0bc8bf8dbf3db4f55"]


resource "aws_instance" "EKS_host" {
  ami           =  "${var.ami}"
  instance_type = var.instance_type["default"]
  tags = {
    "Name" = var.instance_name[3]
  }
  key_name               = data.aws_key_pair.p1_key.key_name
  vpc_security_group_ids = [aws_security_group.CICD.id]

  provisioner "local-exec" {
    command = "echo EKS_Host: ${aws_instance.EKS_host.public_ip} >> /tmp/ips.txt"
  }

  #   # Specify the existing security group ID here
  # vpc_security_group_ids = ["sg-0bc8bf8dbf3db4f55"]
}

