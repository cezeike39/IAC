output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.main.id
}
output "pub_sn_id" {
  description = "public subnet."
  value       = aws_subnet.public.id
}
output "priv_sn_id" {
  description = "private subnet."
  value       = aws_subnet.private.id
}

# output "instance_id" {
#  value = aws_instance.ec2.id
# }

 output "public_ip" {
  value = aws_instance.ec2.public_ip
 }
output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}
