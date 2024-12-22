# Terraform для K8S

[main.tf](main.tf) – подключение провайдеров.<br/>
[vpc.tf](vpc.tf) – созадние сети.<br/>
[variables.tf](variables.tf) – настройка сети.<br/>

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | git::https://github.com/RedRatInTheHat/simple-vpc.git | 36f6f3c |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_sa_key_file_path"></a> [sa\_key\_file\_path](#input\_sa\_key\_file\_path) | The path to the service account key file | `string` | `"~/key.json"` | no |

## Outputs

No outputs.
