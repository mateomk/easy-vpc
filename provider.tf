terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.87.0"
        }
    }

    backend "s3" {
        bucket = "tf-prep-states"
        key = "state/terraform.tfstate"
        region = "us-west-2"
        encrypt = true
        dynamodb_table = "tf-prep-states"
    }
}
