region = "us-east-1"

tags = {
  Project     = "not-so-simple-ecommerce"
  Environment = "production"
}

assume_role = {
  arn         = "arn:aws:iam::034797416371:role/terraform-role"
  external_id = "b1fa5fcf-f17e-46a7-a74c-45f8cc4004ad4eb6e967-1f03-4550-b7b0-f99897f956231e63b6c8-c8fb-4307-a7e9-381d5278ba2273306b1a-81f1-43ec-b4cd-5896cd3321ebfcbda06c-cc70-427b-9933-93704cb1220f"
}

remote_backend = "nsse-tf-state-files-guilermiiii"