#Linux vm input varaible file
variable "web_linuxvm_instance_count"{
  type = map(string)
  default = {
      "vm1" = "1022",
      "vm2" = "2022"
  }
}
variable "lb_inbound_nat_ports"{
  type = list(string)
  default = ["1022", "2022", "3022", "4022", "5022"]
}