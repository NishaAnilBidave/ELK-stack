### ROUTE TABLE FOR KIBANA PUBLIC SUBNET ####
resource "aws_route_table" "kibana_public_route_table" {
  vpc_id = aws_vpc.lab_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_vpc_igw.id
  }
  tags = {
    Name = "kibana_public_route_table"
  }
}

### ROUTE TABLE FOR MONITORING PRIVATE SUBNET ####

resource "aws_route_table" "monitoring_private_route_table" {
  vpc_id = aws_vpc.lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "monitoring_private_route_table"
  }
}

### ROUTE TABLE FOR APPLICATION PRIVATE SUBNET
resource "aws_route_table" "application_private_route_table" {
  vpc_id = aws_vpc.lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "application_private_route_table"
  }
}

### ROUTE TABLE ASSOCIATION TO KIBANA PUBLIC SUBNET ###
resource "aws_route_table_association" "kibana_public" {
  subnet_id      = aws_subnet.kibana_public_subnet1.id
  route_table_id = aws_route_table.kibana_public_route_table.id
}

### ROUTE TABLE ASSOCIATION TO MONITORING PRIVATE SUBNET ##
resource "aws_route_table_association" "monitoring_private" {
  subnet_id      = aws_subnet.monitor_private_subnet1.id
  route_table_id = aws_route_table.monitoring_private_route_table.id
}

### ROUTE TABLE ASSOCIATION TO APPLICATION PRIVATE SUBNET ###
resource "aws_route_table_association" "application_private1" {
  subnet_id      = aws_subnet.app_private_subnet1.id
  route_table_id = aws_route_table.application_private_route_table.id
}

resource "aws_route_table_association" "application_private2" {
  subnet_id      = aws_subnet.app_private_subnet2.id
  route_table_id = aws_route_table.application_private_route_table.id
}
resource "aws_route_table_association" "application_private3" {
  subnet_id      = aws_subnet.app_private_subnet3.id
  route_table_id = aws_route_table.application_private_route_table.id
}