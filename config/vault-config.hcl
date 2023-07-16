ui              = true
api_addr        = "https://vault-master:8200"
cluster_addr    = "https://vault-master:8201"
disable_mlock   = true
log_level       = "info"

listener "tcp" {
    address                     = "0.0.0.0:8200"
    cluster_address             = "0.0.0.0:8201"
    tls_cert_file               = "/vault/certs/vault-cert.pem"
    tls_key_file                = "/vault/certs/server-key.pem"
    tls_disable                 = "false"
    tls_disable_client_certs    = "true"
}

storage "file" {
    path            = "/vault/file"
}

#telemetry {
#  statsite_address = "0.0.0.0:8125"
#  disable_hostname = true
#}