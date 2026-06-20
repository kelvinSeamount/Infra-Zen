terraform {
  backend "s3" {
    bucket       = "zen-pharma-tf-state-kelvinseamount"  # Replace with your S3 bucket name
    key          = "envs/qa/terraform.tfstate"
    region       = "eu-central-1"  # Replace with your AWS region
    encrypt      = true
    use_lockfile = true   # S3 native locking — requires Terraform 1.10+, no DynamoDB needed
  }
}
