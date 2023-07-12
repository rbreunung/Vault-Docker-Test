log_level = "info"
log_file  = "logs/agent/"

vault {
  address = "https://grumpel.fritz.box:8200"
}

listener "tcp" {
  address = "127.0.0.1:8100"
  tls_disable = true
}