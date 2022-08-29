packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_id" {
  type    = string
  default = "vpc-075b79f5af749b863"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0c43c39861e2b0e92"
}

variable "packer_sg" {
  type    = string
  default = "sg-0e2be1f5e4a45a734""
}

source "amazon-ebs" "kibana" {
  ami_name                    = "data.aws_ami.ubuntu.id"
  instance_type               = t3.micro
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.packer_sg.id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = "true"
  force_delete_snapshot       = "true"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  // ssh_username = "elk-kibana"
  tags = {
    Name = "kibana-ami"
  }
}

build {
  name = "packer-kibana"
  sources = [
    "source.amazon-ebs.elk-kibana"
  ]
  //   provisioner "ansible" {
  //     playbook_file = "./playbooks/kibana.yml"
  //   }
}

source "amazon-ebs" "elasticsearch" {
  ami_name                    = "data.aws_ami.ubuntu.id"
  instance_type               = m4.large
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.packer_sg.id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = "true"
  force_delete_snapshot       = "true"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    Name = "elasticsearch-ami"
  }
}

build {
  name = "packer-elasticsearch"
  sources = [
    "source.amazon-ebs.elk-es"
  ]
  provisioner "ansible" {
    playbook_file = "./playbooks/es.yml"
  }
}

source "amazon-ebs" "logstash" {
  ami_name                    = "data.aws_ami.ubuntu.id"
  instance_type               = m4.large
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.packer_sg.id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = "true"
  force_delete_snapshot       = "true"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    Name = "logstash-ami"
  }
}

build {
  name = "packer-logstash"
  sources = [
    "source.amazon-ebs.elk-logstash"
  ]
  // provisioner "ansible" {
  //   playbook_file = "./playbooks/logstash.yml"
  // }
}
}