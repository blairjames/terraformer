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
- The "terraform" and "tf" commands are aliased to be invoked seamlessly via sudo (it is not necessary to prefix Terraform commands with sudo)
- The "terra" user has been granted explicit permission to execute Terraform commands only. Other actions requiring escalated privileges are outside the user's scope and therfore not permitted.
If you experience any issues please email me: [docker@blairjames.com](mailto:docker@blairjames.com)
 
![image](https://github.com/blairjames/terraformer/assets/32350627/f4de448f-f4cf-4643-849a-956b590f6643)

https://github.com/blairjames/terraformer/usage.webm
