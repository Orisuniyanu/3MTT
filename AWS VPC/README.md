# **Network Mastery with AWS VPC mini project**

In this session, I'll explore the core concepts of Amazon Web Services (AWS), focusing specifically on Virtual Private Clouds (VPCs). My objective is to understand the fundamental components of VPC infrastructure, including subnets, gateways, and routing tables. Through practical demonstrations and interactive exercises, I'll navigate the AWS management console to deploy and manage these critical components effectively.

## Project Goals:

- Understand the fundamentals of Virtual Private Cloud (VPC) and its components.

- Gain hands-on experience in setting up and configuring VPC, subnets, internet gateway, NAT gateway, and VPC peering connections.

- Learn how to enable internet connectivity securely within a VPC.

- Implement outbound internet access through the NAT gateway.
- Establish direct communication between VPCS Using VPC peering.

## Learning Outcomes:

- Acquired knowledge about VPC and its essential components, such as subnets, gateways, and route tables.

- Developed skills in creating and configuring VPC resources using AWS management console

- Learned how to set up routing tables to enable internet connectivity and outbound internet access securely.

- Gained understanding of VPC peering and its significance in connecting multiple VPCs within the same or different regions.

- Enhanced understanding of network security principles and best practices for cloud environments.

## **What is VPC, Subnets, Internet Gateway and NAT Gateway?**

You can Imagine you're building a virtual space for the company GotoGrowFast.com's so that the computers can communicate securely. That's what VPC, or Virtual Private Cloud, is all about. It's like creating a private room in the cloud just for GatoGrowFast.com's use.

**Here's an example:** Think of GatoGrowFast.com's office building. Inside, there are different departments like HR, Finance, and IT. Each department has its own area with specific access rules. Similarly, in a VPC, GatoGrowFast.com can create different sections, called subnets, for different parts of the business.

Now, let's say GatoGrowFost.com wants to connect its office to the internet. They'd use a router to control the flow of data in and out of the building. In a VPC, GatoGrowFast.com has something similar called an internet Gateway. It lets their VPC communicate with the internet securely.

NAT (Network Address Translation) Gateway as a secret agent between GatoGrowFast.com's computers and the internet. When a computer inside their virtual office wants to talk to the Internet, the NAT Gateway steps in, It translates the computer's message and sends it out, but it hides who sent it. It's like sending a letter without your return address. This way, the internet only sees the NAT Gateway's address, keeping GatoGrowFast.com's computers safe and anonymous online.

**Note-** A router is a device that directs data packets between computer networks. Think of it as a traffic cop for the internet. When data is sent from one device to another across a network, it's broken down into smaller packets. These packets need to find their way to the correct destination, and that's where the router comes in.

Imagine you're sending a letter to a friend across the country. You drop it in a mailbox, and it's picked up by a postal worker. The postal worker knows which roads to take and which sorting centers to pass through to ensure your letter reaches its destination. Similarly, a router knows how to send data packets from your device to the right destination on the internet. Routers use routing tables, which are like maps of the internet, to determine the best path for data packets to take. They analyze Information in the packets, such as destination IP addresses, to make these decisions. Once the packets reach their destination, the router ensures they're delivered to the correct device.


## **What is an IP address?**

An IP address is like a phone number for your computer, it's a unique set of numbers that helps computers find and talk to each other on a network, like the internet,

There are two main types of IP addresses: public IP addresses and private IP addresses. However, each type has different versions, with IPv4 and IPv6 being the most common.

**Public IP Address:** This is like your home address. It's unique and helps other computers on the internet find yours. Just like how people send letters to your house using your address, data packets are sent to your computer using its public IP address.

- A public iP address is globally unique and is assigned by the Internet Service Provider (ISP) to a device connected to the intemet.

- It allows devices to communicate with other devices across the internet.

- Public IP addresses can be either dynamic or static. Dynamic IPs change periodically, often each time a device reconnects to the internet, while static IPs remain constant. Static IPs are typically used for servers, remote access, or services that require consistent connectivity.

**Private IP Address:** Think of this like an internal extension number in a big office building. It's used for communication within a specific network, like your home Wi-Fi network or an office network. Devices within the same network can talk to each other using their private IP addresses, but these addresses aren't visible to the outside world.

- Private IP addresses are typically assigned by a router or a DHCP (Dynamic Host Configuration Protocol) server within the network.

- Devices within the same private network communicate with each other using their private IP addresses.

