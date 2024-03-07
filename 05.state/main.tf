terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "ap-northeast-2"

  # 시크릿과 액세스키는 시스템 환경 변수로 별도 설정
  # access_key = "AWS_ACCESS_KEY_ID"
  # secret_key = "AWS_SECRET_ACCESS_KEY"
}

resource "aws_instance" "web" {
  ami           = "ami-08d0e13d30abef253"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
