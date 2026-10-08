data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "nsse-tf-state-files-devguina"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
  }

}
