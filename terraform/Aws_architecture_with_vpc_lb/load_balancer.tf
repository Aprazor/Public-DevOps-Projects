resource "aws_lb" "myvpc_lb" {
  name                       = "myvpc_lb"
  internal                   = false
  load_balancer_type         = "application"
  enable_deletion_protection = false
  security_groups            = [aws_security_group.myvpc-sg.od]
  subnets                    = [aws_subnet.sub1.id, aws_subnet.sub2]

  tags = {
    name = "myvpc-load-balancer"
  }

}

resource "aws_lb_target_group" "myvpc_lb_tg" {


}

