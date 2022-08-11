# #### bastion host data ####
# data "aws_ami" "bastion_host_ami" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   owners = ["099720109477"] # Canonical
# }

### vpc data ###
data "aws_vpc" "lab_vpc" {
  filter {
    name   = "tag:Name"
    values = ["lab_vpc"]
  }
}

## public subnet  ##
data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["public"]
  }
}

## private1 subnet ##
data "aws_subnet" "private1" {
  filter {
    name   = "tag:Name"
    values = ["private1"]
  }
}

## private2 subnet ##
data "aws_subnet" "private2" {
  filter {
    name   = "tag:Name"
    values = ["private2"]
  }
}