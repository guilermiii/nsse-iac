
variable "tags" {
  type = object({
    project     = string
    environment = string
  })
  default = {
    project     = "nsse-project"
    environment = "production"
  }
}

variable "vpc_zone_identifier" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "image_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "instance_profile_name" {
  type = string
}
variable "launch_template" {
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

variable "auto_scaling_group" {
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


