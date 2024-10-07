## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| authorization\_rules | List of namespace authorization rules. | `any` | `[]` | no |
| capacity | The number of message units. | `number` | `0` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| location | The name of an existing resource group. | `string` | n/a | yes |
| managedby | ManagedBy, eg ''. | `string` | `""` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| queues | List of queues. | `any` | `[]` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| resource\_group\_name | The name of an existing resource group. | `string` | n/a | yes |
| sku | The SKU of the namespace. The options are: `Basic`, `Standard`, `Premium`. | `string` | `"Standard"` | no |
| topics | List of topics. | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The namespace ID. |
| name | The namespace name. |

