resource "aws_launch_template" "this" {
  name                                 = var.launch_template.name
  disable_api_stop                     = var.launch_template.disable_api_stop # proteção para que não aconteça de alguem parar/terminar instancias acidentalmente.
  disable_api_termination              = var.launch_template.disable_api_termination
  instance_type                        = var.launch_template.instance_type
  instance_initiated_shutdown_behavior = var.launch_template.instance_initiated_shutdown_behavior
  key_name                             = var.launch_template.key_name
  image_id                             = var.launch_template.image_id
  vpc_security_group_ids               = var.launch_template.vpc_security_group_ids
  user_data                            = var.launch_template.user_data

  iam_instance_profile {
    name = var.launch_template.instance_profile_name
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.launch_template.ebs.volume_size
      delete_on_termination = var.launch_template.ebs.delete_on_termination
    }
  }
}
