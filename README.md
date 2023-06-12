# Terraformer

### Lean single-responsibility docker image to deploy Terraform IaC configurations

</br>

## How to use
- Git clone the repository [github.com/blairjames/terraformer.git](https://github.com/blairjames/terraformer.git)
- Add your Terraform configuration files to the "terraform_configs" directory
- Execute the "./build.sh" script to create the image locally
- Execute the "./run.sh" script to start the container
- Inside the image your Terraform configuration files are located in the "/terraform" directory
- The container executes commands as the "terra" user who is permitted to run Terraform commands requiring elevated privilege via sudo
- The "terraform" and "tf" commands are aliased to be invoked seamlessly via sudo (it is not nessesary to prefix Terraform commands with sudo)
- The "/terraform" directory is pre-initialised as part of the build process

![image](https://github.com/blairjames/terraformer/assets/32350627/f4de448f-f4cf-4643-849a-956b590f6643)
