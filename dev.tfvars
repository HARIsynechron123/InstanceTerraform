configuration = [
  {
    "application_name" : "Kube-Master",
    "ami" : "ami-0d5d9d301c853a04a",
    "no_of_instances" : "1",
    "instance_type" : "t2.medium",
    # "subnet_id" : "subnet-0f4f294d8404946eb",
    # "vpc_security_group_ids" : ["sg-0d15a4cac0567478c","sg-0d8749c35f7439f3e"]
  },
  {
    "application_name" : "Kube-Worker",
    "ami" : "ami-0d5d9d301c853a04a",
    "instance_type" : "t2.micro",
    "no_of_instances" : "2"
    # "subnet_id" : "subnet-0f4f294d8404946eb"
    # "vpc_security_group_ids" : ["sg-0d15a4cac0567478c"]
  }
  
]