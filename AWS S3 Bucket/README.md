# AWS S3 BUCKET

## Introduction
In this session, I'll explore Amazon S3 (Simple Storage Servicel) a vital component of Amazon Web Services (AWS) for storing and accessing data. Well cover key concepts like buckets objects, vensioning and permissions, along with practical demonstrations on effectively managing your S3 resources.

## Project Goals

The primary goal of this project is to familiarize myself with Amazon S3 (Simple Storage Service) and its fundamental concepts. I learnt how to create and manage S3 buckets, upload objects, enable versioning, set permissions for public access, and implement lifecycle policies.

## Learning Outcomes

By the end of this project, I have gained practical experience in working with Amazon S3 and will be able to:

- Create and configure S3 buckets using the AWS Management Console.
- Upload files and manage objects within S3 buckets. 
- Understand the importance of versioning and its implications for data management. 
- Configure permissions to control access to S3 objects.
- Implement lifecycle policies to automate data management tasks and optimize storage cost.

## What is Amazon S3?

![1. S3 Image](./IMG/1.%20S3%20Image.png)

Amazon S3, or Simple Storage Service, is like a big digital warehouse where you can store all kinds of data it's part of Amazon Web Services (AWS), which is a collection of cloud computing services.

Think of S3 as a giant virtual filing cabinet in the cloud. You can put files, documents, pictures, videos, or any other digital stuff you want to keep safe and accessible

What's cool about S3 that it's super reliable and secure, your data is stored across multiple servers in different locations, so even if something goes wrong with one server, your files are still safe.

Plus, S3 is realy flexible You can easily access your files from anywhere in the world using the internet, and you can control who gets to see or edit your stuff with different levels of permissions.

## S3 Benefits

Amazon S3 offers a range of benefits that make it a top choice for storing and managing data in the cloud

- Firstly, S3 provides exceptional durability and reliability. Your data is stored across multiple servers and data centers, ensuring that even if one server fails, your fles remain safe and accessible.
- Secondly, S3 offers scalability meaning you con Basily increase or decrease your storage capacity as needed. Whether you're storing a few gigabytes or petabytes of data, S3 can handle it without any hassle.
- Another key benefit of S3 is its accessibility, You can access your data from anywhere in the world using the internet, making it convenient for remote teams or distributed applications.
- Security is also a top priority with S3. You have full control over who can access your data and can encrypt your files to ensure they remain confidential and secure.
- Additionally, S3 is cost-effective. You only pay for the storage you use, with no upfront fees or long-term contracts, making it a budget-friendly option for businesses of all sizes.

## S3 Use Cases

**Backup:** Think of it as a safe place to keep copies of important files, ie your computer's backup If anything happens to your computer you can get your files back from S3.

**Website Stuff:** S3 can also hold all the pieces of a website, like images and videos. So when you visit a website, some of the stuff you see might be stored in S3.

**Videos and Photos:** You know all those videos and photos you share online? They're often stored in S3 because it's really good at keeping them safe and making sure they load fast.

**Apps and Games:** S3 is also used by apps and games to store things like user profiles or game levels. It helps keep everything ruining smoothly and makes sure your progress is saved

**Big Data:** Companies use S3 to store huge amounts of data for things like analyzing customer behavior or trends. It's like having a big library where you can find all sorts of useful information.
**Emergency Backuр**: Sоmе соmpanies use S3 to store coples of their data in case something bad happens, like a natural disaster it's like having a backup plan to keep things going no matter what.

**Keeping Old Stuff:** Sometimes, companies have to keep old records for legal reasons. S3 has special storage captions that are really cheap so it's a good place to keep all that old stuff without spending too much money.

**Sending Stuff Fast:** S3 works with a service called Cloudfront, which helps deliver stuff really quickly to people all over the world. So, if you're watching a videa or downloading a file, S3 helps make sure it gets to you fast.

## S3 Core Concepts

**Buckets:** Think of buckets as folders where you can store your files. Each bucket has a unique name and can hold an unlimited number of objects (files).

**Objects:** Objects are the individual files you store in S3, like photos, videos, documents, or any other type of data. Each object has a unique key (file name) and can range in size from a few bytes to terabytes.

![2. AWS Bucket](./IMG/2.%20AWS%20Bucket.png)

**Keys:** Keys are unique identifiers for objects within a bucket. They're like the file names you use on your computer. You can organize objects within a bucket using folder-like structures in their keys called prefixes.

**Storage Classes:** S3 offers different storage class to suit various use cases and budget requirements These include Standard Standard-IA (Infrequent Access), One Zone-IA, Intelligent-Tiering, Glacier, and Glacier Deep Archive. Each class has different durability, availability, and cost characteristics.

**Access Control:** You can control who can access your objects in S3 using Access Control Lists (ACL) and Bucket Policies. You can also use identity and Access Management (IAM) to manage access at a user or group level.