- These addresses are not routable over the Internet. They are used for internal network communication only and are hidden from the outside world.

- It is not globally unique and can be reused within different private networks without conflict.

**IPv4 Address:**

- IPv4 (Internet Protocol version 4) addresses are the most common type of IP addresses used today.

- They are 32-bit numeric addresses written in decimal format, separated by periods (e.g., 192.168.0.11).

- IPv4 addresses are divided into five classes: A, B, C, D, and E, with classes A, B, and C being used for addressing hosts on networks.

- Each octet in an IPv4 address can have a value between 0 and 255. This is because each octet is made up of eight bits, and the maximum value that can be represented with eight bits is 255 (which is 111111 in binary).

**IPv6 Address:**

- IPv6 (Internet Protocol version ó) addresses are designed to replace IPv4 due to the exhaustion of available IPv4 addresses.

- IPv6 addresses are 128-bit hexadecimal addresses, represented in eight groups of four hexadecimal digits separated by colons (e.g.. 2001:0db8:8503:0000:0000:8a2e:0370:7334).

- IPv6 addresses provide a much larger address space compare to IPv4, allowing for a virtually unlimited number of unique addresses.


## What is CIDR?

CIDR, or Classless Inter-Domain Routing, makes it easier to talk about groups of IP addresses on the internet. Instead of naming each address one by one, CIDR uses a simple shortcut. It's like saying "All the houses on Main Street" instead of listing each house separately.

For example, let's say you have the IP address 192.168.1.0, With CIDR notation, you might write it like this: 192.168.1.0/24. The"/24" part tells us that we're talking about all the houses on that street from 192.168.1.0 to 192.168.1.255.

So, CIDR helps us manoge and organize IP addresses on the internet in a way that's easy to understand and work with, it's like having a shorthand for salking about big groups of addresses.

Determining the number of available IP addresses in a CIDR block To determine the number of available IP addresses in a CIDR block, you calculate it using the formula:
```py
2^(32 - CIDR notation) - 2
```

The "-2" is for excluding the network address and the broadcast address,

**Example:**

Let's say we have a CIDR block of "192.168.1.0/24 Using the formula, we calculate:
```py
2^(3224)  -2 

2^8 - 2

=56-2

=254
```
## **What is a gateway?**

Gateways are like doorways between different networks. They help data travel between your local network and other networks, like the internet. Just like a gate lets you go from your backyard to the neighborhood park, a gateway lets your data ge from your computer to the internet and back again, It's like the traffic cop of the internet, directing your data where it needs to go.

For example - Imagine you live in a city with different neighborhoods, each with its own set of houses. You're in one neighborhood, let's call it Neighborhood A, and you want to visit o friend who lives in a different neighborhood, Neighborhood B. To get from your neighborhood to your friend's neighborhood, you need to go through a gateway-a special gate that connects the two neighborhoods. This gateway acts as a bridge between the two areas, allowing people and things to pass back and forth.

So, when you leave your house in Neighborhood A, you walk to the gateway, pass through it, and then find your friend's house in Neighborhood B. The gateway helps you navigate from one neighborhood to another, just like how a network gateway helps data travel between different networks.

## **What is a Route table?**

A route table is like a map that helps data find its way around a network, Just like a map shows you the best routes to get from one place to another, a route table tells devices on a network how to send data packets to their destinations.

In simpler terms, a route table lists different destinations and the paths (or "routes") to reach them. When a device receives data that it needs. to send somewhere, it consults the route table to figure out where to serid it.

For example, if your computer wants to send data to a website, it looks at its route table to find out which gateway to use to reach the internet. The route table might say, "To reach the internet, send data to the router." Then, the router cnows how to forward the data to the next stop on its journey, eventually reaching its destination.

Think of a route table as the navigation system for data on a network, helping it find the fastest and most efficient paths to where it needs to go.

## **Connection between Gateway and Route table**

**Gateways:**

- Gateways are devices liike routers or firewalls) that serve as entry and exit points between different networks.

- They connect networks with different IP address tanges, such as your local network and the internet.

- Gateways receive incoming data packets and determine where to send them next based on routing information

**Route Tables:**

- Route tables are tables maintained by networking devices (like routers or switches) that contain information about how to route data packets to their destinations.

- Each entry in a route table specifies a destination network and the next hop (gateway) to reach that network.

- Devices consult the route table to determine the best path for forwarding data packets based on their destination IP addresses.

**Connection:**

