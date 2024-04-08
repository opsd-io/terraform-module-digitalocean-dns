terraform {
  required_version = ">= 1.5.5"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.17.0"
    }
  }
}

resource "digitalocean_domain" "main" {
  name = var.domain_name
}

data "digitalocean_records" "domain_ns" {
  domain = digitalocean_domain.main.name

  filter {
    key    = "type"
    values = ["NS"]
  }

  filter {
    key    = "name"
    values = ["@"]
  }

  sort {
    key       = "value"
    direction = "asc"
  }

  depends_on = [digitalocean_domain.main]
}

resource "digitalocean_record" "a" {
  for_each = var.a_records

  domain = digitalocean_domain.main.id
  name   = coalesce(each.value.name, each.key)
  ttl    = each.value.ttl
  type   = "A"
  value  = each.value.value
}

resource "digitalocean_record" "aaaa" {
  for_each = var.aaaa_records

  domain = digitalocean_domain.main.id
  name   = coalesce(each.value.name, each.key)
  ttl    = each.value.ttl
  type   = "AAAA"
  value  = each.value.value
}

resource "digitalocean_record" "caa" {
  for_each = var.caa_records

  domain = digitalocean_domain.main.id
  name   = coalesce(each.value.name, each.key)
  ttl    = each.value.ttl
  type   = "CAA"
  flags  = each.value.flags
  tag    = each.value.tag
  value  = each.value.value
}

resource "digitalocean_record" "cname" {
  for_each = var.cname_records

  domain = digitalocean_domain.main.id
  name   = coalesce(each.value.name, each.key)
  ttl    = each.value.ttl
  type   = "CNAME"
  value  = format("%s.", trimsuffix(each.value.value, ".")) # data needs to end with a dot (.)
}

resource "digitalocean_record" "mx" {
  for_each = var.mx_records

  domain   = digitalocean_domain.main.id
  name     = coalesce(each.value.name, each.key)
  ttl      = each.value.ttl
  type     = "MX"
  priority = each.value.priority
  value    = format("%s.", trimsuffix(each.value.value, ".")) # data needs to end with a dot (.)
}

resource "digitalocean_record" "ns" {
  for_each = var.ns_records

  domain = digitalocean_domain.main.id
  name   = coalesce(each.value.name, each.key)
  ttl    = each.value.ttl
  type   = "NS"
  value  = format("%s.", trimsuffix(each.value.value, ".")) # data needs to end with a dot (.)
}

resource "digitalocean_record" "srv" {
  for_each = var.srv_records

  domain   = digitalocean_domain.main.id
  name     = coalesce(each.value.name, each.key)
  ttl      = each.value.ttl
  type     = "SRV"
  priority = each.value.priority
  weight   = each.value.weight
  port     = each.value.port
  value    = format("%s.", trimsuffix(each.value.value, ".")) # doesn't have to, but for sake of consistency
}

resource "digitalocean_record" "txt" {
  for_each = var.txt_records

  domain = digitalocean_domain.main.id
  name   = coalesce(each.value.name, each.key)
  ttl    = each.value.ttl
  type   = "TXT"
  value  = each.value.value
}
