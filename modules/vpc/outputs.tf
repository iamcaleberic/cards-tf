output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "internet_gateway" {
  value = aws_internet_gateway.gw.id
}
output "private_routing_table" {
  value = aws_route_table.rtb_public.id
}
output "public_routing_table" {
  value = aws_route_table.rtb_private.id
}
output "private_subnet" {
  value = aws_subnet.subnet_private.id
}
output "public_subnet" {
  value = aws_subnet.subnet_public.id
}
output "public_security_group" {
  value = aws_security_group.sg_public.id
}