**Durability and Availability:** S3 is designed for 99.999999999% (11 nines) durability, meaning your data is highly resistant to loss. It also offers high avaliability, ensuing that your objects are accessible whenever you need them.
**Data Transfer:** S3 supports both inbound (upload) and outbound (downlad) data transfer. You can transfer data to and from S3 using various methods, including the AWS Management Console, CLI (Command Line Interface), SDKs (Software Development Kit), or third-party tools

**Versioning:** S3 Versioning allows you to keep multiple versions of an object in the same bucket. This feature helps protect against accidental deletion or overwrite, as you can restore previous versions of an object if needed.

**Storage class:** A storage class in Amazon S3 is like a category or type of storage option for your data. Each storage class has its own set of characteristics, such as cost, durability, and availability that determine how your data is stored and managed in the cloud. You can choose the storage class that best fits your needs based on factors like how frequently you access your data, how quickly you need it, and how much you're willing to pay for storage.

**AWS Management Consale:** It's a website where you can manage all your AWS services using a point-and-click interface. You can do things like starting virtual servers, storing files, and setting up security rules, all without needing to write any code.

**CLI (Command Line Interface):** This is a tool that let γου control AWS services using text commands typed into a terminal or command prompt. It's handy for automating tasks and scripting repetitive actions.

**SDKS (Software Development Kits):** SDKs are packages of tools and code that help developer build applications that use AWS services. They provide ready-made functions and examples to make it easier to integrate AWS into your software projects, whether you're coding in Java, Python, JavaScript, or another language.


## What is S3 Versioning?

Imagine you're working on a big project and you accidentally delete an important file. But wait, with S3 versioning, it's like having a magic undo button

Here's how it works Normally when you delete a file in S3, it's gone for good. But with versioning turned on. S3 keeps a copy of every version of your file, even if you delete or overwrite it. So if you make a mistake, you can easily go back to a previous version and restore it just like rewinding time.

This feature is super handy for protecting your data from accidents or malicious actions. Its like having a safety net for your files, ensuring that even if something goes wrong, you can always recover your precious data. Plus, it's easy to turn on manage, giving you peace of mind knowing that your files are always safe and sound in Amazon S3.

Breaking it down into five parts so that it will help us understand it more clearly.

Firstly, I will create a new bucket in Amazon S3 to store our files .Following that, we will upload a file into this newly created bucket. Subsequently, we wil enable versioning for the bucket, allowing us to retain multiple versions of our uploaded files for tracking changes over time. Next, we will configure the permissions for the bucket to enable public access, ensuring that the files can be accessed by anyone with the appropriate link. Finally, we will implement lifecycle policies to automate the management of our files.

## Practical Phase: Setting up the Creation of an Amazon S3 Bucket

1. Firstly, I log in to my AWS management console with **Orisun** as the user because have ready grant him admin role to carry out all tasks.
![3. AWS S3](./IMG/3.%20AWS%20S3.png)
2. Then I navigate to the search bar, and search for **S3** then click on **S3** which direct me to S3 page, then click on **Create bucket**.
![4. Create Bucket](./IMG/4.%20Create%20Bucket.png)
3. The next page, these are what I select, under
- `Bucket type` -- **General purpose**
- `Bucket name` -- **my-first-aws-s3bucket** 
- `Object Ownership` -- **ACLs disabled**
- `Block Public Access settings for this bucket` -- **Block all public access**
- `Bucket Versioning` -- **Disable**
- `Default encryption` -- **Server-side encryption with Amazon S3 managed keys (SSE-S3)**
- `Bucket Key` -- **Enable**
![5. Create Bucket 1](./IMG/5.%20Create%20Bucket%201.png)
![6. Create Bucket 2](./IMG/6.%20Create%20Bucket%202.png)
![7. Versioning](./IMG/7.%20Versioning.png)
![8. Bucket Key](./IMG/8.%20Bucket%20Key.png)
then I click on **Create bucket**
4. Then bucket creation was successful.
![9. Bucket Created Successfully](./IMG/9.%20Bucket%20Created%20Successfully.png)

**Note:** I have to use different name before I was able to get the unique name.

## Upload Object to Bucket Created

1. I open my Notepad application and create a new file which I name **welcome.txt**
2. Then inside the file I put this content in it, **Welcome to the AWS World.**
![10. Notepad](./IMG/10.%20Notepad.png)
3. Then I click on bucket name **my-firs-aws-s3bucket** to inside the bucket and click on **Upload** to send the file I created inside the bucket, on the next page I click on **file** that means to upload file.
![11. Upload File](./IMG/11.%20Upload%20File.png)
then click on **Upload**.
4. Upload was successful.
![12. Upload Successfully](./IMG/12.%20Upload%20Successfully.png)

