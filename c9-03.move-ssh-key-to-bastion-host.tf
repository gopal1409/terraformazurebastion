
# Create a Null Resource and Provisioners
resource "null_resource" "previous" {
  depends_on = [azurerm_linux_virtual_machine.bastion_host_linuxvm]
# Connection Block for Provisioners to connect to Azure VM Instance
  connection {
    type = "rdp"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    password ="password"
  }
  #null provisioned accept argument as connection
  #then provide provisioned accept aargument file remote-exec and local-execution
## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source = "script/domain.ps"
    destination = "/tmp/ps1.ps"
  }
## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "/tmp/ds1.ps"
      
      #"sudo touch /tmp/amdocs"
      #"java -jar [agent.jar](Jenkins URL/jnlpJars/agent.jar) -jnlpUrl Jenkins URL/computer//jenkins-agent.jnlp -secret 9b52b3f7ad1fb603bee7315d0644adc9"
    ]
  }
  create_duration=100s
}

resource "null_resource" "next" {
  depends_on = [ tome_sleep.wait_100_second ]
  connection {
    type = "rdp"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    password ="password"
  }
  #null provisioned accept argument as connection
  #then provide provisioned accept aargument file remote-exec and local-execution
## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source = "script/domain.ps"
    destination = "/tmp/ps1.ps"
  }
## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "/tmp/ds1.ps"
      
      #"sudo touch /tmp/amdocs"
      #"java -jar [agent.jar](Jenkins URL/jnlpJars/agent.jar) -jnlpUrl Jenkins URL/computer//jenkins-agent.jnlp -secret 9b52b3f7ad1fb603bee7315d0644adc9"
    ]
  }
}





# Creation Time Provisioners - By default they are created during resource creations (terraform apply)
# Destory Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)
*/