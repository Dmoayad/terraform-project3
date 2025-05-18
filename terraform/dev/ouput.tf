output "kube_config" {
  value = module.aks.aks.kube_config_raw
  sensitive = true
}