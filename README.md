# Terraform для K8S

[main.tf](main.tf) – подключение провайдеров.<br/>
[vpc.tf](vpc.tf) – созадние сети.<br/>
[vms.tf](vms.tf) – создание виртуальных машин.<br/>
[hosts.tf](hosts.tf) – настройка автосборки файла hosts для kubespray.<br/>
[application-load-balancer.tf](application-load-balancer.tf) – создание application balancer.
[variables.tf](variables.tf) – настройка.<br/>

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.2 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ab"></a> [ab](#module\_ab) | git::https://github.com/RedRatInTheHat/simple-ab.git | 5a42be1 |
| <a name="module_bastion_vm"></a> [bastion\_vm](#module\_bastion\_vm) | git::https://github.com/RedRatInTheHat/simple-vms.git | 1a892e1 |
| <a name="module_master_vm"></a> [master\_vm](#module\_master\_vm) | git::https://github.com/RedRatInTheHat/simple-vms.git | 1a892e1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/RedRatInTheHat/simple-vpc.git | bdf6240 |
| <a name="module_worker_vm"></a> [worker\_vm](#module\_worker\_vm) | git::https://github.com/RedRatInTheHat/simple-vmg.git | 3fef736 |

## Resources

| Name | Type |
|------|------|
| [local_file.inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_backend_group_name"></a> [alb\_backend\_group\_name](#input\_alb\_backend\_group\_name) | The name of the ALB Backend Group. | `string` | `"alb-bg"` | no |
| <a name="input_alb_load_balancer_name"></a> [alb\_load\_balancer\_name](#input\_alb\_load\_balancer\_name) | The name of the ALB Load Balancer. | `string` | `"alb-1"` | no |
| <a name="input_alb_router_name"></a> [alb\_router\_name](#input\_alb\_router\_name) | The name of the ALB HTTP Router. | `string` | `"alb-router"` | no |
| <a name="input_alb_virtual_host_name"></a> [alb\_virtual\_host\_name](#input\_alb\_virtual\_host\_name) | The name of the ALB Virtual Host. | `string` | `"alb-host"` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Bastion Host instance name | `string` | `"bastion"` | no |
| <a name="input_bastion_number"></a> [bastion\_number](#input\_bastion\_number) | Number of bastion hosts (why would you need more than one? who knows) | `string` | `1` | no |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_has_nat"></a> [has\_nat](#input\_has\_nat) | Whether to enable NAT for the instance. | `bool` | `false` | no |
| <a name="input_has_nat_for_bastion"></a> [has\_nat\_for\_bastion](#input\_has\_nat\_for\_bastion) | Whether bastion host has public ip. But of course! | `bool` | `true` | no |
| <a name="input_healthcheck_host"></a> [healthcheck\_host](#input\_healthcheck\_host) | 'Host' header for healthcheck | `string` | `"ingress.test.ru"` | no |
| <a name="input_http_backend_name"></a> [http\_backend\_name](#input\_http\_backend\_name) | The name of the HTTP backend. | `string` | `"backend-1"` | no |
| <a name="input_image_family"></a> [image\_family](#input\_image\_family) | The image family to use for the instance. | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_inventory_path"></a> [inventory\_path](#input\_inventory\_path) | The path where inventory file will be created at | `string` | `"inventory.yaml"` | no |
| <a name="input_is_allowed_stopping_for_update"></a> [is\_allowed\_stopping\_for\_update](#input\_is\_allowed\_stopping\_for\_update) | Whether to allow stopping the instance for updates. | `bool` | `true` | no |
| <a name="input_is_preemptible"></a> [is\_preemptible](#input\_is\_preemptible) | Whether the instance is preemptible. | `bool` | `true` | no |
| <a name="input_listener_name"></a> [listener\_name](#input\_listener\_name) | The name of the listener for the Load Balancer. | `string` | `"alb-listener"` | no |
| <a name="input_master_instance_name"></a> [master\_instance\_name](#input\_master\_instance\_name) | Name of the instance. | `string` | `"master"` | no |
| <a name="input_master_instances_count"></a> [master\_instances\_count](#input\_master\_instances\_count) | Number of instances to create. | `number` | `3` | no |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | The platform ID for the instance. | `string` | `"standard-v3"` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Resource configuration for the instance. | <pre>object({<br>    cores         = number<br>    memory        = number<br>    core_fraction = number<br>  })</pre> | <pre>{<br>  "core_fraction": 20,<br>  "cores": 2,<br>  "memory": 2<br>}</pre> | no |
| <a name="input_route_name"></a> [route\_name](#input\_route\_name) | The name of the route within the Virtual Host. | `string` | `"route-1"` | no |
| <a name="input_sa_key_file_path"></a> [sa\_key\_file\_path](#input\_sa\_key\_file\_path) | The path to the service account key file | `string` | `"~/key.json"` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | The ID of the service account | `string` | n/a | yes |
| <a name="input_vms_ssh_key"></a> [vms\_ssh\_key](#input\_vms\_ssh\_key) | SSH key for cluster vms user | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC. | `string` | `"vpc"` | no |
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | List of public subnets for the VPC, including zone and CIDR. | <pre>list(object({<br>    vpc_zone = string<br>    vpc_cidr = string<br>  }))</pre> | <pre>[<br>  {<br>    "vpc_cidr": "192.168.10.0/24",<br>    "vpc_zone": "ru-central1-a"<br>  },<br>  {<br>    "vpc_cidr": "192.168.11.0/24",<br>    "vpc_zone": "ru-central1-b"<br>  },<br>  {<br>    "vpc_cidr": "192.168.12.0/24",<br>    "vpc_zone": "ru-central1-d"<br>  }<br>]</pre> | no |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | List of private subnets for the VPC, including zone and CIDR. | <pre>list(object({<br>    vpc_zone = string<br>    vpc_cidr = string<br>  }))</pre> | <pre>[<br>  {<br>    "vpc_cidr": "192.168.13.0/24",<br>    "vpc_zone": "ru-central1-d"<br>  }<br>]</pre> | no |
| <a name="input_worker_instance_name"></a> [worker\_instance\_name](#input\_worker\_instance\_name) | Name of the instance. | `string` | `"workers"` | no |
| <a name="input_worker_instances_count"></a> [worker\_instances\_count](#input\_worker\_instances\_count) | Number of instances to create. | `number` | `3` | no |
| <a name="input_workers_tg_name"></a> [workers\_tg\_name](#input\_workers\_tg\_name) | Name of the Target Group. | `string` | `"workers-tg"` | no |

## Outputs

No outputs.
