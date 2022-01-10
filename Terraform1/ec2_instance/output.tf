output "public_ip" {
  value       = aws_instance.demo.public_ip
  sensitive   = true
  description = "I want to display public_ip of my instance but here i am using keyword sensitive which means the public_ip doesn't display on output screen"
}
