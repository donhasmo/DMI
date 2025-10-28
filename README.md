# DMI
DevOps Micro Internship with Pravin Mishra

Note:

Before apply,
 create your resource group, storage_account and container.
 Change the resource group, storage_account and container names in conf/az-backend.conf file.
 Change the subscription ID in root main.tf

STEPS TO APPLY:
Run `cd azure-cloud`
Run `terraform init --backend-config="conf/az-backend.conf"`
Run `terraform plan`
Run `terraform apply --auto-approve`

STEPS TO DESTROY:
Run `terraform destroy --auto-approve`


