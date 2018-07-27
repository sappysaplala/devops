# Build Kubernetes based on the Oracle Linux Container Services for use with Kubernetes.
# The current release of Oracle Linux Container Services for use with Kubernetes is based on Kubernetes
# version 1.8.4, as released upstream.
#
# Note: Initial version created by: cameron.senese@oracle.com

### Credentials ###
variable "a00_idIdcs" {
  description = "Cloud Platform Tenancy Mode: Cloud Account with IDCS (=true) or Traditional (=false)"
  default     = "true"
  #user input: false
  #tenancy: idcs
}

variable "a01_ociUser" {
  description = "Username (Compute) - OCI-Classic user account with Compute_Operations rights"
  default     = "lisa.jones"
  #user input: true
  #tenancy: idcs
}

variable "a02_ociPass" {
  description = "Password (Compute) - OCI-Classic user account with Compute_Operations rights"
  default     = "mushy@5BoXeR"
  #user input: true
  #tenancy: idcs
}

variable "a03_idDomain" {
  description = "Identity Domain (Compute) - Compute Service Instance ID (IDCS)"
  default     = "590582632"
  #user input: true
  #tenancy: idcs
  #location - idcs: compute classic | service details | additional information | service instance id
}

#variable "a031_idIdcsTenant" {
#  description = "IDCS tenant name"
#  default     = "insert-here.."
#  #user input: true
#  #tenancy: idcs
#  #location: compute classic | service details | additional information | identity service id
#}

variable "a04_apiEndpoint" {
  description = "Api Endpoint (Compute) - OCI-Classic Compute tenancy REST Endpoint URL"
  default     = "https://api-Z56.compute.us6.oraclecloud.com/"
  #user input: true
  #tenancy: idcs
  #location: compute classic | service details | additional information | rest endpoint
}

  variable "a05_containerRepoUser" {
      description = "Username - Oracle Container Registry"
      default     = "cameron@senese.id.au"
  }
  variable "a06_containerRepoPass" {
      description = "Password - Oracle Container Registry"
      default     = "Passw0rd321"
  }

#variable "a06_stgUser" {
#  description = "Username (Object Storage) - OCI-Classic Object Storage user account"
#  default     = "insert-here.."
#  #user input: true
#  #tenancy: idcs
#}

#variable "a07_stgPass" {
#  description = "Password (Object Storage) - OCI-Classic Object Storage user account"
#  default     = "insert-here.."
#  #user input: true
#  #tenancy: idcs
#}

#variable "a08_stgEndpointAuth" {
#  description = "Api Endpoint (Object Storage) - OCI-Classic Object Storage Auth v1 REST Endpoint URL"
#  default     = "insert-here.."
#  #user input: true
#  #tenancy: idcs
#  #location: storage classic | service details | additional information | auth v1 endpoint
#}

#variable "a09_stgEndpoint" {
#  description = "Api Endpoint (Object Storage) - OCI-Classic Object Storage REST Endpoint URL"
#  default     = "insert-here.."
#  #user input: true
#  #tenancy: idcs
#  #location: storage classic | service details | additional information | rest endpoint
#  #note: used by storage classic rest authentication (`/Storage-gse00013716` portion)
#}

### Environments ###
#variable "e00_PaasDbcs" {
#  description = "Oracle DBCS install for OMCe (version:12.1.0.2, edition:EE, shape:oc3, name:OMCe-DB)"
#  #user input: true
#  #data: `true` or `false`
#  #tenancy: idcs
#  #note: used to determine whether to install dbcs paas service
#}

#variable "e01_PaasOmce" {
#  description = "Oracle Mobile Cloud - Enterprise (template: OMCe-T, requests: 100, schema prefix: OMCEWORDEV)"
#  #user input: true
#  #data: `true` or `false`
#  #tenancy: idcs
#  #note: used to determine whether to install omce paas service
#}

#variable "e10_envName" {
#  description = "Alpha code used to name PaaS & IaaS resources.."
#  default     = "OMCe"
#  #user input: true
#  #data: string as 4 digit alpha, e.g. `OMCe`
#  #tenancy: idcs
#  #note: used to name the paas & iaas resources
#}

#variable "e10_envNumber" {
#  description = "Numeric code used to name PaaS & IaaS resources.."
#  #default     = "001"
#  #user input: true
#  #data: string as 3 digit numeral, e.g. `001`
#  #tenancy: idcs
#  #note: used to name the paas & iaas resources
#}

  variable "e00_DashMonMet" {
      description = "Enhanced Dashboard, Monitoring, and Metrics (Include K8s dashboard v1.8.1, Grafana, Heapster, & InfluxDB)"
      default     = "false"
  }
  variable "e01_Fn" {
      description = "Functions as a Service (Include Fn FaaS)"
      default     = "false"
  }
  variable "e02_Ingress" {
      description = "Kubernetes Ingress (Include Traefik Ingress and sample applications)"
      default     = "true"
  }
  variable "e03_MicroSvc" {
      description = "Microservices Environment (Include WeaveScope Dashbord and E-Commerce application)"
      default     = "true"
  }
  variable "e04_SvcMesh" {
      description = "Service Mesh (Include Istio & BookInfo application)"
      default     = "false"
  }

### Keys ###
variable s00_sshUser {
  description = "Username - Account for ssh access to the image"
  default     = "opc"
  #user input: false
  #tenancy: idcs
}

variable s01_sshPrivateKey {
  description = "File location of the ssh private key"
  default     = "./ssh/id_rsa"
  #user input: false
  #tenancy: idcs
}

variable s02_sshPublicKey {
  description = "File location of the ssh public key"
  default     = "./ssh/id_rsa.pub"
  #user input: false
  #tenancy: idcs
}

### Naming TLAs ###
variable n00_mgtName {
  description = "Master/Management/Bastion node name"
  default     = "mst"
  #user input: false
  #data: string as 3 digit alpha, e.g. `mgt`
  #tenancy: idcs
  #note: used to name the iaas resources
}