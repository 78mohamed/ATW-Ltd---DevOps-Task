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
* **IPv4 vs IPv6**

*IPv4* uses 32 binary bits to create a single unique address on the network. An IPv4 address is expressed by four numbers separated by dots. Each number is the decimal (base-10) representation for an eight-digit binary (base-2) number, also called an octet.

*IPv6* space is much larger than the IPv4 space due the use of hexadecimals as well as having 8 groups. Most devices use IPv4. However, due to advent of IoT devices and the greater demand for IP Addresses, more and more devices are accepting IPv6.
<p align="center">
  <img src="https://signal.avg.com/hs-fs/hubfs/Blog_Content/Avg/Signal/AVG%20Signal%20Images/IPv4%20vs.%20IPv6%20addresses%20(Signal)/IPv4-vs-IPv6-EN.png?width=1320&name=IPv4-vs-IPv6-EN.png" alt="IPv4 Image" width="400" style="display: block; margin: auto;">
</p>

* **Subnets**

In computer networking, a subnet is a logical subdivision of an IP network. A subnet is created by partitioning a larger network into smaller, more manageable subnetworks, each with its own unique network address and subnet mask. The purpose of subnetting is to improve network performance, security, and manageability by reducing network congestion, isolating network traffic, and simplifying network administration.

Each IP address consists of two parts: the network address and the host address. The subnet mask is used to determine which part of the IP address represents the network and which part represents the host. By dividing the IP address space into smaller subnetworks, administrators can allocate IP addresses more efficiently and assign them to specific devices on the network.

Subnetting also enables the implementation of access control policies and routing protocols that can restrict or direct traffic between different subnets. For example, an organization might use subnetting to create separate subnetworks for different departments or functions, such as finance, marketing, or research and development. This allows the organization to isolate sensitive data or applications from the rest of the network and apply different security policies to different subnets.
<p align="center">
  <img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*8TdQgHnfpUwxUz7J-FRVxA.png" alt="IPv4 Image" width="400" style="display: block; margin: auto;">
</p>

## MAC address
<p align="center">
  <img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*FLrfO7JzkOWSBkPBYly37w.png" alt="IPv4 Image" width="400" style="display: block; margin: auto;">
</p>
A MAC address is a 48-bits hardware identification number that uniquely identifies each device on a network. This is embedded into every network card (known as Network Interface Card) during the time of manufacturing, such as an Ethernet card or Wi-Fi card, and therefore cannot be changed. MAC Address is also known as Physical Address of a network device. For communications within a network segment, it is used as a network address for most IEEE 802 network technologies, including Ethernet, Wi-Fi, and Bluetooth. MAC Address is word wide unique, since millions of network devices exists and we need to uniquely identify each.

Typically MAC addresses are used only to transmit packets from one device to the next as data travels on a network.

That means that your computer’s network adapter’s MAC address travels the network only until the next device along the way. If you have a router, then your machine’s MAC address will go no further than that. The MAC address of your router’s internet connection will show up in packets sent further upstream, until that too is replaced by the MAC address of the next device — likely either your modem or your ISP’s router.

Even if someone knows your device MAC address, that knowledge certainly doesn’t help them do anything either good or bad.

* **MAC Address vs. IP Address**

Both MAC addresses and IP addresses are used by a TCP/IP networks for different purposes. IP addresses are assigned as part of connecting to a network, and MAC addresses are assigned at the time hardware is manufactured.

All devices on the same network have unique MAC addresses. Therefore MAC addresses can be easily used when diagnosing network issues, such as problems with IP addresses. The reason is MAC addresses never change, as opposed to a dynamic IP address, which can change from time to time. Therefore MAC address make a more reliable way to identify senders and receivers of data on the network when diagnosing network issues.

## Switches
A switch is a network device that connects devices on a local network. Switches use MAC addresses to forward data packets between devices on the same network. Switches are often used to create local area networks (LANs) in homes and offices.

## Routers
A router is a network device that connects multiple networks together. Routers use IP addresses to forward data packets between networks. Routers are used to create wide area networks (WANs) and connect devices to the internet.

## Routing protocols
Routing protocols are algorithms used by routers to exchange information about network topology and to determine the best path for forwarding data packets between networks. Routing protocols include protocols such as OSPF, BGP, and RIP.


In summary, IP addresses and MAC addresses are used to identify and locate devices on a network, switches are used to connect devices on a local network, routers are used to connect multiple networks together, and routing protocols are used to determine the best path for forwarding data packets between networks.
