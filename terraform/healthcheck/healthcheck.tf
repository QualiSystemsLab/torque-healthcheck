
# Run healthcheck
resource "null_resource" "healthcheck" {
  provisioner "local-exec" {
    on_failure  = fail
    command     = "chmod +x ./scripts/healthcheck.sh && timeout 10m ./scripts/healthcheck.sh"
    interpreter = ["/bin/bash", "-c"]

    environment = {
      URL     = var.URL,
      TIMEOUT = var.TIMEOUT
    }
  }
}
