######## Bastion Host #########
resource "aws_instance" "Bastion_Host" {
  ami           = data.aws_ami.bastion_host_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.bastion_host_server_sg.id]
  key_name = "bastion_host_key"
  subnet_id = data.aws_subnet.public.id

  tags = {
    Name = "Bastion_host"
  }
}

####### elastiSearch #########
resource "aws_instance" "elastiSearch" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.elastisearch_server.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.private1_subnet.id

  tags = {
    Name = "elastisearch"
  }
}

######### logstach ######

resource "aws_instance" "lagstach" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.logstach_server.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.private1_subnet.id

  tags = {
    Name = "logstach"
  }
}
####### demo server #######

resource "aws_instance" "demo_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.demo_server.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.private2_subnet.id

  tags = {
    Name = "demo_server"
  }
}