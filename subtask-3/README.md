# AWS EC2 instance
First we will deal with creating an EC2 instance we can make it using *console* or in case of full automation we can use *ansible*
here we used console using the following steps:-
* Click on the "Launch Instance" button to start the instance creation wizard.
* Choose an Amazon Machine Image (AMI) for Ubuntu. You can search for "Ubuntu" in the search bar and select the version you want to use.
* Choose an instance type. This will depend on your needs and the resources required by your application (we choosed free tier).
* Configure instance details. Here, you can choose the number of instances you want to launch, the VPC and subnet settings, and other advanced settings.
* Configure security group. Here, you can configure the security group settings for your EC2 instance. Make sure to allow SSH and HTTP.
* Create a key pair. You will be prompted to create a new key pair or use an existing one. This key pair will be used to securely connect to your EC2 instance.
* Launch the instance. After creating the key pair, click on the "Launch Instances" button to launch the EC2 instance.
