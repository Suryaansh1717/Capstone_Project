data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_instance" "monitored_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.default.ids[0]

  # Automatically generate CPU load for 10 minutes on boot so CloudWatch triggers ALARM
  user_data = <<-EOF
              #!/bin/bash
              dnf install -y stress-ng || yum install -y stress
              nohup stress-ng --cpu 2 --timeout 600s > /dev/null 2>&1 || nohup stress --cpu 2 --timeout 600s > /dev/null 2>&1 || (yes > /dev/null & yes > /dev/null &)
              EOF

  tags = {
    Name = "${var.project_name}-instance"
  }
}
