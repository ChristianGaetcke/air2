#!/bin/bash
#########################################################################
# restart_terraform.sh                                                  #
#                                                                       #
#                                                                       #
#                                                                       #
#                                                                       #
#                                                                       #
#########################################################################
set -x
date
sh destroy.sh
terraform init
terraform validate
terraform plan
terraform apply -auto-approve | tee terraform_apply.txt
date
