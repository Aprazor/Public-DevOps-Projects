resource "aws_security_group" "CICD" {
    name = "CICD"
    description = "Allow SSH and HTTP inbound traffic"
    ingress {
        description = "SSH from VPC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    ingress {
        description = "HTTP from VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP from VPC"
        from_port = 8080
        to_port = 9000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # This allows all outbound traffic.
    cidr_blocks = ["0.0.0.0/0"]
  }
}