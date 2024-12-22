# Terraform для K8S

[main.tf](main.tf) – подключение провайдеров.<br/>
[vpc.tf](vpc.tf) – созадние сети.<br/>
[vms.tf](vms.tf) – создание виртуальных машин.<br/>
[variables.tf](variables.tf) – настройка сети.<br/>

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_master_vm"></a> [master\_vm](#module\_master\_vm) | git::https://github.com/RedRatInTheHat/simple-vms.git | 510d533 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/RedRatInTheHat/simple-vpc.git | 36f6f3c |
| <a name="module_worker_vm"></a> [worker\_vm](#module\_worker\_vm) | git::https://github.com/RedRatInTheHat/simple-vms.git | 510d533 |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_has_nat"></a> [has\_nat](#input\_has\_nat) | Whether to enable NAT for the instance. | `bool` | `true` | no |
| <a name="input_image_family"></a> [image\_family](#input\_image\_family) | The image family to use for the instance. | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_is_allowed_stopping_for_update"></a> [is\_allowed\_stopping\_for\_update](#input\_is\_allowed\_stopping\_for\_update) | Whether to allow stopping the instance for updates. | `bool` | `true` | no |
| <a name="input_is_preemptible"></a> [is\_preemptible](#input\_is\_preemptible) | Whether the instance is preemptible. | `bool` | `true` | no |
| <a name="input_master_instance_name"></a> [master\_instance\_name](#input\_master\_instance\_name) | Name of the instance. | `string` | `"master"` | no |
| <a name="input_master_instances_count"></a> [master\_instances\_count](#input\_master\_instances\_count) | Number of instances to create. | `number` | `3` | no |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | The platform ID for the instance. | `string` | `"standard-v3"` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Resource configuration for the instance. | <pre>object({<br>    cores         = number<br>    memory        = number<br>    core_fraction = number<br>  })</pre> | <pre>{<br>  "core_fraction": 20,<br>  "cores": 2,<br>  "memory": 2<br>}</pre> | no |
| <a name="input_sa_key_file_path"></a> [sa\_key\_file\_path](#input\_sa\_key\_file\_path) | The path to the service account key file | `string` | `"~/key.json"` | no |
| <a name="input_vms_ssh_key"></a> [vms\_ssh\_key](#input\_vms\_ssh\_key) | SSH key for cluster vms user | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC. | `string` | `"vpc"` | no |
| <a name="input_vpc_subnets"></a> [vpc\_subnets](#input\_vpc\_subnets) | List of subnets for the VPC, including zone and CIDR. | <pre>list(object({<br>    vpc_zone = string<br>    vpc_cidr = string<br>  }))</pre> | <pre>[<br>  {<br>    "vpc_cidr": "192.168.10.0/24",<br>    "vpc_zone": "ru-central1-a"<br>  },<br>  {<br>    "vpc_cidr": "192.168.11.0/24",<br>    "vpc_zone": "ru-central1-b"<br>  },<br>  {<br>    "vpc_cidr": "192.168.12.0/24",<br>    "vpc_zone": "ru-central1-d"<br>  }<br>]</pre> | no |
| <a name="input_worker_instance_name"></a> [worker\_instance\_name](#input\_worker\_instance\_name) | Name of the instance. | `string` | `"worker"` | no |
| <a name="input_worker_instances_count"></a> [worker\_instances\_count](#input\_worker\_instances\_count) | Number of instances to create. | `number` | `3` | no |

## Outputs

No outputs.