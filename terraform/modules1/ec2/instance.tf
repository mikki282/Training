resource "aws_instance" "web" {
    count=3
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = var.key_pair
    associate_public_ip_address = "true"
    tags = {
        Name = "my_instance-${count.index + 1}"
    }
    vpc_security_group_ids= [var.security_group_id]
    subnet_id = var.subnet_id
}

output instance_id1 {
  value       = element(aws_instance.web.*.id, 1)
}
output instance_id2 {
  value       = element(aws_instance.web.*.id,2)
}
output instance_id3 {
  value       = element(aws_instance.web.*.id,2)
}