output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "public_subnets" {
  value = ["${aws_subnet.public_snet.id}"]
}
output "public_route_table_ids" {
  value = ["${aws_route_table.public_rtb.id}"]
}

output "instance_id" {
  value = aws_instance.app.id
}

output "instance_public_ip" {
  value = ["${aws_instance.app.public_ip}"]
}

