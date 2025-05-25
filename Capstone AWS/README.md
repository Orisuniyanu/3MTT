# WordPress Site on AWS

A small to medium-sized digital marketing agency, **"DigitalBoost"**, want to enhance its online presence by creating a high-performance **wordPress based** website for their clients. The agency needs s scalable, secure, and cost-effective solution that can handle increasing traffic and seamlessly integrate with existing infrastructure. My task as an AWS Solutions Architect is to design and implement a WordPress solution using various AWS service, such as Networking, Compute, Object Storage, and Databases.

## Project Components

## Phase 1. VPC Setup

### Objective
I will create a Virtual Private Cloud (VPC) that is isolate and secure the WordPress infrastructure.

### Steps:
1. I start the project by open my browser which is google chrome, then go to [AWS Website](https://aws.amazon.com/)
2. Then log in to my account with a user which is `Orisun`, as already has the administrative privilege to do all things.
3. Then On the search bar, I type in **VPC**, then click on `Create VPC`.
![1. Create VPC](./IMG/1.%20Create%20VPC.png)
4. Then on the VPC page I select the following
- Resources to create -- VPC only
- Name tag -- WordPress-VPC
- IPv4 CIDR block -- IPv4 CIDR manual input
- IPv4 CIDR -- 10.0.0.0/16
![2. VPC Details](./IMG/2.%20VPC%20Details.png)
5. I create the VPC successfully.
![3. VPC Created](./IMG/3.%20VPC%20Created.png)

## Subnet

A subnet (short for subnetwork) is a smaller network within a larger network. It helps organize and manage network traffic efficiently by dividing an IP network into multiple segments.

### Steps
1. Still on the VPC dashboard, at the left side I click on `Subnets`, then click on `Create subnet`.
![4.Create subnet](./IMG/4.%20Create%20Subnet.png)
2. Then on the Subnet page on the **VPC ID** I select the VPC I create for WordPress which is **vpc-0734688ebd3ab64ff (WordPress-VPC)**
![5. Subnet Select](./IMG/5.%20Subnet%20Select.png)
3. Then I create the first subnet which is the one I am going to use for the public IP and name it `WordPress-Public-1`.
![6. First Subnet](./IMG/6.%20First%20Subnet.png)
4. Then I click on **Add new subnet**, then I name it `WordPress-Public-2` which will be my secind public IP on another available zone different from the first public subnet.
![7. Second Subnet](./IMG/7.%20Second%20Subnet.png)
5. Also create the first private subnet which is `WordPress-Private-1`.
![20. Third Subnet](./IMG/20.%20Third%20Subnet.png)
6. Aso create the second private subnet on different available zone which I name `WordPress-Private-2`
![21. Fourth Subent](./IMG/21.%20Fourth%20Subent.png)
7. After that I click on `Create subnet`and it was successful.
![8. Subnet Created](./IMG/8.%20Subnet%20Created.png)

## Internet Gateway
An Internet Gateway is a highly available, horizontally scaled component in Amazon Web Services (AWS) that allows communication between a Virtual Private Cloud (VPC) and the internet. It enables instances in a public subnet to send and receive traffic from the internet if they have a public IPv4 or IPv6 address.

### Steps:
1. Still on VPC dashboard, I click on `Internet gateways` on the left side, then click on `Create internet gateway`
![9. Create Internet Gateway](./IMG/9.%20Create%20Internet%20Gateway.png)
2. Then I name the gateway as **WordPress-Gateway** , then I click on `Create internet gateway` at the bottom of the page.
![10. Gateway Created](./IMG/10.%20Gateway%20Created.png)
3. And it was successful, then I click on `Actions` then click on `Attach to VPC`.
![11.Attach VPC](./IMG/11.Attach%20VPC.png)
4. On the attach page I select the VPC I create for WordPress and click on `Attach internet gateway`.
![12. Attached Gateway](./IMG/12.%20Attached%20Gateway.png)
5. Then it is successful.
![13. Attached Successful](./IMG/13.%20Attached%20Successful.png)

## Route Tables
A Route Table is a set of rules that determines how network traffic is directed within a network. It is used in networking devices like routers and cloud environments (such as AWS Virtual Private Cloud) to define paths for data packets.

### Steps:
1. Still on the VPC dashboard I click on `Route tables` on the left side, then click on `Create route table`.
![14. Create Route Table](./IMG/14.%20Create%20Route%20Table.png)
2. And I name it **WordPress-RouteTable** then select the VPC I create for WordPress and click on `Create route table`.
![15. Create Route Table](./IMG/15.%20Create%20Route%20Table.png)
3. Then I click on the new Route Table I create now, then click on `Edit routes`.
4. Then I click on `Add route`, select `0.0.0.0/0` and under **Target** I select **Internet Gateway**, then click on `Save changes`.
![16. Add Route](./IMG/16.%20Add%20Route.png)
5. Then I go to Subnet Associations tab then click on **Edit subnet associations** 
![17. Edit subnet associations](./IMG/17.%20Edit%20subnet%20associations.png)
6. Then under **Available subnets** I select the 2 public Subnet, then click on **Save associations**.
![18. Save associations](./IMG/18.%20Save%20associations.png)
7. I create another route table for the private subnets which I name it `WordPress-RouteTable-Private`.
![22. Private Route Table](./IMG/22.%20Private%20Route%20Table.png)
8. Since I will be using the subnet locally I don't need to include anothert route like I did for the other route table for public, I just associate the private subnet to the route table and save the configuration.
![23. Private Route](./IMG/23.%20Private%20Route.png)

## NAT Gateways
A NAT Gateway (Network Address Translation Gateway) is a service that allows instances in a private subnet to connect to the internet or other AWS services while preventing unsolicited inbound connections from external sources.

### Steps:
1. I go to VPC dashboard, then click on **NAT gateways**, then click on **Create NAT gateway**.
![24. NAT gateways](./IMG/24.%20NAT%20gateways.png)
2. Then I name the NAT gatewey **WordPress-NAT** I select on of the private subnet, also under **Connectivity type** I select `Public`, the click on **Allocate Elastic IP** 
![25. Allocate for NAT](./IMG/25.%20Allocate%20for%20NAt.png)
3. Below the page I click on **Create NAT gateway** 
4. Then I went back to the **Route Table and the edit the private route table I create for the private subnet.
![26. Edit Private Route](./IMG/26.%20Edit%20Private%20Route.png)
5. On the next page I under **Destination** is select `0.0.0.0/0` also undeer **Target** I select `NAT Gateway` then select the NAT I create and then click on **Save changes**.
![27. Save Changes](./IMG/27.%20Save%20Changes.png)

## Phase 2. AWS MYSQL RDS Setup
Amazon Relational Database Service (RDS) is a fully managed database service provided by AWS that simplifies the setup, operation, and scaling of relational databases in the cloud. It automates administrative tasks like backups, patching, and monitoring, allowing users to focus on their applications instead of database management.

### Obejective:
To deploy and managed MySQL database using Amazon RDS for WordPress data storage.

### Steps:

### Creating Subnet Group
1. On the search tab I search for `RDS` then click on **Aurora and RDS**.
2. After that I click on `Subnet groups`, this is to ensures that database instances are deployed across multiple subnets for high availability and fault tolerance.
![28. RDS Subnet Groups](./IMG/28.%20RDS%20Subnet%20Groups.png)
3. Then click on **Create DB subnet group**.
![29. Create DB subnet group](./IMG/29.%20Create%20DB%20subnet%20group.png)
4. On the subnet group page I name the group as  **WordPress-Subnet-Group**, after that I select the VPC I create for WordPress
![30. Subnet Group Details](./IMG/30.%20Subnet%20Group%20Details.png)
5. After that I add the private subnet to the subnet group, then click on **Create**.
![31. Subnet Selected](./IMG/31.%20Subnet%20Selected.png)

### Launch the RDS (MySQL) Instance

1. Still on the dashboard tab, I click on **Databases**, then click on `Create database`.
![32. Create Database](./IMG/32.%20Create%20Database.png)
2. I select the following:
- `Choose a database creation method` -- **Standard create** 
- `Engine type` -- **MySQL**
- `Templates` -- **Free tier**
- `DB instance identifier` -- **WordPress-DB**
- `Credentials management` -- **Self managed** then include my own password I generate myself.
- `Instance configuration` -- **db.t4g.micro**
- `Allocated storage` -- **100GB**
- `Compute resource` -- **Don’t connect to an EC2 compute resource**
- `Network type` -- **IPv$**
- `Virtual private cloud (VPC)` -- **WordPress-VPC (vpc-01c2ac65688fa709d)**
- `DB subnet group` -- **wordpress-subnet-group**
- `Public access` -- **No**
After all these I click on **Create database**
3. And it was create successfully.
![33. DB Created](./IMG/33.%20DB%20Created.png)
4. After I go ahead to create security group that I will use for this project which I name **WordPress-SG**.
![34. Security Group](./IMG/34.%20Security%20Group.png)
5. Then I went to modify the MySQL database and change the security group to the one I create.
![35. Security Group DB](./IMG/35.%20Security%20Group%20DB.png)


## Phase 3. EC2

### Launch EC2 Instance

1. I search for EC2 on the search bar, click on **Launch instance.
![36. EC2 Instance](./IMG/36.%20EC2%20Instance.png)
2. I name the new instance **WordPress-EC2**, select **Ubuntu Linux** as the OS image, also under `Amazon Machine Image (AMI)` I select **Ubuntu Server 24.04 LTS (HVM), SSD Volume Type** which is a free tier.
![37. Instance Details](./IMG/37.%20Instance%20Details.png)
3. Under Network setting I select the VPC I create for WordPress and also select the one of the public subnet.
![38. EC2 Network](./IMG/38.%20EC2%20Network.png)
4. After that I console to the EC2 through Git bash application using the key I generate when creating the instance, after getting my public ip which is 50.18.5.83.
![39. Git Bash](./IMG/39.%20Git%20Bash.png)
5. After that I creat another user **iyanu** also give it admin privilage so that I will not be logging to root all the time for security reasons.
![40. User Create](./IMG/40.%20User%20Create.png)
6. After that I update and upgrade my instance with this command
```bash
sudo su
apt-get update && apt-get upgrade -y
```
## Phase 4: EFS Setup for WordPress Files

### Creating EFS 
Amazon Elastic File System (EFS) is a fully managed, scalable file storage service in AWS that allows multiple EC2 instances to access shared storage. It is designed for high availability, durability, and elasticity, making it ideal for applications requiring shared access to files

### Steps:
1. On the AWS Console I search for EFS then click on **Create file system**
![41. EFS](./IMG/41.%20EFS.png)
2. I then name is **WordPress-EFS**, then select the VPC I create for the WordPress and select the 2 private Ip and also the security group.
![42. EFS Review](./IMG/42.%20EFS%20Review.png)
3. It successful.
![43. EFS Created](./IMG/43.%20EFS%20Created.png)
4. I went back to the security group and edit the inbound rule that allow port 2049.
![44. Edit Security Group](./IMG/44.%20Edit%20Security%20Group.png)
5. Then I went back to my EC2 instance to mount the file system to the EC2 instance with the following command.
```bash
sudo su
mkdir -p /var/www/html
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-025c4876baabceef5.efs.us-west-1.amazonaws.com:/ /var/www/html
```
6. I get this error **"mount.nfs4: Failed to resolve server fs-025c4876baabceef5.efs.us-west-1.amazonaws.com: Name or service not known"** which I went to the VPC and click on Edit and tick the resolve hostname, the ran the command again.
7. Here is the result
```bash
root@ip-10-0-0-51:/home/ubuntu# sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-025c4876baabceef5.efs.us-west-1.amazonaws.com:/ /var/www/html
root@ip-10-0-0-51:/home/ubuntu# df -h | grep /var/www/html
fs-025c4876baabceef5.efs.us-west-1.amazonaws.com:/  8.0E     0  8.0E   0% /var/www/html
root@ip-10-0-0-51:/home/ubuntu#
```
![45. Mounted](./IMG/45.%20Mounted.png)
8. After this I install apache2 since I am using ubuntu server.
```bash
apt-get install apache2
sudo systemctl enable apache2
sudo systemctl start apache2
systemctl status apache2
```
![46. Apache2](./IMG/46.%20Apache2.png)
9. Install php 7.4
```bash 
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php7.4 php7.4-common php7.4-cli php7.4-cgi php7.4-curl php7.4-mbstring php7.4-gd php7.4-mysql php7.4-gettext php7.4-json php7.4-xml php7.4-fpm php7.4-intl php7.4-zip
```
![47. PHP](./IMG/47.%20PHP.png)
10. Install mysql5.7
```bash
wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.24-1_all.deb
sudo apt update
sudo apt install -y mysql-server
sudo systemctl enable mysql
sudo systemctl start mysql
```
![48. MySQL](./IMG/48.%20MySQL.png)
11. Set permissions
```bash
sudo usermod -aG www-data iyanu
sudo chown -R iyanu:www-data /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
sudo find /var/www -type f -exec sudo chmod 0664 {} \;
sudo chown www-data:www-data -R /var/www/html
```
![49. Permission](./IMG/49.%20Permission.png)
12. Download wordpress files
```bash
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/
```
![50. Download WordPress](./IMG/50.%20Download%20WordPress.png)
13. Create the wp-config.php file
```bash
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
```
![51. Change Config](./IMG/51.%20Change%20Config.png)

### Preparing MySQL

### Steps:
1. on the terminal I set a strong password for MySQL database.
```bash
sudo mysql_secure_installation
```
![52. MySQL Strong](./IMG/52.%20MySQL%20Strong.png)
2. Then log in MySQL
```bash
sudo mysql -u root -p
```
![53. Log in to MySQL](./IMG/53.%20Log%20in%20to%20MySQL.png)
3. Create a Database and User for WordPress
```sql
CREATE DATABASE WordPressDB;
CREATE USER 'iyanu'@'localhost' IDENTIFIED BY '**************';
GRANT ALL PRIVILEGES ON WordPressDB.* TO 'iyanu'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
![54. MySQL User](./IMG/54.%20MySQL%20User.png)
4. Edit the wp-config.php file
```bash
sudo nano /var/www/html/wp-config.php
```
![55. Edit FIle](./IMG/55.%20Edit%20FIle.png)
5. Then I rstart the apache2 service
```bash
sudo systemctl restart apache2
```
6. I open my browser input the public ip URL: http://50.18.5.83
![56. WordPress](./IMG/56.%20WordPress.png)
![57. WordPress Page](./IMG/57.%20WordPress%20Page.png)

## Phase 5: Application Load Balancer

### Objective: 
Set up an Application Load Balancer to distribute incoming traffic among multiple instances, ensuring high availability and fault tolerance. 
- Distribute traffic to multiple EC2 instances
- Ensure high availability and fault tolerance
- Integrate it with your Auto Scaling Group
### Steps: 
1. Then on the EC2 dashboard I click on `Load Balancer` at the left side and click on `Create load balancer`.
![58. Load Balancer](./IMG/58.%20Load%20Balancer.png)
2. Then I select `Application Load Balancer` under **Load balancer types**.
![59. Application ALB](./IMG/59.%20Application%20ALB.png)
3. These are the following things I select:
- `Load balancer name` -- **WordPress-ALB**
- `Scheme` -- **Internet-facing**
- `Load balancer IP address type` -- **IPv4**
- `VPC` -- **WordPress-VPC**
- `Availability Zones and subnets` -- **us-west-1b (usw1-az3), us-west-1c (usw1-az1)**
- `Security groups ` -- **WordPress-SG**
- `Listeners and routing` -- **HTTP - 80, HTTPS - 443**
![60. ALB Details](./IMG/60.%20ALB%20Details.png)
4. Then click on **Create target group** 
- `Choose a target type` -- **Instances**
- `Target group name` -- **WordPress-Target**
- `Protocol : Port` -- **HTTP**
- `Health check protocol` -- **HTTP**
- `Health check path` -- **/**
![61. Target Group](./IMG/61.%20Target%20Group.png)
5. Then I attach the Ubuntu Instance.
![62. Register Tartget](./IMG/62.%20Register%20Tartget.png)
6. Then I open my browser again and trynto reach the wordpress page through the ALB DNS NAME, the URL is **"WordPress-ALB-1183520425.us-west-1.elb.amazonaws.com"**. and it was reachable.
![63. ALB Working](./IMG/63.%20ALB%20Working.png)

## Phase 6: Auto Scaling Group 
An Auto Scaling Group (ASG) is a feature in cloud computing that helps manage a collection of virtual machines (instances) to ensure optimal performance and cost efficiency. It automatically adjusts the number of instances based on demand, ensuring that your application has the right amount of resources at any given time.
### Objective: 
Implement Auto Scaling to automatically adjust the number of instances based on traffic load. 
### Steps: 
1. On the EC2 dashboard I click on **Launch Templates**, then click on **Create launch template**
![65. Launch Template](./IMG/65.%20Launch%20Template.png)
2. Then I select the following
- `Launch template name` -- **WordPress-Template**
- `Template version description` -- **For wordpress instance **
- `Amazon Machine Image (AMI)` -- **Ubuntu Server 24.04 LTS (HVM), SSD Volume Type** which is the one I am using for my WordPress instance.
![66. Template Details](./IMG/66.%20Template%20Details.png)
- `Key pair (login)` -- **WordPress-key**
- `Network settings` -- I select one of my public subnet
- `Firewall (security groups)` -- Also select the security group I create for WordPress instance.
Then click on **Create launch template**.
![67. Create Instance](./IMG/67.%20Create%20Instance.png)
3. On the EC2 dashboard I click on **Auto scaling Groups**, then click on **Create Auto Scaling group**.
![64. Auto Scaling](./IMG/64.%20Auto%20Scaling.png)
4.  Then on the Auto scaling page I name it **WordPress-AutoScaling**, and select the template I create.
![68. AutoScaling Template](./IMG/68.%20AutoScaling%20Template.png)
5. Then I select the VPC which is the one for WordPress and the two subnets.
![69. AutoScaling VPC](./IMG/69.%20AutoScaling%20VPC.png)
6. Then select the WordPress ALB, then for scaling I select 1 for min and 3 for max.
![70. AutoScaling Created](./IMG/70.%20AutoScaling%20Created.png)
7. Then went back to my instance to really check the scaling.
```bash
sudo apt update
sudo apt install stress -y
stress --cpu 2 --timeout 300
```
8. Then I click my instance to see if the Autoscaling is configured properly.
![71. AutoScaling Working](./IMG/71.%20AutoScaling%20Working.png)























