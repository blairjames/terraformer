# Terraformer

### Lean single-responsibility docker image to deploy Terraform IaC configurations

</br>

![image](https://github.com/blairjames/terraformer/assets/32350627/cca74709-6605-41ac-8358-10904bfa8fdf)

## How to use
- Clone the repository: [github.com/blairjames/terraformer.git](https://github.com/blairjames/terraformer.git)
- Add your Terraform configuration files to the "terraform_configs" directory.
- Execute the "./build.sh" script to create the image locally.
- Execute the "./run.sh" script to start the container.
- Inside the image, your Terraform configuration files are located in the "/terraform" directory.
- The container executes commands as the "terra" user who is permitted to run Terraform commands requiring elevated    privileges via sudo.
- The "terraform" and "tf" commands have been aliased so they are invoked seamlessly via sudo (it is not necessary to prefix Terraform commands with sudo)
- The "terra" user has explicit permissions to execute Terraform commands only. Other actions requiring escalated privileges are outside the user's scope of operation and are, therefore, not permitted. 

*If you experience any issues please email me at: [docker@blairjames.com](mailto:docker@blairjames.com)*

[![Terraformer How-to Demonstration Video](https://github-production-user-asset-6210df.s3.amazonaws.com/32350627/245363606-b459eef2-1d96-4c03-a96b-4a5d6d9eec62.png)](https://www.youtube.com/watch?v=_0BYwJkc088 "Terraformer How-to Demonstration Video")
