data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "nsse-tf-state-files-guilermiiii"
    key    = "prod/network.tfstate"
    region = "us-east-1"
  }

}
