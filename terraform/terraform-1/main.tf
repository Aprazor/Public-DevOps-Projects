resource "aws_instance" "instance1" {
    ami = data.aws_ami_ids.amazonlinux.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.myvpc-sg.id]
    subnet_id = aws_subnet.sub1.id
    user_data = base64encode(file("user_data.sh"))
    tags = {
      name = "Instance1"
    }
    
}

resource "aws_instance" "instance2" {
    ami = data.aws_ami_ids.amazonlinux.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.myvpc-sg.id]
    subnet_id = aws_subnet.sub2.id
    user_data = base64encode(file("user_data.sh"))
    tags = {
      name = "Instance2"
    }
    
}


