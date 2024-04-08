module "example_zone" {
  source = "github.com/opsd-io/terraform-module-digitalocean-dns?ref=main"

  domain_name = "your-company-domain.com"
  a_records = {
    www = {
      value = "11.22.33.44"
      ttl   = 60
    }
  }
}
