provider "aws" {
  region = "ap-south-1"
}

# 🔹 Variable to receive IP from Jenkins
variable "ec2_ip" {
  description = "Public IP of EC2 instance"
  type        = string
}

# 🔹 Deployment using SSH
resource "null_resource" "deploy" {

  # 🔥 Ensures this runs on every pipeline execution
  triggers = {
    always_run = timestamp()
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("multiOS-key.pem")   # make sure this exists in Jenkins workspace
    host        = var.ec2_ip
  }

  provisioner "remote-exec" {
    inline = [

      # Update & install Docker
      "sudo apt update -y",
      "sudo apt install docker.io -y",

      # Start Docker service
      "sudo systemctl start docker",
      "sudo systemctl enable docker",

      # Stop & remove old container (if exists)
      "sudo docker stop portfolio || true",
      "sudo docker rm portfolio || true",

      # Pull latest image
      "sudo docker pull prakharvs/webserver:latest",

      # Run container on port 80
      "sudo docker run -d -p 80:80 --name portfolio prakharvs/webserver:latest"
    ]
  }
}