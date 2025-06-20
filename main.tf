data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_security_group" "instance_sg" {
  name        = local.sg_name
  description = "Allow SSH from allowed CIDR"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.instance_tags, { Name = local.sg_name })
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.amazon_linux2.id
  instance_type               = "t3.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = false
  iam_instance_profile        = var.iam_instance_profile

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    tags        = local.ebs_volume_tags
  }

  tags = merge(var.instance_tags, { Name = local.instance_name })

  lifecycle {
    prevent_destroy = true
  }
}
