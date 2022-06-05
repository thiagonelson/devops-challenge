## Requirements
  - Terraform
  - Docker
  - Ansible
  - AWS Cli
  - Kubectl
  - Helm
  - Makefile

 *Needs to set values on .env file, model in .env.sample


[AWS CLI - Installing](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[Terraform - Installing](https://learn.hashicorp.com/tutorials/terraform/install-cli)

[Docker - Installing](https://docs.docker.com/get-docker/)

[Kubectl - Installing](https://kubernetes.io/docs/tasks/tools/)

[Helm - Installing](https://helm.sh/docs/helm/helm_install/)

Makefile

 - Linux (Ubuntu/Debian)
```bash
apt-get install build-essential
```
 - [Windows](http://gnuwin32.sourceforge.net/packages/make.htm)



## Infra

### Init

```bash
make tf-init
```

### Plan
```bash
make tf-plan
```

### Apply 
```bash
make tf-plan
```

### Destroy
```bash
make tf-destroy
```

## Ansible
```bash
ansible-playboy site.yml
```

