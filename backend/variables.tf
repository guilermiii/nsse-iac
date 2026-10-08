variable "region" {
  type        = string
  description = "Região que será utilizada na AWS"
}

variable "assume_role" {
  description = "Configurações para assumir um role na AWS"
  type = object({
    arn         = string
    external_id = string
  })
}
variable "tags" {
  type = map(string)
}

variable "remote_backend" {
  type = string
  description = "back-end remoto"
  }