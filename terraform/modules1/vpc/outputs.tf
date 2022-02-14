output "my_vpc_id" {
  value       = aws_vpc.my_vpc.id
}
output "pub_subnet_id" {
  value       = element(aws_subnet.public.*.id,1)
}
output "pub2_subnet_id" {
  value       = element(aws_subnet.public.*.id,2)
}

output "pvt_subnet_id" {
  value       = element(aws_subnet.private.*.id,1)
}
output "pvt2_subnet_id" {
  value       = element(aws_subnet.private.*.id,2)
}