## Enabling Versioning.

1. On the bucket Properity I noticed that the versioning is currently diabled.
![13. Bucket Versioning](./IMG/13.%20Bucket%20Versioning.png)
2. Then I click on *Edit** and select **Enable** under `Bucket versioning`, then click on **Save**.
![14. Edit Version](./IMG/14.%20Edit%20Version.png)
3. Now I head back to my Notepad I modify the last file which is **welcome.txt**, then put this content inside **I am adding this content after enabling bucket versioning.**, then I save the file.
4. Then I upload the file again with the pervious steps above, then click on the switch beside **Show versions** to see all the versions of my files.
![15. Show Version](./IMG/15.%20Show%20Version.png)

## Setting Permission

1. Still inside my bucket, I navigate to the permission section and I noticed that **Block all public access** is on, which means that on one can have access to the file with ip address.
![16. Access Block](./IMG/16.%20Access%20Block.png)
2. Then I click on **Edit** and uncheck the **Block all public access** to allow public ip address access to my bucket, then click on **Save**.
![17. Allow Access](./IMG/17.%20Allow%20Access.png)
3. Then check again and is off.
![18. Public Off](./IMG/18.%20Public%20Off.png)
4. Still on the permission section I navigate to the `Bucket policy` and click on **Edit** to create bucket policy I want the public ip to perform on my files.
![19. Bucket Policy](./IMG/19.%20Bucket%20Policy.png)
5. Then I click on **Policy generator**.
![20. Policy Generator](./IMG/20.%20Policy%20Generator.png)
5. A new page was opened
- I select **S3 Bucket Policy** under `Select Type of Policy`
- Under `Effect` I select **Allow**
- Under `Principal` I write **'*'** which means to select all Users.
- Under `Actions` here I select 2 actions which are **1. Get object** and **2. Get object version**.
- Under `Amazon Resource Name (ARN)` I input **arn:aws:s3:::my-firs-aws-s3bucket**.
**Note -** ARN means Amazon Resource Name.
![21. Generator](./IMG/21.%20Generator.png)
Then click on **Add Statement** then **Generate Policy**.
![22. Generate Policy](./IMG/22.%20Generate%20Policy.png)
6. Then I copy this generated code.
![23. Code Generated](./IMG/23.%20Code%20Generated.png)
7. Then I paste the generated code on the bucket policy section and click on **Save changes**
![24. Save Changes](./IMG/24.%20Save%20Changes.png)
8. Successful.
![25. Policy Success](./IMG/25.%20Policy%20Success.png)
9. Then I went back to my object and select the first version of my file.
![26. Version 1](./IMG/26.%20Version%201.png)
10. Then copy the URL of the object.
![27. Version 1 URL](./IMG/27.%20Version%201%20URL.png)
11. Then I paste the link I copied to a new tab on my google chrome, which show my pervious version of **welcom.txt** file.
![28. Show Version1](./IMG/28.%20Show%20Version1.png)
12. I repeat the same process for the second version, I copied the URL then paste it on the broswer.
![29. Show Version2](./IMG/29.%20Show%20Version2.png)

## Creating Lifecycle Policies

1. Still inside my bucket, I navigate to the **Management** section then click on **Create lifecycle rule**
![30. Create lifecycle rule](./IMG/30.%20Create%20lifecycle%20rule.png)
2. Then in the next page I perform the following:
- `Lifecycle rule name` -- **my-lifecycle-rule**
- `Choose a rule scope` -- **Limit the scope of this rule using one or more filters**.
- `Prefix` -- **.txt**
- `Minimum object size` -- **2 GB**
- `Maximum object size` -- **10 GB**
- `Lifecycle rule actions` -- **Transition current versions of objects between storage classes**.
- `Choose storage class transitions` -- **Standard-IA**
- `Days after object creation` -- **30**
![31. Lifecycle1](./IMG/31.%20Lifecycle1.png)
!![32. Lifecycle2](./IMG/32.%20Lifecycle2.png)
Then click on **Create rule**.
![33. All Done](./IMG/33.%20All%20Done.png)


This rule is set up automatically move files one type of storage to another in the Amazon S3 bucket. Specifically, it moves files to a storage type called Standard-IAstorage is cheaper than default storage option. So, if you have fiiles that you don't access very often but still want to keep, this rule helps you save costs by storing them in a cheaper storage class after a certain period of time.

## Project Reflection

- I have gained hands-on experience with Amazon S3, a core service of AWS.
- I have managed S3 buckets and objects. learning key concepts like versioning, permissions management, and lifecycle policies.
- Through practical tasks, I developed a solid understanding of S3 features.
- I learnt to optimize storage costs and ensure data reliablity and accessibility using AWS features.
- This project equipped me with valuable skill applicable to real-world scenarios.
































