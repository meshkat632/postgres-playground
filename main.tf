data "external" "get_ip_addres_using_shell_dev" {
  program = ["bash","scripts/get_ip_port.sh"]
  query = {
    p_env = "dev"
  }
}

output "ip_address_for_dev" {
  value = data.external.get_ip_addres_using_shell_dev.result.ip_address
}

output "port_num_for_dev" {
  value = data.external.get_ip_addres_using_shell_dev.result.port_num
}