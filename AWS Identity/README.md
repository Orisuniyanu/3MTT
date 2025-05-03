# AWS Identity and Access Management Mini project

## Introduction
AWS Identity and Access Management (IAM), helps control who can access what in Amazon Web Services. In this project I'll cover things like users, roles, policies, and groups, and I'll also show how to actually set them up to keep my AWS resources safe.

## Project Goals:

- Understand AWS Identity and Access Management (IAM) principles and components.
- Learn to create and manage IAM policies for regulating access to AWS resources securely.
- Apply IAM concepts practically to control access within AWS environments.
- Explore best practices for IAM implementation and security in AWS.

## Learning Outcomes:

- Recognize IAM components like users, roles, policies, and groups.
- Create and manage IAM policies to define permissions for users and roles.
- Set up AM users, groups, and roles to control access to AWS services.
- Understand IAM best practices for maintaining security and managing access to AWS resources

## What is IAM?

IAM, or identity and Access Management. Think of it as the gatekeeper for your AWS resources, its job is to decide who gets in and what they're allowed to do once they're inside.

Imagine you have this big digital "house" full of all your AWS stuff-your data, your applications, the whole shebang. Now, you don't want just anyone wandering in and messing around with your things, right? That's where IAM steps in

It's like having your own VIP list for your digital world. IAM helps you keep your AWS resources safe and sound, making sure only the right people get in and that they're only allowed to do what you say they can. It's all about keeping your digital house in order and protecting your precious stuff from any unwanted guests.

Note- AWS resources are the various services and tools provided by Amazon Web Services (AWS) that users can utilize to build and manage their applications and infrastructure in the cloud.


## What is IAM user?

IAM users are like individual accounts for different people or entities within your AWS environment.

For example, if you have a team working on a project, you can create separate IAM users for each team member. Each IAM user would have their own unique username and password, allowing them to access the AWS resources they need for their work.

IAM users help you manage and control access to your AWS resources securely, ensuring that each user only has access to the resources they need to perform their tasks.


## What is IAM Role?

