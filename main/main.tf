locals {
    # Deprecated
    default_tags = map(  
    "Name", "TF-Learning",
    "Env", "Prod"
     )

    # default_tags = {
    # Name = "TF-Learning",
    # Env = "Prod"
    # Department = "IT"
    # }
}

# EC2
module "ec2-test" {
    source = "../ec2-module"
    name = "instance-01" # Remove Variable
    instance_type = "t2.micro"
} 

# SG
resource "aws_security_group" "tf_learnings_sg" {
  name        = "tf-learnings"
  description = "Allow traffic"
  vpc_id      = "vpc-0c0c8c4a120bac340"
  tags = merge(local.default_tags)

  # lifecycle {
  #   ignore_changes = [tags] 
  # }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

# EBS
resource "aws_ebs_volume" "tf_learnings_ebs" {
  availability_zone = "us-east-1a"
  size              = 20 
  tags = merge(local.default_tags)

  # lifecycle {
  #   ignore_changes = [size]
  # }

}
