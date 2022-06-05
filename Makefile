include .env
TERRAFORM_VERSION=light                                                                              
PWD=$${PWD}                                                                                          
AWS_ACCESS_KEY_ID=$(shell cat ../credenciais_aws.txt|grep id|awk '{print $$2}')                      
AWS_SECRET_ACCESS_KEY=$(shell cat ../credenciais_aws.txt |grep key|awk '{print $$2}') 

tf-init:
	docker run -it --rm -v ~/.aws:/root/.aws -v $${PWD}/terraform:/app -w /app -e TF_VAR_ssh_keys="${TF_VAR_ssh_keys}" -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} hashicorp/terraform:${TERRAFORM_VERSION} init -upgrade=true

tf-plan:
	docker run -it --rm -v ~/.aws:/root/.aws -v $${PWD}/terraform:/app -w /app -e TF_VAR_ssh_keys="${TF_VAR_ssh_keys}" -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} hashicorp/terraform:${TERRAFORM_VERSION} plan -out plano

tf-apply:
	docker run -it --rm -v ~/.aws:/root/.aws -v $${PWD}/terraform:/app -w /app -e TF_VAR_ssh_keys="${TF_VAR_ssh_keys}" -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} hashicorp/terraform:${TERRAFORM_VERSION} apply "plano"

tf-destroy:
	docker run -it --rm -v ~/.aws:/root/.aws -v $${PWD}/terraform:/app -w /app -e TF_VAR_ssh_keys="${TF_VAR_ssh_keys}" -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} hashicorp/terraform:${TERRAFORM_VERSION} destroy