- When a device (like a computer or serverl wants to send data to a destination outside of Its local network, it checks its route table.

- The route table provides the information needed to determine the next hop (gateway) for reaching the destination network.

- The device then forwards the data packet to the specified gateway, which continues the process until the packet reaches its final destination.

In summary, gateways and route tables work together to facilitate the routing of network traffic between different networks, Gateways serve as the entry ond exit points between networks, while route tables provide the necessary routing Information to determine how data packets should be forwarded to their destinations.

## **practical Stage**
**steps-**

1. Setting Up a Virtual Private Cloud (VPC)

2. Configuring Subnets within the VPC

3. Creating Internet Gateway and attaching it to VPC

4. Enabling Internet Connectivity with the Internet Gateway by setting up Routing tables

5. Enabling Outbound Internet Access through NAT

Gateway

6. Establishing VPC Peering Connections

## **Part 1: Setting Up a Virtual Private Cloud (VPC)**

1. I login to my AWS console with a user with administrative privileges which is **orisun**.
2. Then I naviagete to the search bar and typ in **VPC** then click on it, which direct me to Virtual Private Cloud (VPC) page.
![1. VPC Page](./IMG/1.%20VPC%20Page.png)
3. Then click on **Create VPC**, 
![2. Create VPC](./IMG/2.%20Create%20VPC.png)
4. On the next page I select the following:
- `VPC settings` --  **VPC only** 
- `IPv4 CIDR` -- **10.0.0.0/16**
- `IPv6 CIDR block` -- **No IPv6 CIDR block**
After these I click on **Create VPC**.
![3. VPC Details 1](./IMG/3.%20VPC%20Details%201.png)
![4 VPC Details 2](./IMG/4%20VPC%20Details%202.png)
5. And VPC is created successfully.
![5. VPC Created](./IMG/5.%20VPC%20Created.png)

## **Part 2: Subnets**

1. Still on the VPC section, I click on **Subnets**, Then I click on **Create Subnets**.
![6. Create Subnet](./IMG/6.%20Create%20Subnet.png)
2. Then in the next page I select the following:
- `VPC` -- **vpc-0dc95ec16a25ca04c** -- which is the VPC in create in the Part 1 of this project.
- `Subnet name` -- **my-public-subnet-1**
- `Availability Zone` -- **Asia Pacific (Mumbai) / ap-south-1a**
![7. Subnet Page 1](./IMG/7.%20Subnet%20Page%201.png)
then click on **Add new subnet**, where I repaeat the process agin for the second subnet
![8. Subnet Page 2](./IMG/8.%20Subnet%20Page%202.png)
Then I click on **Create subnet**.
![9. Subnets Created](./IMG/9.%20Subnets%20Created.png)

## **Part 3: Internet Gateways**

1. Still on the VPC section, I click on **Internet gateways**, then click on **Create internet gateway**.
![10. Create Gateway](./IMG/10.%20Create%20Gateway.png)
2. Under `Name tag` is give it **my-internet-gw-1**
3. Then click on **Create internet gateway**.
![11. Gateway Details](./IMG/11.%20Gateway%20Details.png)
4. Gateway Created
![12. Gateway Created](./IMG/12.%20Gateway%20Created.png)
5. Then I notice is still detached because have not add any VPC to it, to enable the gateway I have to addd it to VPC for internet access.
6. Now I click on the small box in front of the gateway then click on **Action**, then select **Attached to VPC**.
![13. Attached VPC](./IMG/13.%20Attached%20VPC.png)
7. Then under **Available VPCs** I select the VPC is create which is **vpc-0dc95ec16a25ca04c**, then click on **Attach internet gateway**.
![14. Attached VPC 1](./IMG/14.%20Attached%20VPC%201.png)
8. Now my gateway is not attached to a VPC.
![15. Gateway Attached](./IMG/15.%20Gateway%20Attached.png)

## **Part 4: Route Table

**a)**
1. Still on the VPC section, I click on **Route table**, then click on **Create route table** at the top left corner.
![16. Create Route Table](./IMG/16.%20Create%20Route%20Table.png)
2. Then I click under `name` **my-route-table-1**, under `VPC` **vpc-0dc95ec16a25ca04c**, then click on `Create route table`.
![17. Route Table Created](./IMG/17.%20Route%20Table%20Created.png)
3. Successful created route table
![18. Route Table](./IMG/18.%20Route%20Table.png)

**b)**

