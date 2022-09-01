# # ALB
# resource "aws_lb" "tf_learning_alb" {
#   name               = "tf-learning-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.tf_learning_sg.id]
#   subnets            = ["subnet-0b92768dceecbd140"] 
#   #subnets            = ["subnet-0b92768dceecbd140","subnet-0909acc56d41f58db"]

#   tags = {
#     Environment = "production"
#   }
# }

# # Listener
# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.tf_learning_alb.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg_80.arn
#   }
# }

# # Target Group
# resource "aws_lb_target_group" "tg_80" {
#   name     = "tg-learning-80"
#   port     = 80
#   protocol = "HTTP"
#   #protocol = "HTTPSS" 
#   vpc_id   = "vpc-0c0c8c4a120bac340"
#   #vpc_id   = "vpc-0c0c8c4a120bac340s"
# }

# # Target Group Attachment
# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.tg_80.arn
#   target_id        = module.ec2-test.instance_id
#   port             = 80
# }

# output "alb_arn" {
#   value = aws_lb.tf_learning_alb.arn
# }