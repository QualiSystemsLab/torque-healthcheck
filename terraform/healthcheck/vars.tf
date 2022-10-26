variable "URL" {
  type = string

  validation {
    error_message = "URL is invalid."
    condition     = can(regex("^http", var.URL))
  }
}


variable "TIMEOUT" {
  type    = number
  default = 2
}