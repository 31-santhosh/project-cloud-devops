resource "aws_instance" "devops_instance_1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = "webserver1"
  subnet_id = aws_subnet.devops_subnet_1.id

  vpc_security_group_ids = [
    aws_security_group.devops_security_group.id
  ]

  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker
    usermod -aG docker ubuntu
  EOF

  tags = {
    Name = "devops-instance-1"
  }
}

resource "aws_instance" "devops_instance_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = "webserver1"
  subnet_id = aws_subnet.devops_subnet_2.id

  vpc_security_group_ids = [
    aws_security_group.devops_security_group.id
  ]

  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker
    usermod -aG docker ubuntu
  EOF

  tags = {
    Name = "devops-instance-2"
  }
}