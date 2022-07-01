provider "aws" {
   region = "us-east-2"
  # profile = "personal"
}
locals {
  serverconfig = [
    for srv in var.configuration : [
      for i in range(1, srv.no_of_instances+1) : {
        instance_name = "${srv.application_name}-${i}"
        instance_type = srv.instance_type
        # subnet_id   = srv.subnet_id
        ami = srv.ami
        # security_groups = srv.vpc_security_group_ids
      }
    ]
  ]
}
// We need to Flatten it before using it
locals {
  instances = flatten(local.serverconfig)
}
resource "aws_instance" "web" {
  for_each = {for server in local.instances: server.instance_name =>  server}
  
  ami           = each.value.ami
  instance_type = each.value.instance_type
  # vpc_security_group_ids = each.value.security_groups
  user_data = <<EOF
  #!/bin/bash
  echo "Hello, World!" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF
  # subnet_id = each.value.subnet_id
  tags = {
    Name = "${each.value.instance_name}"
  }
}
output "instances" {
  value       = "${aws_instance.web}"
  description = "All Machine details"
}