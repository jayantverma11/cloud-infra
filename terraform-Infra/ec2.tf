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
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  user_data = data.template_file.user_data.rendered

  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_Name
  }
}
