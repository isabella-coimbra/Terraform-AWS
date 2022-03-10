resource "aws_security_group" "access-ssh" {
  name          = "access-ssh"
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.cdirs_remote_access
  }
  tags = {
    Name = "ssh"
  }
}
