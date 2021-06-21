resource "aws_instance" "database_ec2" {
  ami           = data.aws_ami.amazon_linux_2.image_id        ### data #
  instance_type = var.instance_type                           ### variable #
  key_name      = aws_key_pair.first_key.key_name             ### resource #
  subnet_id     = aws_subnet.pri_subnet1.id                   ### resource #
  vpc_security_group_ids = [aws_security_group.database_sg.id]
  user_data     = data.template_file.sql_user_data.rendered   
  associate_public_ip_address = "true"
  tags = {
    Name = "${var.env}-Wordpress-Database"
    Environment = var.env
    Project = var.project_name
      }
  }
  
  resource "aws_security_group" "database_sg" {
  description = "this is a sg for database instance"
  vpc_id      = aws_vpc.vpc_1.id 


ingress {
    from_port        = var.database_ingress_port
    to_port          = var.database_ingress_port
    protocol         = var.database_ingress_protocol
    cidr_blocks      = [var.vpc_cidr_block]
  }

egress {
    from_port        = var.database_egress_port
    to_port          = var.database_egress_port
    protocol         = var.database_egress_protocol
    cidr_blocks      = [var.database_sg_cidr_block]
  }
  tags = {
    Name = "${var.env}-sg-database"
    Environment = var.env
    Project = var.project_name
   }
}
