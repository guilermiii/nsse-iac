resource "aws_launch_template" "this" {
  name = var.launch_template.name
  
  # pra ficar mais organizado, deixar os parametros"soltos" que são importantes, acima dos blocos
  instance_type = var.launch_template.instance_type
  
  # proteção para que não aconteça de alguem parar ou terminar uma instancia acidentalmente.
  disable_api_stop        = var.launch_template.disable_api_stop
  disable_api_termination = var.launch_template.disable_api_termination
# key_name                = aws_key_pair.this.key_name
  key_name                             = var.key_name
  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = var.launch_template.instance_initiated_shutdown_behavior
  vpc_security_group_ids               = var.vpc_security_group_ids

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = var.launch_template.ebs.volume_size
      delete_on_termination = var.launch_template.ebs.delete_on_termination
    }
  }

  iam_instance_profile {
    name = var.instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"

    tags = var.tags
  }
}