1. Then click on **Edit subnet associations**, 
![18. Route Table](./IMG/18.%20Route%20Table.png)
2. Then under `Available subnets ` I select **my-public-subnet-1**, then below I click on **Save associations**.
![20 Route Table Associated ](./IMG/20%20Route%20Table%20Associated.png)
3. Then all is set now
![21. All Set](./IMG/21.%20All%20Set.png)
4. Then I navigate to **Route**, then click on **Edit routes**.
![22. Edit Route](./IMG/22.%20Edit%20Route.png)
5. Then click on **Add route**
![23. Add Route](./IMG/23.%20Add%20Route.png)
6. Then I select 0.0.0.0/0
![24. Save Changes](./IMG/24.%20Save%20Changes.png)
7. Route Added Successfully 
![25. Route Added Successfully](./IMG/25.%20Route%20Added%20Successfully.png)


## **Part 5: NAT Gateway

1. Still in VPC dashboard, I click on **NAT gateways**, then click on **Create NAT gateway**.
![26. Create NAT gateway](./IMG/26.%20Create%20NAT%20gateway.png)
2. Then I select the following:
- `Name - optional` -- **my-NAT-gw-1**
- `Subnet` -- **subnet-0ee113e6f56ef28b0 (my-private-subnet-1)**
- `Connectivity type` -- **Private**
Then I click on **Create NAT gateway**.
![27. Gatewat Setting](./IMG/27.%20Gatewat%20Setting.png)
3. Gateway Successful 
![28. Gatewat Successful](./IMG/28.%20Gatewat%20Successful.png)
4. Then I select the gateway I created, then navigate to the subnet section and select the ID.
![29. Gateway Subnet](./IMG/29.%20Gateway%20Subnet.png)
5. Then in on the subnet page I navigate to the route table section, then click on the route table ID.
![30. Subnet Route](./IMG/30.%20Subnet%20Route.png)
6. I proceed to the Route, then click on **Edit**.
![31. Edit route](./IMG/31.%20Edit%20route.png)
7. Then click on `Add route` and select 0.0.0.0/0 and **NAT Gateway**.
![32. Save Change](./IMG/32.%20Save%20Change.png)
8. Then **Subnet associations**, then click on **Edit subnet associations**.
![33. Subnet Association](./IMG/33.%20Subnet%20Association.png)
9. Then I select my private subnet which is **my-private-subnet-1**.
![34. Save Association](./IMG/34.%20Save%20Association.png)
10. After this all the set for VPC
![35. All set](./IMG/35.%20All%20set.png)


## **Difference Between Internet Gateway and NAT Gateway**

## **Internet Gateway:**

Think of it like a door to the internet for your subnet. When you attached a Internet Gateway to a subnet, it allows the resources in the subnet (like EC2 instances) to reach out to the internet and also allows internet traffic to reach those resources. It's like having a door both to enter and exit the subnet.

## **NAT Gateway:
Imagine it as a one-way street sign for your subnet's traffic. When you attached a NAT Gateway to a subnet, it lets the resource in that subnet (like EC2 instances) access the internet, but it doesn't allow incoming traffic from the internet to reach those resources. It's like the resource can go out to the interner, but the internet traffic can't directly come in.

## **What is VPC Peering?

VPC peering is like connecting two virtual offices in the cloud so they can talk to each other directly. Just imagine two neighboring offices sharing files and chatting without going a middleman.

- By default, EC2 instance is different VPCs cannot communicate with each other.
- To enable communication between EC2 instance in different VPCs, you can set up VPC peering, VPC connections, or AWS Direct Connect.
- VPCs, allowing EC2 instance in one VPC to communicate with EC2 instance in the other VPC.


## Why do we need VPC Pearing?

We need VPC peering when we want diferent parts of our cloud network (VPCs) to work together smoothly. Maybe you have one VPC for your development team and another for your marketing team, and you want them to share data securly. That's where VPC peering comes in handly it let these VPCs communicate directly, making things easier for everyone.

Additionally, there are some key point that you should be aware of.
- Two VPCs cannot connect to each other. You need to set up VPC peering or use VPN ot Direct Connect to establish connectivity between VPCs.
- Subnets within the same VPC can communicate with each other by default. AWS sets up route tables to allow communicate within the same VPC.
- Ec2 instances in different subnets within the same VPC can also communicate with each other by default, as long as their associated route tables are configured to allow traffic between subnets.


## Part 6: Creating 2 VPC in Different Region

