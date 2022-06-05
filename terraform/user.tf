resource "aws_iam_user" "devops" {
  name = "devops"
  path = "/"
}

resource "aws_iam_user_ssh_key" "devops" {
  username   = aws_iam_user.devops.name
  encoding   = "SSH"
  public_key = var.ssh_keys
}

resource "aws_key_pair" "devops" {
  key_name = "devops-key"
  public_key = var.ssh_keys
}
