resource "aws_instance" "my-ec2"{
    ami= var.image
    instance_type= var.instance_type
    
}