1. On the VPC dashboard I click on **Your VPCs** to create another 2 VPCs, then click on **Create VPC**.
![36. Peer VPC](./IMG/36.%20Peer%20VPC.png)
2. This is the first VPC I created which I named **requester VPC**.
![37. First VPC](./IMG/37.%20First%20VPC.png)
3. Then I also create another VPC which I name **accepter VPC**
![38. Second VPC](./IMG/38.%20Second%20VPC.png)
4. Comfirmation for the two VPCs
![39. Confirmation](./IMG/39.%20Confirmation.png)
5. Then on the VPC dashboard I click on **Peering connections** then click on **Create peering connection**.
![40. Peering Connection](./IMG/40.%20Peering%20Connection.png)
6. I name my peering connection **my-first-VPC-peering**, then under `VPC ID (Requester)` I choose **vpc-03d39c5a449dd27e3 (requester VPC)**, under `Account` I select **My account** and under `Region` I select **This Region (ap-south-1)
![41. First Peering](./IMG/41.%20First%20Peering.png)
7.Then the second peering is **vpc-02a3717c699aa4deb (accepter VPC)**, and I click on **Create peering connection**.
![42. Seconf Peering](./IMG/42.%20Seconf%20Peering.png)
8. Then this is what I see pending acceptance from the accepter VPC.
![43. Pending Acceptance](./IMG/43.%20Pending%20Acceptance.png)
9. Then I click on **Action**, under the drop down options I choose **Accept request**.
![44. Accept Request](./IMG/44.%20Accept%20Request.png)
10. Now I click on Main route table ID of the accepter VPC, then under the Main route table I click on accepter VPC ID.
11. Then click on **Routes** and I click on **Edit route**.
![45. Edit Route](./IMG/45.%20Edit%20Route.png)
12. Then click on **Add route** then I input the requester Ip address, then click on **Save changes**.
![46. Save Changes](./IMG/46.%20Save%20Changes.png)
13. I repeat the same process for requester VPC.
![47. Save Changes](./IMG/47.%20Save%20Changes.png)


VPC Peering Basic: VPC peering allows direct communication between two VPCs using private IP addresses. Region compatibility: VPC peering can be set up betweem VPCs in the same AWS region or different regions and the same account or different AWS accounts.

**CIDR Block**: The CIDR blocks of the VPCs involved in the peering connection should not overlap or conflict with each other. Each VPC must have a unique CIDR block.

**IP Addressing:** Resources in one VPC can communicate with resources in the peered VPC using their private IP addresses.

**Security Groups and NACLs:** Ensure proper configuration of Security Groups amd Network Access Control Lists (NACLs) to allow traffic between peered VPCs.

**Direct Communication:** Resources in one can directly communicate with the reosurce in the peered VPC without requiring internet access.

**Transitive Traffic:** Traffic cannot flow through a VPC peering connection to reach other VPCs not directly peered.

**Routing:** Update route tables in both VPCs to allow traffic a flow through the peering connection. Each VPC's table must contain a route entry for the CIDR block of the peer VPC, pointing to the peering connection.

**Limitations:** There are limits on the number of VPC peering connections that cab be established per VPC, as well as limitations on the number of route entries per route table.


## What is VPC endpoint?

Think of a VPC endpoint like a dedicated, secure tunnel between your house (VPC) and a library (AWS service). Instead of going through the bustling streets (public internet), you have a direct pathway from your home to the library. This pathway ensures that only you and authorized users can access the library's resources, like books or documents, without exposing them to outside risks. It's a private, efficient way to access what you need, keeping your data safe from prying eyes on the internet.

Let's understand the problem we were facing,

When you're backing up data from an EC2 instance to an S3 bucket, it usually goes over the internet, whether the instance is in a public or private subnet. But if the data is sensitive, that means it's risky because hackers could try to get it while it's traveling over the internet.


## Project Reflection:

1. Successfully completed the project tasks related to setting up VPC infrastructure and configuring network components.

2. Gained practical experience in navigating AWS management console and configuring VPC resources.

3. Encountered challenges such as CIDR block size limitations and learned how to troubleshoot and resolve them effectively.

4. Developed a deeper understanding of network architecture and cloud networking concepts through hands-on experimentation.

5.  the importance of network security measures, such as NAT gateway and VPC endpoints, in ensuring secure communication within cloud environments.

6. Overall, the project offered valuable perspectives on the fundamentals of cloud networking and practical experience in deploying VPC infrastructure on AWS.












