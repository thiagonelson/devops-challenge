variable "region" {
  default     = "eu-west-3"
  description = "AWS region"
}

variable "ssh_keys" {
  type = string
  description = "Public key to export from local to AWS"
  sensitive = true
}

variable "pvt_key" {
  type = string
  default = "~/.ssh/id_ghub_devops"
  description = "(Ansible) Path to private key, to maintain servers."
  sensitive = true
}
