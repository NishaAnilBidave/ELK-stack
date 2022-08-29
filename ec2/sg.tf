resource "aws_security_group" "demo_server_sg" {
  name        = "demo-server_sg"
  description = "Allow connection for demo inbound traffic"
  vpc_id      = aws_vpc.lab_vpc.id

  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo_server_sg"
  }
}

### SECURITY GROUP FOR KIBANA SERVER ####
resource "aws_security_group" "kibana_server_sg" {
  name        = "kibana_server_sg"
  description = "Allow connection for kibana server"
   vpc_id      = aws_vpc.lab_vpc.id

  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow port 5601"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "kibana_server_sg"
  }
}

### SECURITY GROUP FOR ELASTISEARCH SERVER ##### 
resource "aws_security_group" "elastisearch_server_sg" {
  name        = "elastisearch_server_sg"
  description = "Allow connection for elastisearch"
  vpc_id      = aws_vpc.lab_vpc.id
  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow port 9200"
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    security_groups = [aws_security_group.logstash_server_sg.id]
  }
  ingress {
    description = "allow port 9300"
    from_port   = 9300
    to_port     = 9300
    protocol    = "tcp"
    security_groups = [aws_security_group.logstash_server_sg.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "elastisearch_server_sg"
  }
}

### SECURITY GROUP FOR BASTION HOST###
resource "aws_security_group" "bastion_server_sg" {
  name        = "bastion_server_sg"
  description = "Allow connection for bastion server"
  vpc_id      = aws_vpc.lab_vpc.id

  ingress {
    description = "allow port 22"
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

  tags = {
    "Name" = "bastion_server_sg"
  }
}

### SECURITY GROUP FOR LOGSTASH SERVER
resource "aws_security_group" "logstash_server_sg" {
  name        = "logstash_server_sg"
  description = "Allow connection for logstash server"
  vpc_id      = aws_vpc.lab_vpc.id


  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow port 9600"
    from_port   = 9600
    to_port     = 9600
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow port 5044"
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "logstash_server_sg"
  }
}

### Sg for packer ###

# resource "aws_security_group" "packer_sg" {
#   name        = "packer_sg"
#   description = "Allow connection for packer"
#   vpc_id      = aws_vpc.lab_vpc.id
  
#   ingress {
#     description = "allow port 22"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     "Name" = "packer_sg"
#   }
# }