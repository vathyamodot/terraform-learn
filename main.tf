provider "aws" {
    access_key = "AKIAQ5F7KT6VJVPB7WXF"
    secret_key = "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"
    region = "us-east-2"
}

variable "subnet_cidr_block" {
    description = "CIDR block for Subnet"
}

resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name: "vpc-dev",
        vpc_env: "dev"
    }
}

resource "aws_subnet" "development-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "us-east-2a"

    tags = {
        Name: "subnet-1-dev"
    }
}