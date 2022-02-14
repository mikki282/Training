resource "aws_lb" "my_alb" {
    internal= false
    security_groups= [var.security_group_id]
     subnets = [var.subnet1 , var.subnet2]
    ip_address_type= var.ip
    tags = {
        Name= "my_alb"
    }
    load_balancer_type= var.balancer
}
resource "aws_alb_target_group" "alb_targetgroup" {
    target_type= var.type
    vpc_id= var.vpc_id
    port=80
    protocol= "HTTP"
    health_check {
        healthy_threshold =5
        unhealthy_threshold=2
        timeout =5
        interval =30
        path= "/"
        protocol= "HTTP"
    }
    tags = {
        Name ="alb_targetgroup"
    }
}
resource "aws_lb_listener" "my_alb_listner" {
    load_balancer_arn = aws_lb.my_alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_targetgroup.arn
  }
}
resource "aws_lb_target_group_attachment" "attach_instance1" {
    target_group_arn = aws_alb_target_group.alb_targetgroup.arn
    target_id = var.instance_id1
    port=80
}
resource "aws_lb_target_group_attachment" "attach_instance2" {
    target_group_arn = aws_alb_target_group.alb_targetgroup.arn
    target_id = var.instance_id2
    port=80
}

resource "aws_lb_target_group_attachment" "attach_instance3" {
    target_group_arn = aws_alb_target_group.alb_targetgroup.arn
    target_id = var.instance_id3
    port=80
}