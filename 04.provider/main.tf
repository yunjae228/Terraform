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

data "aws_ami" "amzn2" {
  # 실행 계획 수립 시의 최신 버전
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  # "name" 필터로
  # "amazn2-ami-hvm*" 에 해당하는 외부 Data instance 가져옴
  filter {
    name   = "name"
    values = ["amazn2-ami-hvm*"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
