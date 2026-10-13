module "ec2_control_plane_instances" {
  source = "./modules/ec2"

  launch_template = {
    name                                 = var.launch_template_control_plane.name
    disable_api_stop                     = var.launch_template_control_plane.disable_api_stop
    disable_api_termination              = var.launch_template_control_plane.disable_api_termination
    instance_type                        = var.launch_template_control_plane.instance_type
    instance_initiated_shutdown_behavior = var.launch_template_control_plane.instance_initiated_shutdown_behavior
    key_name                             = aws_key_pair.this.key_name
    image_id                             = data.aws_ami.this.image_id
    vpc_security_group_ids               = [aws_security_group.control_plane.id]
    instance_profile_name                = aws_iam_instance_profile.instance_profile.name
    user_data                            = filebase64("./cli/control-plane-user-data.sh")

    ebs = {
      volume_size           = var.launch_template_control_plane.ebs.volume_size
      delete_on_termination = var.launch_template_control_plane.ebs.delete_on_termination
    }
  }

  auto_scaling_group = {
    name                      = var.auto_scaling_group_control_plane.name
    max_size                  = var.auto_scaling_group_control_plane.max_size
    min_size                  = var.auto_scaling_group_control_plane.min_size
    desired_capacity          = var.auto_scaling_group_control_plane.desired_capacity
    health_check_grace_period = var.auto_scaling_group_control_plane.health_check_grace_period
    health_check_type         = var.auto_scaling_group_control_plane.health_check_type
    vpc_zone_identifier       = data.aws_subnets.private_subnets.ids

    instance_maintenance_policy = {
      min_healthy_percentage = var.auto_scaling_group_control_plane.instance_maintenance_policy.min_healthy_percentage
      max_healthy_percentage = var.auto_scaling_group_control_plane.instance_maintenance_policy.max_healthy_percentage
    }
  }

  tags = var.tags
}
