resource "aws_security_group" "my-webserver" {
  name        = "webserver"
  description = "Allow HTTP from Anywhere"
  vpc_id      = "vpc-047f44281279cc5fc" #copy from your vpc, the security groups must all be in the same source VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "my-webserver"
    Site = "my-web-site"
  }
}
