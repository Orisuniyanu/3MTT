# Security Groups and NACLs mini project

During this project, I'll explore the core concepts of Amazon Web Services (AWS), specifically focusing on Security Groups and Network Access Control Lists (NACLS). My objective is to understand these fundamental components of AWS infrastructure, including how Security Groups control inbound and outbound traffic to EC2 instances, and how NACLs act as subnet-level firewalls, regulating traffic entering and exiting subnets. Through practical demonstrations and interactive exercises, I'll navigate the AWS management console to deploy and manage these critical components effectively.

## Project Goals:

- Understand the concepts of Security Groups and Network Access Control Lists (NACLs) in AWS.

- Explore how Security Groups and NACLS function as virtual firewalls to control inbound and outbound traffic.
- Gain hand-on experience with configuring Security Groups and NACLs to allow or deny specfic types of traffic.

## Learning Outcome:

- Gain proficiency in configuring Security Groups and NACLs to control network traffic within AWS environments.

- Understand the differences between Security Groups and NACLs, including their scope, statefulness, and rule configurations.

- Learn how to troubleshoot network connectivity issues by analyzing Security Group and NACL configurations.

- Develop a deeper understanding of AWS networking concepts and best practices for securing cloud environments.

Let's first understand some terms-

## Security Group (SG):

**Inbound Rules:** Rules that control the incoming traffic to an AWS resource, such as an EC2 instance or an RDS database.

**Outbound Rules:** Rules that control the outgoing traffic from an AWS resource.

**Stateful:** Security groups automatically allow return traffic initiated by the instances to which they are attached.

**Port:** A communication endpoint that processes incoming and outgoing network traffic. Security groups use ports to specify the types of traffic

**Protocol:** The set of rules that governs the communication between different endpoints in a network. Common protocols include TCP, UDP, and ICMP.


## Network Access Control List (NACL):

**Subnet-level Firewall:** NACLS act as a firewall at the subnet level, controlling traffic entering and exiting the subnet.

**Stateless:** Unlike security groups, NACLs are stateless, meaning they do not automatically allow return traffic. You must explicitly configure rules for both inbound and outbound traffic.

**Allow/Deny:** NACL rules can either allow or deny traffic based on the specified criteria.

**Ingress:** Refers to inbound traffic, i.e., traffic entering the subnet.

**Egress:** Refers to outbound traffic, i.e., traffic exiting the subnet.

**CIDR Block:** Specifies a range of IP addresses in CIDR notation (e.g., 10.0.0.0/24) that the NACL rule applies to.

## Default Settings:

**Default Security Group:** Every VPC comes with a default security group that allows all outbound traffic and denies all inbound traffic by default.

**Default NACL:** Every subnet within a VPC is associated with a default NACL that allows all inbound and outbound traffic by default.

## What is Security Group?

Imagine you're hosting a big party at your house. You want to make sure only the people you invite can come in, and you also want to control what they can do once they're inside.

AWS security groups are like bouncers at the door of your party. They decide who gets to come in (inbound traffic) and who gets kicked out (outbound traffic). Each security group is like a set of rules that tells the bouncers what's allowed and what's not.

For example, you can create a security group for your web server that only allows traffic on port 80 (the standard port for web traffic) from the internet. This means only web traffic can get through, keeping your server safe from other kinds of attacks.

Similarly, you can have another security group for your database server that only allows traffic from your web server. This way, your database is protected, and only your web server can access it, like a VIP area at your party.

In simple terms, security groups act as barriers that control who can access your AWS resources and what they can do once they're in. They're like digital bouncers that keep your party (or your cloud) safe and secure.

## What is NACL?

NACL stands for Network Access Control List. Think of it like a security checkpoint for your entire neighborhood in the AWS cloud. Imagine your AWS resources are houses in a neighborhood, and you want to control who can come in and out. That's where NACLs come in handy.

NACLS are like neighborhood security guards. They sit at the entrance and check every person (or packet of data) that wants to enter or leave the neighborhood.

But here's the thing: NACLs work at the subnet level, not the individual resource level like security groups. So instead of controlling access for each house (or AWS resource), they control access for the entire neighborhood (or subnet).

You can set rules in your NACL to allow or deny traffic based on things like IP addresses, protocols, and ports. For example, you can allow web traffic (HTTP) but block traffic on other ports like FTP or SSH.

