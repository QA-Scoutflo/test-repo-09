locals {
  instance_name = "secure-ec2-instance"
  ebs_volume_tags = merge(var.instance_tags, {
    Name = "${local.instance_name}-root"
  })
  sg_name = "${local.instance_name}-sg"
}
