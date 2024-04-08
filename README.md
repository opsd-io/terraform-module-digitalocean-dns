<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/opsd-io/terraform-module-template/main/.github/img/opsd-github-repo-dark-mode.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/opsd-io/terraform-module-template/main/.github/img/opsd-github-repo-light-mode.svg">
  <img alt="OPSd - the unique and effortless way of managing cloud infrastructure." src="https://raw.githubusercontent.com/opsd-io/terraform-module-template/update-tools/.github/img/opsd-github-repo-light-mode.svg" width="400">
</picture>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-template

## Introduction

Terraform module for DigitalOcean domain zone and its records.

## Usage

```hcl
module "example_zone" {
  source = "github.com/opsd-io/terraform-module-digitalocean-dns?ref=VERSION"

  domain_name = "your-company-domain.com"
  a_records = {
    www = {
      value = "11.22.33.44"
      ttl   = 60
    }
  }
}
```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_domain.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/domain) | resource |
| [digitalocean_record.a](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_record.aaaa](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_record.caa](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_record.cname](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_record.mx](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_record.ns](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_record.srv](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_record.txt](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_records.domain_ns](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/records) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Domain A records (IPv4 address). | <pre>map(object({<br>    name  = optional(string, null)<br>    ttl   = optional(number, 300)<br>    value = string<br>  }))</pre> | `{}` | no |
| <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records) | Domain AAAA records (IPv6 address). | <pre>map(object({<br>    name  = optional(string, null)<br>    ttl   = optional(number, 300)<br>    value = string<br>  }))</pre> | `{}` | no |
| <a name="input_caa_records"></a> [caa\_records](#input\_caa\_records) | Domain CAA records (Certification Authority Authorization). | <pre>map(object({<br>    name  = optional(string, null)<br>    ttl   = optional(number, 300)<br>    flags = optional(number, 0)<br>    tag   = string # valid values are "issue", "issuewild", or "iodef".<br>    value = string<br>  }))</pre> | `{}` | no |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Domain CNAME records (Canonical name record). | <pre>map(object({<br>    name  = optional(string, null)<br>    ttl   = optional(number, 600)<br>    value = string<br>  }))</pre> | `{}` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the domain. | `string` | n/a | yes |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | Domain MX records (Mail exchange record). | <pre>map(object({<br>    name     = optional(string, null)<br>    ttl      = optional(number, 3600)<br>    priority = number<br>    value    = string<br>  }))</pre> | `{}` | no |
| <a name="input_ns_records"></a> [ns\_records](#input\_ns\_records) | Domain NS records (Name server record). | <pre>map(object({<br>    name  = optional(string, null)<br>    ttl   = optional(number, 86400)<br>    value = string<br>  }))</pre> | `{}` | no |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | Domain SRV records (Service locator). | <pre>map(object({<br>    name     = optional(string, null)<br>    ttl      = optional(number, 3600)<br>    priority = optional(number, 1)<br>    weight   = optional(number, 10)<br>    port     = string<br>    value    = string<br>  }))</pre> | `{}` | no |
| <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records) | Domain TXT records (Text record). | <pre>map(object({<br>    name  = optional(string, null)<br>    ttl   = optional(number, 300)<br>    value = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | Domain A records (IPv4 address). |
| <a name="output_aaaa_records"></a> [aaaa\_records](#output\_aaaa\_records) | Domain AAAA records (IPv6 address). |
| <a name="output_caa_records"></a> [caa\_records](#output\_caa\_records) | Domain CAA records (Certification Authority Authorization). |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | Domain CNAME records (Canonical name record). |
| <a name="output_id"></a> [id](#output\_id) | The name of the domain. |
| <a name="output_mx_records"></a> [mx\_records](#output\_mx\_records) | Domain MX records (Mail exchange record). |
| <a name="output_name"></a> [name](#output\_name) | The name of the domain. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | The name servers of the domain zone. |
| <a name="output_ns_records"></a> [ns\_records](#output\_ns\_records) | Domain NS records (Name server record). |
| <a name="output_srv_records"></a> [srv\_records](#output\_srv\_records) | Domain SRV records (Service locator). |
| <a name="output_ttl"></a> [ttl](#output\_ttl) | The TTL value of the domain. |
| <a name="output_txt_records"></a> [txt\_records](#output\_txt\_records) | Domain TXT records (Text record). |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name (URN) of the domain. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
