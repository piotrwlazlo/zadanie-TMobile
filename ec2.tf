resource "aws_instance" "server" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type 
  key_name = aws_key_pair.aws_key.key_name
  associate_public_ip_address = true
  subnet_id = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  
  tags = {
    Name = element(var.instance_tags, count.index)
  }
}

resource "null_resource" "run_ansible_playbook" {
  depends_on = [
    local_sensitive_file.private_key,
    local_file.ansible_inventory,
    aws_instance.server
  ]
  provisioner "local-exec" {
  command = "sleep 10"
  }

  provisioner "local-exec" {
    
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ansible/playbook.yml -i inventory.ini"
  }
}