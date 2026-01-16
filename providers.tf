provider "aws" {
    region = local.region
}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">=6.28.0"
        }
    }

    backend "s3" {
        bucket = "tf-cka-prep"
        key = "terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        #dynamodb_table = "tf-cka-states"
    }
}
