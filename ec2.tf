# Create Instance in Public Subnet

resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = length(data.aws_subnets.public_subnets.ids) > 0 ? tolist(data.aws_subnets.public_subnets.ids)[0] : null
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = data.aws_key_pair.ws_keypair.key_name
  associate_public_ip_address = true
  count                       = var.instance_count
  tags                        = {Name = "${var.name_prefix}-ec2-for-ebs"}
  user_data                   = templatefile("./init-script.sh",{})
}
 
