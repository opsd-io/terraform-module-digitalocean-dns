variable "domain_name" {
  description = "The name of the domain."
  type        = string
  nullable    = false
}

variable "a_records" {
  description = "Domain A records (IPv4 address)."
  type = map(object({
    name  = optional(string, null)
    ttl   = optional(number, 300)
    value = string
  }))
  default = {}
}

variable "aaaa_records" {
  description = "Domain AAAA records (IPv6 address)."
  type = map(object({
    name  = optional(string, null)
    ttl   = optional(number, 300)
    value = string
  }))
  default = {}
}

variable "caa_records" {
  description = "Domain CAA records (Certification Authority Authorization)."
  type = map(object({
    name  = optional(string, null)
    ttl   = optional(number, 300)
    flags = optional(number, 0)
    tag   = string # valid values are "issue", "issuewild", or "iodef".
    value = string
  }))
  default = {}
}

variable "cname_records" {
  description = "Domain CNAME records (Canonical name record)."
  type = map(object({
    name  = optional(string, null)
    ttl   = optional(number, 600)
    value = string
  }))
  default = {}
}

variable "mx_records" {
  description = "Domain MX records (Mail exchange record)."
  type = map(object({
    name     = optional(string, null)
    ttl      = optional(number, 3600)
    priority = number
    value    = string
  }))
  default = {}
}

variable "ns_records" {
  description = "Domain NS records (Name server record)."
  type = map(object({
    name  = optional(string, null)
    ttl   = optional(number, 86400)
    value = string
  }))
  default = {}
}

variable "srv_records" {
  description = "Domain SRV records (Service locator)."
  type = map(object({
    name     = optional(string, null)
    ttl      = optional(number, 3600)
    priority = optional(number, 1)
    weight   = optional(number, 10)
    port     = string
    value    = string
  }))
  default = {}
}

variable "txt_records" {
  description = "Domain TXT records (Text record)."
  type = map(object({
    name  = optional(string, null)
    ttl   = optional(number, 300)
    value = string
  }))
  default = {}
}
