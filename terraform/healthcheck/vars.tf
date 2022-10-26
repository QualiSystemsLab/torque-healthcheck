variable "SANDBOX_ID" {
  default = "test"
}

variable "URL" {
  type      = string
  default   = "http://frontend-linux-app-vvpjrf7csk9y.azurewebsites.net/ "

  validation {
    error_message = "URL is invalid."
    condition = can(regex("^http", var.URL))
  }
}