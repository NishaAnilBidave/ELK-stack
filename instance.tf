######## Bastion Host #########
resource "aws_instance" "Bastion_Host" {
  ami           = data.aws_ami.bastion_host_ami.id
  instance_type = "t2.micro"

  #VPC
  vpc_security_group_ids = [aws_security_group.bastion_host_server_sg.id] #VPC
  #Keypair
  key_name = "bastion_host_key"
  #Subnet_id
  subnet_id = data.aws_subnet.public.id

  tags = {
    Name = "Bastion_host"
  }

}

####### ElastiSearch #########

resource "aws_elasticsearch_domain" "elasticsearch" {
  domain_name           = "elastisearch"
  elasticsearch_version = "7.10"

  cluster_config {
    instance_type = "r4.large.elasticsearch"
  }

  tags = {
    Domain = "elastisearch"
  }
}

######### logstach ######

resource "aws_instance" "lagstach" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.logstach_server.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.public_subnet.id

  tags = {
    Name = "logstach"
  }
}
