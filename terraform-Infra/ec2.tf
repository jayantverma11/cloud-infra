data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
  vars = {
    GH_TOKEN    = var.GH_TOKEN
    GH_USERNAME = var.GH_USERNAME
  }
}



resource "aws_instance" "my_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  user_data = data.template_file.user_data.rendered

  tags = {
    Name = var.instance_Name
  }
}
