provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

resource "aws_instance" "hello-world" {
  ami           = "ami-0ce107ae7af2e92b5"
  instance_type = "t2.micro"
}
