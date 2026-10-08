data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.network.outputs.vpc_id]
  }
  filter {
    name   = "map-public-ip-on-launch"
    values = [false]
  }
}