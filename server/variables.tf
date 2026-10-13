# Arquivo de variaveis
variable "region" {
  type        = string
  description = "regiao da aws"
  default     = "us-east-1"
}

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
    ssh_security_group = string
  })
  default = {
    key_pair_name      = "nsse-production-key-pair"
    instance_role      = "nsse-production-instance-role"
    instance_profile   = "nsse-production-instance-profile"
    ssh_security_group = "allow-ssh"
  }
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
  default = {
    name                                 = "nsse-production-debian-control-plane-lt"
    instance_type                        = "t3.micro"
    disable_api_stop                     = true
    disable_api_termination              = true
    instance_initiated_shutdown_behavior = "terminate"
    ebs = {
      volume_size           = 20
      delete_on_termination = true
    }
  }
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
  default = {
    name                      = "nsse-production-control-plane-asg"
    max_size                  = 1
    min_size                  = 1
    desired_capacity          = 1
    health_check_grace_period = 180
    health_check_type         = "EC2"
    instance_maintenance_policy = {
      min_healthy_percentage = 100
      max_healthy_percentage = 100
    }
  }
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
  default = {
    name                                 = "nsse-production-debian-worker-lt"
    instance_type                        = "t3.micro"
    disable_api_stop                     = true
    disable_api_termination              = true
    instance_initiated_shutdown_behavior = "terminate"
    ebs = {
      volume_size           = 20
      delete_on_termination = true
    }
  }
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
  default = {
    name                      = "nsse-production-worker-asg"
    max_size                  = 1
    min_size                  = 1
    desired_capacity          = 1
    health_check_grace_period = 180
    health_check_type         = "EC2"
    instance_maintenance_policy = {
      min_healthy_percentage = 100
      max_healthy_percentage = 100
    }
  }
}
