
# Run healthcheck
resource "null_resource" "healthcheck" {
  provisioner "local-exec" {
    on_failure  = fail
    command     = "chmod +x ./scripts/torque_onboard.sh && timeout 10m ./scripts/torque_onboard.sh"
    interpreter = ["/bin/bash", "-c"]

    environment = {
      URL           = var.URL
    }
  }
}
