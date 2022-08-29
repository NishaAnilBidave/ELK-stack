variable "vpc_cidr" {
  description = " Variable to declare VPC CIDR range"
  default     = "192.168.0.0/16"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "lab_vpc"
}

variable "kibanasub_public1_cidr" {
  description = "This is the CIDR range for Kibana public subnet "
  default     = "192.168.1.0/24"
}

variable "monitorsub_private1_cidr" {
  description = "This is the CIDR range for Monitor private subnet "
  default     = "192.168.2.0/24"
}

variable "appsub_private1_cidr" {
  description = "This is the CIDR range for Application private subnet 1"
  default     = "192.168.3.0/24"
}


variable "appsub_private2_cidr" {
  description = "This is the CIDR range for Application private subnet 2"
  default     = "192.168.4.0/24"
}

variable "appsub_private3_cidr" {
  description = "This is the CIDR range for Application private subnet 1"
  default     = "192.168.5.0/24"
}

variable "internet_gateway_name" {
  description = "Name of internet gateway "
  default     = "lab_vpc_igw"
}
variable "elasticsearch_ami_id" {
    description = "This is my ami id for ElasticSearch"
    type        = string
}
variable "logstash_ami_id" {
    description = "This is my ami id for Logstash"
    type        = string
}
variable "beats_ami_id" {
    description = "This is my ami id for Demo1 server for filebeat"
    type        = string
}
variable "kibana_ami_id" {
    description = "This is my ami id for Kibana"
    type        = string
}



