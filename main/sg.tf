
# SG
resource "aws_security_group" "tf_learning_sg" {
  name        = "tf-learnings"
  description = "Allow traffic"
  vpc_id      = "vpc-0c0c8c4a120bac340"
  tags = merge(
    local.default_tags #,{Department = "IT"}
    )
#   lifecycle {
#     ignore_changes = [tags] 
#   }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

#   ingress {
#     description      = ""
#     from_port        = 3389
#     to_port          = 3389
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

  ingress {
    description      = "SSH"
    from_port        = 23
    to_port          = 23
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }



}

output "aws_security_id" {
  value = aws_security_group.tf_learning_sg.id
}

