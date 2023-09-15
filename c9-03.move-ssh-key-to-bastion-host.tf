# Create a Null Resource and Provisioners
resource "null_resource" "null_copy_ssh_key_to_bastion" {
  depends_on = [azurerm_linux_virtual_machine.bastion_host_linuxvm]
# Connection Block for Provisioners to connect to Azure VM Instance
  connection {
    type = "ssh"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azzure.pem")
  }
  #null provisioned accept argument as connection
  #then provide provisioned accept aargument file remote-exec and local-execution
## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source = "ssh-keys/terraform-azzure.pem"
    destination = "/tmp/terraform-azzure.pem"
  }
## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-azzure.pem"
      "sudo touch /tmp/amdocs"
      #"java -jar [agent.jar](Jenkins URL/jnlpJars/agent.jar) -jnlpUrl Jenkins URL/computer//jenkins-agent.jnlp -secret 9b52b3f7ad1fb603bee7315d0644adc9"
    ]
  }
}





# Creation Time Provisioners - By default they are created during resource creations (terraform apply)
# Destory Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)