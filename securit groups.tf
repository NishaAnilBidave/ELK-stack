#Security group for Bastion Host server
resource "aws_security_group" "bastion_host_server_sg" {
  name        = "bastion-host-server"
  description = "Allow connection for bastion host server."
  vpc_id      =  data.aws_vpc.lab_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-host-server"
  }
}