resource "aws_instance" "web_ec2" {
  ami           = data.aws_ami.amazon_linux_2.image_id    ### data #
  instance_type = var.instance_type                       ### variable #
  key_name      = aws_key_pair.first_key.key_name         ### resource #
  subnet_id     = aws_subnet.pub_subnet1.id               ### resource #                     
  vpc_security_group_ids = [aws_security_group.web_sg.id] 
  user_data     = file("web-userdata.sh")                 ### file function #
  associate_public_ip_address = "true"
  tags = {
    Name = "${var.env}-wordpress-web"
    Environment = var.env
    Project = var.project_name
     }
}


resource "aws_security_group" "web_sg" {
  description = "this is a sg for web instance"
  vpc_id      = aws_vpc.vpc_1.id 


ingress {
    description      = "SSH"
    from_port        = var.web_sg_ssh
    to_port          = var.web_sg_ssh
    protocol         = var.web_sg_protocol
    cidr_blocks      = [var.database_sg_cidr_block]
  }

ingress {
    description      = "HTTP"
    from_port        = var.web_sg_http
    to_port          = var.web_sg_http
    protocol         = var.web_sg_protocol
    cidr_blocks      = [var.database_sg_cidr_block]
  }
  

  egress {
    description      = "Custom TCP"
    from_port        = var.database_egress_port
    to_port          = var.database_egress_port
    protocol         = var.web_sg_protocol
    cidr_blocks      = [var.database_sg_cidr_block]
   }
   tags = {
    Name = "${var.env}-sg-web"
    Environment = var.env
    Project = var.project_name
   }
}


