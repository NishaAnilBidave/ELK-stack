######## Bastion Host #########
resource "aws_instance" "bastion_server" {
  ami           = data.aws_ami.bastion_host_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.bastion_server_sg.id]
  key_name = "talent-academy-lab"
  subnet_id     = aws_subnet.kibana_public_subnet1.id

  tags = {
    Name = "Bastion_host"
  }
}


# ### KIBANA SERVER ##
resource "aws_instance" "kibana_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.kibana_server_sg.id]
  key_name               = "talent-academy-lab"
  subnet_id              = aws_subnet.kibana_public_subnet1.id


  tags = {
    "Name" = "kibana_server"
  }
}

###### elastiSearch #########
resource "aws_instance" "elastisearch_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m4.large"
  vpc_security_group_ids = [aws_security_group.elastisearch_server_sg.id]
  key_name = "talent-academy-lab"
  subnet_id     = aws_subnet.monitor_private_subnet1.id

  tags = {
    Name = "elastisearch"
  }
}

######### logstash ######

resource "aws_instance" "lagstash_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m4.large"
  vpc_security_group_ids = [aws_security_group.logstash_server_sg.id]
  key_name = "talent-academy-lab"
 subnet_id      = aws_subnet.monitor_private_subnet1.id

  tags = {
    Name = "logstash"
  }
}
####### demo server 1 #######

resource "aws_instance" "demo_server_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m4.large"
  vpc_security_group_ids = [aws_security_group.demo_server_sg.id]
  key_name = "talent-academy-lab"
   subnet_id    = aws_subnet.app_private_subnet1.id

  tags = {
    Name = "demo_server_1"
  }
}

####### demo server 2 #######

resource "aws_instance" "demo_server_2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m4.large"
  vpc_security_group_ids = [aws_security_group.demo_server_sg.id]
  key_name = "talent-academy-lab"
  subnet_id     = aws_subnet.app_private_subnet2.id


  tags = {
    Name = "demo_server_2"
  }
}

####### demo server 3 #######

resource "aws_instance" "demo_server_3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m4.large"
  vpc_security_group_ids = [aws_security_group.demo_server_sg.id]
  key_name = "talent-academy-lab"
  subnet_id     = aws_subnet.app_private_subnet3.id

  tags = {
    Name = "demo_server_3"
  }
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion_server.id
  vpc      = true
  tags = {
    "Name" = "bastion_eip"
  }
}