An IAM role defines what someone or something (like an application or serviceS can do within your AWS account. Each role has a set of permissions that determine which actions it can perform and which AWS resources it can access

For example, you might have an 'admin' role that gives full access to all resources, or a "developer" role that only allows access to certain services for building applications.

Or if we take another example, imagine you have a visitor who needs temporary access to your house to fix something. Instead of giving them a permanent key (IAM user), you give them a temporary key (IAM role) that only works for a limited time and grants access to specific rooms (AWS resources).

AM roles are flexible and can be assumed by users, services, or applications as needed. They are commonly used for tasks such as granting permissions to AWS services, allowing cross-account access, or providing temporary access to external users. AM roles enhance security and efficiency by providing controlled access to AWS resources without the need for permanent credentials.

## What is IAM Policy?

An AM policy is a set of rules that define what actions a role can take. These rules specify the permissions granted to the role. Think of a policy as a rulebook for the role. It outlines which actions are allowed and which are not, helping to ensure secure and controlled access to your AWS resources.

For example, the rulebook might say that the "admin" key (IAM role or user) can open any door and perform any action within the house (AWS resources), while the viewer key (IAM role or user) can only open certain doors and look around, but not make any changes.

IAM policies define the permissions granted to SAM roles and users, specifying which AWS resources they can access and what actions they can take They are essential for maintaining security and controlling access to AWS Nesources, ensuring that only authorized actions are performed by users and roles within your AWS account.

## What is IAM group?

IAM Groups are like collections of IAM users. Instead of managing permissions for each user individually, you can organize users into groups based on their roles or responsibilities.

You can think IAM Groups as these neat little collections of users with similar roles or responsibilities. It's like putting everyone into teams based on their tasks. So, you might have a group for developers, another for administrators, and so on. So instead of setting permissions for each person one by one, you set them up for the whole group at once.

For example, let's say you have a development team working on a project, Instead of assigning permissions to each developer one by one, you can create an IAM Group called "Developers' and add all the developers to that group. Then, you assign permissions to the group as a whole. So, if you want all developers to have access to the same resources, you only need to set it up once for the group.

## Best Practices:

- Give only the permissions needed: Don't give more access than necessary.
- Use roles instead of usen: Roles are safer and can be used when needed.
- Review roles regularly: Remove unused roles to keep things tidy and secure
- Add extra security with MFA: Use Multi-Factor Authentication for extra protection.
- Use ready-made policies: They're safer and easier to use
- Keep policies simple: Make separate policies for different tasks
- Keep track of chariges: Keep a record of who changes what
- Test policies before using thern: Make sure they work the way you want them to before applying them to real stuff.
- Use descriptive names: Choose clear and descriptive names for IAM groups to facilitate understanding and management. 
- Enforce strong password policies: Encourage users to create strong passwords and implement expiration and complexity requirements.

**Note-** (difference between users and roles) In AWS, users are like individual people with their own set of keys to access resources. These keys are permanent and tied to specific individuals. It's similar to having your own key to the front door of your house-It's always yours.

On the other hand, roles in AWS are more like special keys that can be used by different people or even programs. These keys provide temporary access and can be used by different users as needed. Roles are like master beys that can be used by anyone who needs access to certain things temporarily. So, while users are tied to specific individuals, roles are more flexible and con be shared among different users for specific tasks.

## Multi-Factor Authentication (MFA) for IAM

AWS multi-factor authentication (MFA) is an AWS Identity and Access Management (IAM) best practice that requires a second authentication factor in addition to user name and password sign-in credentials. You can enable MFA at the AWS account level for root and IAM users you have created in your account.  

With MFA enabled, when a user signs in to the AWS Management Console, they are prompted for their user name and password— something they know—and an authentication code from their MFA device— something they have (or if they use a biometrics-enabled authenticator, something they are). Taken together, these factors improve security for your AWS accounts and resources.

[READ MORE ABOUT MFA FOR IAM HERE](https://aws.amazon.com/iam/features/mfa/)

## Pratical 

A growth marketing consultancy company called **GatoGrowFast.com** wants to give some access to their employee Eric, Jack and Ade to the Aws resources. Let's see how it is being setup.

We'll do it in Two parts. In the first part of the practical, we'll create a policy granting full acces to EC2. Then, well create a user named Eric and attach that policy to him. 

In the second part, we'll create a group and add two more users, Jack and Ade, to that group Afterward, well create a policy for granting full access to EC2 and S3, and attach it to a  group.

## Part 1

1. I navigate to AWS Management console then I signed in as root using my Email address and my password.
2. On the sesrch bar, I search for `IAM`
![1. IAM](./IMG/1.%20IAM.png)
3. Now on the left side, I select **Policy**, then on the search tab I type **EC2** then select **AmazonEC2FullAccess**, then I proceed to the top right side and click on `Create policy`.
![2. Create Policy](./IMG/2.%20Create%20Policy.png)
4. Then I click on **All EC2 actions**.
![3. EC2 Action](./IMG/3.%20EC2%20Action.png)
4. Then I tick on **All Resource** and click on **Next**.
![4. IAM Resource](./IMG/4.%20IAM%20Resource.png)
5. Then I provide **Policy name** as **Policy_For_Eric** and **Description** as **This is to provide Eric access to full EC2 instance.** then I click on **Create policy**.
![5. Create Policy](./IMG/5.%20Create%20Policy.png)
6. This policy is created.
![6. Eric Created](./IMG/6.%20Eric%20Created.png)
7. Then I proceed to **User** section, then click on **Create User**.
![7. Eric User](./IMG/7.%20Eric%20User.png)
8. Then I name the user **Eric** 
- then tick the small box of **Provide user access to the AWS Management Console** to enable Eric to access the web interface
![8. Eric Details](./IMG/8.%20Eric%20Details.png)
- Then select **I want to create an IAM user** under **Are you providing console access to a person?**
- Then I select **Custom password** under **Console password** which I provide a password for Eric
- Then I tick the box **Users must create a new password at next sign-in** and I click on **Next**.
![9. Eric Next](./IMG/9.%20Eric%20Next.png)
9. Now under `Set permissions` I select **Attach policies directly**
![10. Eric Permission](./IMG/10.%20Eric%20Permission.png)
- Then I filter it to customer managed policies
- Then under **Policy name** I select **Policy_For_Eric** then I click on **Next**.
![11. Custom Permission](./IMG/11.%20Custom%20Permission.png)

**Noet - AWS Policies
- **Managed Policies:** Made by AWS, used by many.
- **Customer Managed Policies:** You make and managed them.
- **Inline Policies:** Made for one specific thing.
For further details, refer to [Policies and permission in IAM in IAM dockumentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)
- Then under **Review and create** after the review and everything look good, I click on **Create user**.
![12. Eric Review](./IMG/12.%20Eric%20Review.png)
- And Eric creation was successful then I click on **Download .csv file** to have have Eric details as a file for future reference, then I click on **Return to user list**.
![13. Download Eric](./IMG/13.%20Download%20Eric.png)


## Part 2

1. Still on IAM tab I click on **User groups**, then I enter a name for the group which is **Development-team.**
![14. Development Team](./IMG/14.%20Development%20Team.png)
2. Then click on **Create user group** at the bottom of the page.
![15. User Group](./IMG/15.%20User%20Group.png)
3. Successful create **Development-team** group.
![16. Successfully Created](./IMG/16.%20Successfully%20Created.png)
4. Then I proceed to **"User"** section, where I click on **Users** on the **IAM** tab, then **Create user**.
![17. Create User](./IMG/17.%20Create%20User.png)
5. And I name the new user `**Jack**` then click on **Next**.
![18. Jack User](./IMG/18.%20Jack%20User.png)
6. Then in the `Permission section`, under **Permission options** I select **Add user to group**, Then select **Development-team** which is under **User groups**, then click on **Next**.
![19. Jack Permission](./IMG/19.%20Jack%20Permission.png)
7. Then I review the summary before cliking on **Create user**.
![20. Jack Good](./IMG/20.%20Jack%20Good.png)
8. I also repeat the process for `Ade` and also add him to **Development-team**.
![21. Ade User](./IMG/21.%20Ade%20User.png)
9. Then I navigate to **Policies** still under **IAM** section, then click on **Create policy.**
10. Then under services, I choose tw services which are **EC2** and **S3**, then click on **Next**.
![22. EC2](./IMG/22.%20EC2.png)
![23. S3](./IMG/23.%20S3.png)
11. On the **Review and create**, `Policy details` is **development-team-policy** `Description - optional` is **This policy is for Development to allow to perform differedifferent activities on both EC2 and S3 Resources**.
![24. Review](./IMG/24.%20Review.png)
then click on **Create policy**.
![25. Create policy](./IMG/25.%20Create%20policy.png)
successful
![26. Policy Created](./IMG/26.%20Policy%20Created.png)
12. Then I navigate again to **User groups** under `IAM` and click on `Development-team` under **Group name**
![27. Development Team](./IMG/27.%20Development%20Team.png)
13. Then I click on **Add permission** which brought out two options for me which I select **Attach policies**
![29. Attach Policies](./IMG/29.%20Attach%20Policies.png)
14. After that I filter and select **Customer managed** as the policy type, then I choose **development-team-policy** I created, then click on **Attach policies**.
![30. Attach policies](./IMG/30.%20Attach%20policies.png)
Successful Attached
![31. Successful Attached](./IMG/31.%20Successful%20Attached.png)

## Project reflection:

- Understanding IAM: IAM serves as the security foundation for AWS resources, controlling access and permissions.
- Security Importance: IAM ensures data protection compliance, and prevents unauthorized access.
- Policy Creation: Participants learned to craft IAM policies to regulate resource access effectively.
- Practical Application: Hands-on exercises equipped participants to set up IAM users, groups, and roles, enhancing their real-world IAM implementation skills.