Unlike security groups, which are stateful (meaning they remember previous interactions), NACLs are stateless. This means you have to explicitly allow inbound and outbound traffic separately, unlike security groups where allowing inbound traffic automatically allows outbound traffic related to that session.

In simple terms, NACLs act as gatekeepers for your AWS subnets, controlling who can come in and out based on a set of rules you define. They're like the security guards that keepy your neighborhood (or your AWS network) safe and secure.

## Difference between Security Groups and NACL

Security Groups in AWS act like virtual firewalls that control traffic at the instance level. They define rules for inbound and outbound traffic based on protocols, ports, and IP addresses. Essentially, they protect individual instances by filtering traffic, allowing only authorized communication.

On the other hand, Network Access Control Lists (NACLS) function at the subnet level, overseeing traffic entering and leaving subnets. They operate as a barrier for entire subnets, filtering traffic based on IP addresses and protocol numbers. Unlike security groups, NACLs are stateless, meaning they don't remember the state of the connection, and each rule applies to both inbound and outbound traffic independently.

**Note-** In security groups, there's no explicit "deny" option as seen in NACLs; any rule configured within a security group implies permission, meaning that if a rule is established, it's automatically allowed.

Let's come to the practical part,

This practical will be in Two parts-

1. **Security group**

2. **NACL**


## Security group

- Initially We'll examine the configuration of inbound and outbound rules for security groups.

- Create a security group allowing HTTP for all traffic and attach it to the instance.

## explore various scenarios:

- Implement inbound traffic rules for HTTP and SSH protocols and allow outbound traffic for all.

- Configure inbound rules for HTTP with no outbound rules.

- Remove both inbound and outbound rules.

- Have no inbound rules but configure outbound rules for all traffic.


## NACL

- Examine the default settings for both inbound and outbound rules in NACL configuration.

- Modify the inbound rules to permit traffic from any IPv4 CIDR on all ports.

- Adjust the outbound rules to allow traffic to all CIDRs.


## Practical

