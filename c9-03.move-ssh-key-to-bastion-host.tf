#create a null resopurce and provisoners
resource "null_resource" "null_copy_ssh_key_to_bastion" {
  depends_on = [
    azurerm_linux_virtual_machine.bastion_host_linuxvm
  ]
  connection {
    type = "ssh"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azzure.pem")
  }
  #this fil;e provisoner will copy one file inside your vm
  provisioner "file" {
    source = "ssh-keys/terraform-azzure.pem"
    destination = "/tmp/terraform-azzure.pem"
  }
  #inside your vm if you want to run some command while executing terraform apply
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-azzure.pem"
      #"ansible-playbook nameofplay.yaml"
      
    ]
  }
}