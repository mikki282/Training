resource "aws_instance" "demo" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = var.key_pair
    tags = {
        Name = var.tag_name
    }
}