#Connection Azure
variable "client_id" {
    type = string
    default = "e3787d83-f23e-4023-b46e-5ed3923d3186"
}

variable "client_secret" {
    type = string
    default = "3c7a03d2-5e62-4bfd-b5a9-3a7a035291ed"
}

variable "tenant_id" {
    type = string
    default = "f8cdef31-a31e-4b4a-93e4-5f571e91255a"
}
variable "subscription_id" {
    type = string
    default = "value"
  
}

#connection AWS

variable "amis" {

    default = {
        "us-east-1" = "ami-085925f297f89fce1"
        "us-east-2" = "ami-07c1207a9d40bc3bd"
    }
  
}

#variable "cidrs_acesso_remoto" {
#
#    default = ["177.129.184.49/32","177.128.184.49/32"]
#  
#}

variable "key_name" {

    default = "osanam-terraform"  
}

#variable "subscription_id1" {
#    type = string
#    default = "136d602b-4347-468c-a58f-81eb3d9b389d"
#}
 