1. I open my website open [AWS Website](https://aws.amazon.com/), then login my admin user which is **Orisun**.
2. I navigate to my EC2 instance I create in my pervious project which is `Ubuntu_Server` where I host my website, so I start the instance.
![1. Instance Running](./IMG/1.%20Instance%20Running.png)
3. On the EC2 dashboard, I click on `Security group` to see the Inbound rules and the Outbound rules below is the result.
![2. Inbound Rules](./IMG/2.%20Inbound%20Rules.png)
This means that only SSH which is running on port 22 can access my instance
![23. Outbound Rules](./IMG/3.%20Outbound%20Rules.png)
This means that my instance can go to any internet on any port.
4. Then I try to see if I can access my website, I copied my public IP address, then open another tab on the google chrome browser and type this URL: **http://13.52.246.37**. 
![4. Public Ip](./IMG/4.%20Public%20Ip.png)
Then I see that I can not access it.
![5. Access](./IMG/5.%20Access.png)

This is because the Security group inbound rule doesn't allow HTTP Protocol which runs on Port 80, so whenever outside world try to access my server the security group block the connection, to resolve this I take the following steps:
1. I navigate to the **Security group** on the EC2 dashboard, the  click on **Create security group**.
![6. Create Security Group](./IMG/6.%20Create%20Security%20Group.png)
2. Then I name the security group as **my-first-security-group**, Description as **Creating sclick om `Actions`Choose `Security`.ecurity group that allows SSH and HTTP inbound traffic** and VPC as **vpc-0df75ee2f27244ae9**, then click on add rule
![7. Details](./IMG/7.%20Details.png)
3. Then Under Inbound rules, type I choose SSH and HTTP with all IPs 0.0.0.0/0, then click on **Create security group**.
![8. Inbound](./IMG/8.%20Inbound.png)
4. Now is successful 
![9. Group](./IMG/9.%20Group.png)

Now is time to attach the security group I create to my running instance.

1. I navigate to `Instance`, click om `Actions`Choose `Security`then click on `Change security group`.
![10. Change Security Group](./IMG/10.%20Change%20Security%20Group.png)
2. Then I select the security group I create then click on **Save**.
![11. Add](./IMG/11.%20Add.png)
3. Then I went back to my browser and refresh the page, now I can see my website and access it.
![12. Market](./IMG/12.%20Market.png)

Now is time to edit the outbound rule

1. I click on `Outbound rules` then click on`Edit outbound rules`
![13. Edit Out](./IMG/13.%20Edit%20Out.png)
2. Then I click on **Delete** and click on **Save rules**.
![14. Delete Rule](./IMG/14.%20Delete%20Rule.png)
3. Then I refresh my website still yet I can still access it, even after deleting the outbound rule.
![12. Market](./IMG/12.%20Market.png)

So, even though we've removed the outbound rule that allows all traffic from the instance to the outside world, we can still access the website.

According to the logic we discussed, when a user accesses the instance, the inbound rule permits HTTP protocol traffic to enter. However, when the instance sends data to the user's browser to display the website, the outbound rule should prevent it. Yet, we're still able to view the website. Why might that be?

Security groups are stateful, which means they automatically allow return traffic initiated by the instances to which they are attached. So, even though we removed the outbound rule, the security group allows the return traffic necessary for displaying the website, hence we can still access it.

let's explore the scenario,

If we delete both the inbound and outbound rules, essentially, we're closing all access to and from the instance. This means no traffic can come into the instance, and the instance cannot send any traffic out. So, if we attempt to access the website from a browser or any other client, it will fail because there are no rules permitting traffic to reach the instance. Similarly, the instance won't be able to communicate with any external services or websites because all outbound traffic is also blocked.

4. I was able to delete the inbound rule in the same way we have deleted the outbound.
click on Edit inbound rule and delete then save,
![15. Double Delete](./IMG/15.%20Double%20Delete.png)
5. Inbound rule was deleted successfully.
![16. Success](./IMG/16.%20Success.png)
6. Then I refresh my page now I can't access my website again.
![5. Access](./IMG/5.%20Access.png)
7. I add a new outbound rule to my security group, I click on `Edit outbound rules`, then **Add rule**
a. type -- HTTP
b. destination -- anywhere-IP4v
c. CIDR -- 0.0.0.0/0
Then click on **Save rules** 
This is to allow only HTTP protocol outgoing connections.
![17. Add Again](./IMG/17.%20Add%20Again.png)
![18. Confirmation](./IMG/18.%20Confirmation.png)
8.  Then I refresh my page now I can't access my website again.
![5. Access](./IMG/5.%20Access.png)
But using curl command I was able to access my website.


## Part 2: NACL

1. On the search tab I search for **VPC** click on it
![18. VPC](./IMG/19.%20VPC.png)
2. Then I navigate to Network ACLs in the left sidebar, then click on **Create netowork ACL**
![20. Create Network ACL](./IMG/20.%20Create%20Network%20ACL.png)
3. Then I name it as **my-fisst-NACL** and choose this `VPC` - **vpc-0df75ee2f27244ae9**, then click on **Create network ACL**.
![21. Create](./IMG/21.%20Create.png)
4. Then I select the NACL I created and navigate to Inbound tab, now I saw that is blocking all traffic by default same with outbound.
![22. Traffic Deny](./IMG/22.%20Traffic%20Deny.png)
5. Then click on **Add new rule**, under type is select all traffic, then click on **Save chnages**.
![23. Save Changes](./IMG/23.%20Save%20Changes.png)
6. Now NACL is not associate with any subnet, select my NACL then click on **Action** then click on **Edit subnet association**.
![24. Edit Subnet](./IMG/24.%20Edit%20Subnet.png)
7. Then I select one of my subnet and save it.
![25. Subnet Added](./IMG/25.%20Subnet%20Added.png)
8. I refresh my page again still getting error, unablr to see my webpage.
![5. Access](./IMG/5.%20Access.png)

Although we've permitted all traffic in the inbound rule of our NACL, we're still unable to access the website. This raises the question: why isn't the website visible despite these permissions? 
The reason why we're unable to access the website despite permitting inbound traffic in the NACL is because NACLs are stateless. They don't automatically allow return traffic. As a result, we must explicitly configure rules for both inbound and outbound traffic. 
Even though the inbound rule allows all traffic into the subnet, the outbound rules are still denying all traffic. 
You can see,
Inbound
![26. Inbound](./IMG/26.%20Inbound.png)
Outbound
![27. Outbound](./IMG/27.%20Outbound.png)
Now I repeat the process for outbound.
click on Edit outbound rule, then add rule, under type I select all traffic then click on save changes.
![28 Outbound Change](./IMG/28%20Outbound%20Change.png)
Outbound is set
![29. Outbounf Set](./IMG/29.%20Outbounf%20Set.png)
Now I was able to access my website now.
![12. Market](./IMG/12.%20Market.png)

In this scenario:

Security Group: Allows inbound traffic for HTTP and SSH protocol and permita all outbound traffic.

Network ACL: Denies all inbound traffic. Let's observe the outcome of this configuration.

**Security Group**

I went back to EC2 instance page then navigate to security group then click on the security group I create then add 2 rule SSH and HTTP and save the configuration.
![30. Inbound Edit](/IMG/30.%20Inbound%20Edit.png)
Here's the confirmation.
![31. Confirmation](./IMG/31.%20Confirmation.png)
And Outbound is also set to allow all traffic
![32. Outbound Rule](./IMG/32.%20Outbound%20Rule.png)


**NACL**
Now I move to NACL to denied all traffic.
1. Go back to VPC then select Network ACLs, then click on **Inbound rules** tab, click on **edit rule**.
![33. Remove Bound](./IMG/33.%20Remove%20Bound.png)
2. Then I click on **Remove** the save 
![34. Removed](./IMG/34.%20Removed.png)
3. Then all traffic is denied.
![35. NACL Deny](./IMG/35.%20NACL%20Deny.png)
4. I repeate the process for Outbound rules also by clicking on **Edit outbounc rule**, then **remove** and save.
![36. Outbound Remove](./IMG/36.%20Outbound%20Remove.png)
5. Then all the outbound traffic is blocked.
![37. NACL Deny 1](./IMG/37.%20NACL%20Deny%201.png)
6. Now I try to access my website and I can't access it because of NACL rules.
![5. Access](./IMG/5.%20Access.png)

So we are unable to access the website. why? Even if we have allowed inbound traffic for HTTP in security group.

Imagine you're at the entrance of a building, and there's a security guard checking everyone who wants to come in. That security guard is like the NACL. They have a list of rules (like "no backpacks allowed" or "no food or drinks inside"), and they check each person against these rules as they enter.

Once you're inside the building, there's another layer of security at each room's door. These are like the Security Groups. Each room has its own rules, like "only employees allowed" or "no pets." These rules are specific to each room, just like Security Groups are specific to each EC2 instance.

So, the traffic first goes through the NACL (the security guard at the entrance), and if it passes those rules, it then goes through the Security Group (the security check at each room's door). If it doesn't meet any of the rules along the way, it's denied entry.

The reason we can't see the website is because the NACL has denied inbound traffic. This prevents traffic from reaching the security group, much like a security guard not allowing entry to another room

## Let's have a look on some scenarios and their outcomes,

- NACL allows all inbound and outbound traffic, Security Group denies all inbound and outbound traffic: Outcome: Website access will be blocked because the Security Group denies all traffic, overriding the NACL's allowance.

- NACL denies all inbound and outbound traffic, Security Group allows all inbound and outbound traffic: Outcome: Website access will be blocked because the NACL denies all traffic, regardless of the Security Group's allowances.

- NACL allows HTTP inbound traffic, outbound traffic is denied, Security Group allows inbound traffic and denies outbound traffic: Outcome: Website access will be allowed because the Security Group allows HTTP inbound traffic, regardless of the NACL's allowances. However, if the website requires outbound traffic to function properly, it won't work due to the Security Group's denial of outbound traffic.

- NACL allows all inbound and outbound traffic, Security Group allows HTTP inbound traffic and denies outbound traffic: Outcome: Website access will be allowed because the Security Group allows HTTP inbound traffic, regardless of the NACL's allowances. However, if the website requires outbound traffic to function properly, it won't work due to the Security Group's denial of outbound traffic

NACL allows all inbound and outbound traffic, Security Group allows all inbound and outbound traffic: Outcome: Website access will be allowed, as both NACL and Security Group allow all traffic.

NACL denies all inbound and outbound traffic, Security Group allows HTTP inbound traffic and denies outbound traffic: Outcome: Website access will be blocked because the NACL denies all traffic, regardless of the Security Group's allowances.

## Project Reflection:

- Successfully configured Security Groups and NACLs to control inbound and outbound traffic in AWS. spective rol  es in network security.

- Explored various scenarios to understand how Security Groups and NACLs interact and impact network traffic.

- Learned valuable troubleshooting techniques for diagnosing and resolving network connectivity issues in AWS.

- Overall, gained practical experience and confidence in managing network security within AWS environments.
