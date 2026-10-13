# Arquivo de variaveis
variable "region" {
  type        = string
  description = "regiao da aws"
}

variable "tags" {
  type = object({
    project     = string
    environment = string
  })
}

variable "assume_role" {
  type = object({
    arn         = string
    external_id = string
  })
}

variable "ec2_resources" {
  type = object({
    key_pair_name      = string,
    instance_profile   = string,
    instance_role      = string,
    worker_security_group = string
    control_plane_security_group = string
  })
}

variable "launch_template_control_plane" {
  type = object({
    name                                 = string
    disable_api_stop                     = bool
    disable_api_termination              = bool
    instance_type                        = string
    instance_initiated_shutdown_behavior = string
    ebs = object({
      volume_size           = number
      delete_on_termination = bool
    })
  })
}

variable "auto_scaling_group_control_plane" {
  type = object({
    name                      = string
    max_size                  = number
    min_size                  = number
    desired_capacity          = number
    health_check_grace_period = number
    health_check_type         = string
    instance_maintenance_policy = object({
      min_healthy_percentage = number
      max_healthy_percentage = number
    })
  })
}

variable "launch_template_worker" {
  type = object({
    name                                 = string
    disable_api_stop                     = bool
    disable_api_termination              = bool
    instance_type                        = string
    instance_initiated_shutdown_behavior = string
    ebs = object({
      volume_size           = number
      delete_on_termination = bool
    })
  })
}

variable "auto_scaling_group_worker" {
  type = object({
    name                      = string
    max_size                  = number
    min_size                  = number
    desired_capacity          = number
    health_check_grace_period = number
    health_check_type         = string
    instance_maintenance_policy = object({
      min_healthy_percentage = number
      max_healthy_percentage = number
    })
  })

}
