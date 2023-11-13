
resource "aws_instance" "server" {
  ami           = "ami-098940df4d3292e9a"
  instance_type = var.instance_type
  tags = {
    Name = "TestWebServer"
  }
  user_data = <<-EOF
    #!/bin/bash
    yum install -y nginx1.12
    systemctl start nginx
EOF
}
