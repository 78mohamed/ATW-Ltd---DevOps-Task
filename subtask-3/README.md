# AWS EC2 instance
First we will deal with creating an EC2 instance we can make it using *console* or in case of full automation we can use *ansible*
here we used console using the following steps:-
* Click on the "Launch Instance" button to start the instance creation wizard.
* Choose an Amazon Machine Image (AMI) for Ubuntu. You can search for "Ubuntu" in the search bar and select the version you want to use.
* Choose an instance type. This will depend on your needs and the resources required by your application (we choosed free tier).
* Configure instance details. Here, you can choose the number of instances you want to launch, the VPC and subnet settings, and other advanced settings and make sure to enable public ip option.
* Configure security group. Here, you can configure the security group settings for your EC2 instance. Make sure to allow SSH and HTTP.
* Create a key pair. You will be prompted to create a new key pair or use an existing one. This key pair will be used to securely connect to your EC2 instance.
* Launch the instance. After creating the key pair, click on the "Launch Instances" button to launch the EC2 instance.


# SSH with AWS
First let's talk about the traditional method with any linux server:
* Generate an SSH key pair: Before you can connect to an EC2 instance using SSH, you need to generate an SSH key pair. You can do this using tools like ssh-keygen.
* Add the public key to the EC2 instance: Once you have generated an SSH key pair, you need to add the public key to the EC2 instance. You can do this either when launching the instance or by modifying the instance's security group settings.


But instead of this we can ask aws to generate the key it self then we download it to access out EC2 instance using th cmd:
``` ssh -i /path/to/private/key.pem username@instance-ip-address ```

# Networking Basics
Here we will talk about five Networking Basics concepts.
## IP address
Each device connected to the internet has a unique identifier. Most networks today, including all computers on the internet, use the TCP/IP as a standard to communicate on the network. In the TCP/IP protocol, this unique identifier is the IP Address. The two kinds of IP Addresses are IPv4 and IPv6.
<img src="[ URL](https://miro.medium.com/v2/resize:fit:640/format:webp/1*T-XFf3kOvko_are9ayCJKg.png)https://miro.medium.com/v2/resize:fit:640/format:webp/1*T-XFf3kOvko_are9ayCJKg.png" alt="ALT TEXT" width="WIDTH" height="HEIGHT" style="display: block; margin: auto;">
