# Define Security Groups for EC2 
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-ebs-sg"
  description = "Allow inbound traffic for EC2"
  vpc_id      = var.vpc_id
}

# Allow SSH (22) and HTTP (80) access to EC2 from anywhere
resource "aws_security_group_rule" "instance_ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol         = "tcp"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "instance_ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol         = "tcp"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks      = ["0.0.0.0/0"]
}

# Allow all outbound traffic from EC2

resource "aws_security_group_rule" "instance_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol         = "-1"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks      = ["0.0.0.0/0"]
}