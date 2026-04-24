resource "null_resource" "deploy" {

  triggers = {
    always_run = timestamp()
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("multiOS-key.pem")
    host        = var.ec2_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install docker.io -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo usermod -aG docker ubuntu",
      "sudo docker stop portfolio || true",
      "sudo docker rm portfolio || true",
      "sudo docker pull prakharvs/webserver:latest",
      "sudo docker run -d -p 80:80 --name portfolio prakharvs/webserver:latest"
    ]
  }
}