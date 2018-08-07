consul {
  address = "localhost:8500"
  auth {
    enabled  = false
    username = ""
    password = ""
  }
  retry {
    enabled = true
    attempts = 12
    backoff = "250ms"

  }
  token = "w94RIMKUtQH1a4VJGN+t+vn1Y0nErc/ch93E1F1ZcHU="
}
reload_signal = "SIGHUP"
kill_signal = "SIGINT"
max_stale = "10m"
log_level = "warn"
# pid_file = "/consul-template/consul-template.pid"
wait {
  min = "5s"
  max = "10s"
}

vault {
  address = "http://localhost:8200"
  # This value can also be specified via the environment variable VAULT_TOKEN.
  token = "101abe5a-8615-55a3-154e-e1ff67cc86dd"
  renew_token = false
}

# deduplicate {
#   enabled = true
#   # prefix = "consul-template/dedup/"
# }

template {
  source      = "./consul/templates/configuration.ctmpl"
  destination = "./consul/output/configuration.properties"
}
