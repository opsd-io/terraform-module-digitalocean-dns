module "example_zone" {
  source = "github.com/opsd-io/terraform-module-digitalocean-dns?ref=main"

  domain_name = "your-company-domain.com"
  a_records = {
    www = {
      value = "11.22.33.44"
      ttl   = 60
    }
    foo1 = {
      name  = "foo"
      value = "1.2.3.4"
    }
    foo2 = {
      name  = "foobar2.nope"
      value = "2.3.4.5"
    }
  }
  aaaa_records = {
    test = { value = "2a00:1450:401b:80d::200e" }
  }
  cname_records = {
    api = { value = "api.digitalocean.com." }
    web = { value = module.example_zone.a_records["www"].fqdn }
  }
  caa_records = {
    letsencrypt = { name = "@", value = "letsencrypt.org.", tag = "issue" }
  }
  mx_records = {
    main = { name = "@", priority = 5, value = "gmail-smtp-in.l.google.com" }
    alt1 = { name = "@", priority = 10, value = "alt1.gmail-smtp-in.l.google.com" }
    alt2 = { name = "@", priority = 20, value = "alt2.gmail-smtp-in.l.google.com" }
  }
  ns_records = {
    sub1 = { name = "sub", value = "ns1.google.com" }
    sub2 = { name = "sub", value = "ns2.google.com" }
    sub3 = { name = "sub", value = "ns3.google.com" }
  }
  srv_records = {
    xmpp = { name = "_xmpp._tcp", value = "server.example.com", port = 5223 }
  }
  txt_records = {
    spf    = { name = "@", value = "v=spf1 redirect=_spf.google.com" }
    google = { name = "@", value = "google-site-verification=...." }
    msg    = { value = "Hello world!" }
  }
}
