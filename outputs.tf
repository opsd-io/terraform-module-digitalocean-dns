output "id" {
  description = "The name of the domain."
  value       = digitalocean_domain.main.id
}

output "name" {
  description = "The name of the domain."
  value       = digitalocean_domain.main.name
}

output "urn" {
  description = "The uniform resource name (URN) of the domain."
  value       = digitalocean_domain.main.urn
}

output "ttl" {
  description = "The TTL value of the domain."
  value       = digitalocean_domain.main.ttl
}

output "name_servers" {
  description = "The name servers of the domain zone."
  value = [
    for rec in data.digitalocean_records.domain_ns.records : rec.value
    # "ns1.digitalocean.com.",
    # "ns2.digitalocean.com.",
    # "ns3.digitalocean.com.",
  ]
}

output "a_records" {
  description = "Domain A records (IPv4 address)."
  value = {
    for idx, rec in digitalocean_record.a : idx => {
      id    = rec.id
      ttl   = rec.ttl
      name  = rec.name
      fqdn  = rec.fqdn
      value = rec.value
    }
  }
}

output "aaaa_records" {
  description = "Domain AAAA records (IPv6 address)."
  value = {
    for idx, rec in digitalocean_record.aaaa : idx => {
      id    = rec.id
      ttl   = rec.ttl
      name  = rec.name
      fqdn  = rec.fqdn
      value = rec.value
    }
  }
}

output "caa_records" {
  description = "Domain CAA records (Certification Authority Authorization)."
  value = {
    for idx, rec in digitalocean_record.caa : idx => {
      id    = rec.id
      ttl   = rec.ttl
      name  = rec.name
      fqdn  = rec.fqdn
      flags = rec.flags
      tag   = rec.tag
      value = rec.value
    }
  }
}

output "cname_records" {
  description = "Domain CNAME records (Canonical name record)."
  value = {
    for idx, rec in digitalocean_record.cname : idx => {
      id    = rec.id
      ttl   = rec.ttl
      name  = rec.name
      fqdn  = rec.fqdn
      value = rec.value
    }
  }
}

output "mx_records" {
  description = "Domain MX records (Mail exchange record)."
  value = {
    for idx, rec in digitalocean_record.mx : idx => {
      id       = rec.id
      ttl      = rec.ttl
      name     = rec.name
      fqdn     = rec.fqdn
      priority = rec.priority
      value    = rec.value
    }
  }
}

output "ns_records" {
  description = "Domain NS records (Name server record)."
  value = {
    for idx, rec in digitalocean_record.ns : idx => {
      id    = rec.id
      ttl   = rec.ttl
      name  = rec.name
      fqdn  = rec.fqdn
      value = rec.value
    }
  }
}

output "srv_records" {
  description = "Domain SRV records (Service locator)."
  value = {
    for idx, rec in digitalocean_record.srv : idx => {
      id       = rec.id
      ttl      = rec.ttl
      name     = rec.name
      fqdn     = rec.fqdn
      priority = rec.priority
      weight   = rec.weight
      port     = rec.port
      value    = rec.value
    }
  }
}

output "txt_records" {
  description = "Domain TXT records (Text record)."
  value = {
    for idx, rec in digitalocean_record.txt : idx => {
      id    = rec.id
      ttl   = rec.ttl
      name  = rec.name
      fqdn  = rec.fqdn
      value = rec.value
    }
  }
}
