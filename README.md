# ec2-service-terraform
*** Complete script for beginners to start with terraform and create a instance in aws ***

/* Please fork a repo or ping me will create a branch for you.
And Feel free to suggest the changes or any updates.
Raise a Pr to merge your changes in my files */

Download latest terrafom and aws cli in your machine to run this script

Download-Install terraform -  https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli?wvideo=r3yytnk1pr
Downalod-Install aws-cli   -  https://youtu.be/jCHOsMPbcV0?t=36 

--> Now Configure your aws-cli with your own access and private keys using "aws configure" command <--

Use an IDE to write/edit the script in this repository

Download-Install Vsc       -  https://code.visualstudio.com/docs/setup/windows
--> After Downloading the vsc : go to Extensions -> search for "thefighterjet" and install the theme by thefighterjet <---

Commands to run the project

Go into the project folder and run

=>terraform init
/* 
Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/local from the dependency lock file
- Reusing previous version of hashicorp/aws from the dependency lock file
- Reusing previous version of hashicorp/tls from the dependency lock file
- Using previously-installed hashicorp/local v2.2.3
- Using previously-installed hashicorp/aws v4.48.0
- Using previously-installed hashicorp/tls v4.0.4

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary. */

=>terraform validate 
/* Success! The configuration is valid. */

=> terraform plan #To plan the service

=> terraform apply #To run the script
-> use -auto-approve to type yes automatically <-

To run this repo in Vsc:

Open vsc -> Open folder -> Select ec2-service-terraform -> Click open
Use terminal provided in the ide to run the above commands
