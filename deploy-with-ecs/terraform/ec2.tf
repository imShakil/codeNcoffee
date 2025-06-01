resource "aws_security_group" "cnc_ec2_sg" {

  name        = "cncEC2sg"
  description = "cnc ec2 security group"
  vpc_id      = aws_vpc.cnc_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
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

resource "aws_key_pair" "cnc_access_key" {
  key_name   = "cnc_access_key"
  public_key = file("~/.ssh/cnc_access_key.pub")
}

resource "aws_instance" "cnc_instance" {
  count                       = 2
  ami                         = "ami-060e277c0d4cce553"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.cnc_vpc_public_subnets[count.index].id
  vpc_security_group_ids      = [aws_security_group.cnc_ec2_sg.id]
  key_name                    = aws_key_pair.cnc_access_key.key_name
  associate_public_ip_address = true

  user_data = file("./run_container_app.sh")

  tags = {
    Name = "WebServer-${count.index + 1}"
  }

}
