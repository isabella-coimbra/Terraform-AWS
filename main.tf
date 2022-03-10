#-------------------------------------------------------------------
# CREATE BUCKET
#-------------------------------------------------------------------

resource "aws_s3_bucket" "dev" {
  bucket = "terraform-dev"
  # acl    = "private"
}

#-------------------------------------------------------------------
# CREATE AN INSTANCE
#-------------------------------------------------------------------

resource "aws_instance" "dev" {
  count                  = 3
  ami                    = var.amis["us-east-1"]
  instance_type          = var.instance_type
  key_name               = "terraform-aws"

  tags  = {
    Name = "instance-dev-${count.index}"
  }

  vpc_security_group_ids = aws_security_group.access-ssh.id
  depends_on             = [aws_s3_bucket.dev, aws_dynamodb_table.dynamodb-dev]
}

#-------------------------------------------------------------------
# CREATE A DYNAMODB TABLE
#-------------------------------------------------------------------

resource "aws_dynamodb_table" "dynamodb-dev" {
  name           = "Dynamodb-DEV"
  billing_mode   = var.billing_mode
  hash_key       = "UserId"
  range_key      = "Title"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "Title"
    type = "S"
  }
}