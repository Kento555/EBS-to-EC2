# Create a 1GB EBS volume in the same AZ as the EC2 instance
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = aws_instance.ec2_instance[0].availability_zone
  size              = 1                                              # 1GB volume
  type              = "gp3"                                          # Required for 'iops' & 'throughput'
  iops              = 3000                                           # Only allowed for gp3, io1, io2
  throughput        = 125                                            # Only allowed for gp3
  tags = {Name = "${var.name_prefix}-ebs"}
}

# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "ebs_volume_attachment" {
  device_name = "/dev/xvdf"  
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.ec2_instance[0].id
}