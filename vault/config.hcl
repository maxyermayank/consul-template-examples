consul {
  address = "locahost:8500"
  retry {
    enabled = true
    attempts = 12
    backoff = "250ms"

  }
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

deduplicate {
  enabled = true
  # prefix = "consul-template/dedup/"
}

template {
  source      = "./vault/templates/pki/cert.ctmpl"
  destination = "./vault/output/pki/mpatel.yourdomain.com.crt"
}

template {
  source      = "./vault/templates/pki/ca.ctmpl"
  destination = "./vault/output/pki/mpatel.yourdomain.com.ca.crt"
}

template {
  source      = "./vault/templates/pki/key.ctmpl"
  destination = "./vault/output/pki/mpatel.yourdomain.com.key"
}