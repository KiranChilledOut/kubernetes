variable kind_cluster_config_path {
    type = string
    description = "The location where this cluster's kubeconfig will be saved to"   
    default = "~/.kube/config"
}

variable "kind_cluster_name" {
  type = string
  description = "Name of the cluster"
  default = "terrafromkindcluster"
}

variable "ingress_nginx_helm_version" {
  type = string
  description = "The helm version for nginx ingress controller"
  default = "4.10.1"
}

variable "ingress_nginx_namespace" {
  type = string
  description = "The nginx ingress namespace"
  default = "ingress-nginx"
}
