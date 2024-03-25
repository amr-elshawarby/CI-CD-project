

resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Allow SSH access from my IP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data "aws_key_pair" "existing_key_pair" {
  key_name = "Amrkeypair"
  public_key = file("E:sshkey")  
}

resource "aws_instance" "my-ec2"{
    ami= var.image
    instance_type= var.instance_type
    key_name      = data.aws_key_pair.existing_key_pair.key_name
    security_groups = [aws_security_group.ssh_access.name] 
    
}
output "instance_ip" {
  value = aws_instance.my-ec2.public_ip
}
