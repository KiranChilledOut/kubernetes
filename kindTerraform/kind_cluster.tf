provider "kind" {
  
}

provider "kubernetes" {
  config_path = pathexpand(var.kind_cluster_config_path)
}

# Create a cluster with kind of the name "test-cluster" with kubernetes version v1.27.1
resource "kind_cluster" "default" {
    name = var.kind_cluster_name
    kubeconfig_path = pathexpand(var.kind_cluster_config_path)
    wait_for_ready = true

    kind_config {
      kind = "cluster"
      api_version = "kind.x-k8s.io/v1alpha4"

      node {
        role = "control-pane"
        kubeadm_config_patches = [
            "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
        ]
        extra_port_mappings {
          container_port = 80
          host_port = 80
        }
        extra_port_mappings {
          container_port = 443
          host_port = 443
        }
      }
      node {
        role = "worker"
      }
    }
}