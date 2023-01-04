# provisioning resource "aws_key_pair" - 
# - creating a keypair for ec2 instance[terraform registry aws/tls/local are used]

resource "aws_key_pair" "ec2-KeyPair" {
  key_name   = "ec2-KeyPair"
  public_key = tls_private_key.rsa.public_key_openssh
   }

resource "tls_private_key" "rsa"{
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "ec2-KeyPair" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}

# provisioning resource "aws_security_group" - 
# - creating a security group for ec2 instance[terraform registry]

resource "aws_security_group" "ec2_access" {
  name        = "ec2_access"
  description = "ec2_access"
   # change according to your default vpc id
  vpc_id      = "vpc-0a696dc547dfa1ca4"

  # edited for creating a inbound rule
  # created https rule from port 443 to 443
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 # edited for creating a inbound rule
 # created https rule from port 80 to 80

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 # edited for creating a inbound rule
 # created https rule from port 22 to 22

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

#default - this config specifies (all trafic)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ec2_access"
  }
}


# provisioning resource "aws_instance" - 
# - creating a aws ec2 instance[terraform registry]
resource "aws_instance" "server" {
  ami = "ami-0a606d8395a538502"   # change according to your acount and region
  instance_type = "t2.micro"  # this is free tier eligible
  key_name = "ec2-KeyPair" # attaching above created key_pair
  # attaching above created security group
  # (You can also use default group, but to enable certain ports create custom and custom inbound rules)
 vpc_security_group_ids = [
   aws_security_group.ec2_access.id
  ]
  tags = {
    Name = "E-WebServer"
  }

  user_data = file("script.sh")
}