#### keypair for both instances ####

resource "aws_key_pair" "first_key" {
    key_name          = "Terraform-Server-Key"
    public_key        = file("~/.ssh/id_rsa.pub")
}