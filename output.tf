output "public_subnet_ids" {
  value = data.aws_subnets.public_subnets.ids
}

output "private_subnet_ids" {
  value = data.aws_subnets.private_subnets.ids
}

output "ebs_volumn_id" {
  value = aws_ebs_volume.ebs_volume.id
}