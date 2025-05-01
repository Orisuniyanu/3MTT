# Introduction to Cloud Computing Security & Identity Management (IAM)

## Introduction

This mini project is designed to guide me through the intricacies of Amazon Web Services (AWS), specifically focusing on Identity and Access Management (IAM). Before diving into the specifics of IAM, it's crucial to establish that a basic understanding of cloud computing principles is a prerequisite for this project. 

As a recap, Cloud Computing it involves delivering computing services over the internet, including servers, storage, databases, networking, software, analytics, and intelligence, to offer faster Innovation, flexible resources, and economies of scale.

In this project, I will be working with a hypothetical fintech startup named Zappy e-Bank. This fictitious company represents a typical startup venturing into the financial technology sector, alming to leverage the clouds power to innovate, scale, and deliver financial services. The scenario is set up to provide a realistic backdrop that will help me understand the application of AWS IAM in managing cloud resources securely and efficiently.

## The Importance of IAM for Zappy e-Bank

For Zappy e-Bank, like any company dealing with financial services, security and compliance are paramount. The company must ensure that its data, including sensitive customer information, is securely managed and that access to resources is tightly controlled. AWS IAM plays a critical role in achieving these security objectives by allowing the company to define who is authenticated (signed in) and authorized (has permissions) to use resources or even do anything on the environment.

## What IAM will Help Zappy E-Bank

1. Create and manage AWS users and groups, to control access to AWS services and resources securely.

2. Use IAM roles and policies to set more granular permissions for AWS services and external users or services that need to access Zappy e-Bank' AWS resources

3. Implement strong access controls, including multi-factor authentication (MFA), to enhance security.

This project walked me through setting up IAM for Zappy e-Bank, creating a secure environment that reflects real-world usage and challenges. Through this hands-on experience, I learnt the fundamentals of IAM, how to manage access to AWS resources, and best practices for securing cloud environment.

## Project Goals and Learning Outcomes

By the end of this project, I have:

1. Gained a solid understanding of AWS IAM, including users, groups, roles, and policies. 
2. Learned how to apply IAM concepts to secure a fintech startup's cloud infrastructure.
3. Developed practical skills in using the AWS Management Console to manage IAM.
4. Understood the significance of secure access management and its impact on compliance and data security in the fintech industry.


## Project Startup

1. **Log in to the AWS Management Console:** 
I login to my AWS account with my **adminstrative account** (**Root User**) I create in the last project.
![1. AWS Signin](./IMG/1.%20AWS%20Signin.png)
2. Then I navigate to the IAM Dashboard: Here, I'll manage users, groups, roles, and policies.
![2. IAM](./IMG/2.%20IAM.png)


## Creating IAM Users

An IAM user is a unique identity within an AWS account that represents a person or service, granting specific permissions to access and Interact with AWS resources under controlled and customizable security policies.

Imagine that you have a big, secure building (AWS account) that you own and control. When you first get the keys to this building, you're given a master key (root user) that can open every door, access every floor, and make changes to the building's structure itself.

This master key is powerful, allowing you to do anything from adding new rooms (services) to changing the locks (security settings). However, because this key can do so much, it's also very risky to use it for daily tasks-like if you lost it, someone could do anything they want with your building.

Now, imagine you have specific tasks that need to be done in the building, like cleaning, maintenance, or security checks. You wouldn't give out your master key to every person who needs to do those jobs. Instead, you create specific keys (IAM users) that can only open certain doors or access certain floors. These keys are less powerful but much safer to use for everyday tasks. They ensure that the people holding them can only access the parts of the building they need to do their jobs and nothing more.

Let's set up AM users for a backend developer, John, and a data analyst, Mary, by first determining their specific access needs.

As a backend developer, John requires access to servers (EC2) to run his code, necessitating an IAM user with policies granting EC2 access.

As a data analyst, Mary needs access to data storage (AWS S3 service), so her IAM user should have policies enabling S3 access.

Considering Zappy e-Bank's plan to expand its team with 10 more developers and 5 additional data analysts in the coming months, it's inefficient to individually create similar policies for each new member. A more streamlined approach involves:

1. Crafting a single policy tailored to each role's access requirements.

2. Associating this policy with a group specifically designed for that role. 
3. Adding all engineers or analysts to their respective groups, simplifying the management of permissions and ensuring consistent access across the team.

## Create Policy for the Development Team

1. In the IAM console, I click on policies, then I click on `Create Policy`.
![3. Policies](./IMG/3.%20Policies.png)
2. Then in the select a service section, I click on the drop down and select `EC2`, then for simplicity sake, I checkbox the option `All EC2 Actions`.
![4. Policy Editor](./IMG/4.%20Policy%20Editor.png)
3. Also, I make sure to select **All** in the Resource section, then click on `Next`.
![5. Resources](./IMG/5.%20Resources.png)
4. After that a new page displayed where I provide the **Policy name** then I input `Developers` and **Description** I input `This is to allow the developers team to access EC2 Instances`, then click `Create Policy`.
![6. Create Policy](./IMG/6.%20Create%20Policy.png)
5. I noticed that after creating the policy, when I search for "developer" in the search box, I noticed that a number of policies are returned. This highlights the presence of both AWS managed and customer managed policies. AWS managed policies are predefined by AWS and provide permissions for many common use cases, allowing for quick and broad access management across AWS services without the need for custom policy creation like we just did. In contrast, customer managed policies are created and fully controlled by you, allowing for more tailored, specific access controls that can be finely tuned to your organization's requirements.
![7. Developer Policy](./IMG/7.%20Developer.png)


## Create Policy for the Data Analyst Team
1. In the IAM console, I click on policies, then I click on `Create Policy`.
![3. Policies](./IMG/3.%20Policies.png)

2. Then in the select a service section, I click on the drop down and select `S3`, then for simplicity sake, I checkbox the option `All S3 Actions`.
![8. S3 Policy](./IMG/8.%20S3%20Policy.png)

3. Also, I make sure to select **All** in the Resource section, then click on `Next`.
![5. Resources](./IMG/5.%20Resources.png)

4. After that a new page displayed where I provide the **Policy name** then I input `Analyst` and **Description** I input `This is to allow the analyst team to access S3 bucket Instances`, then click `Create Policy`.
![9. S3 Created](./IMG/9.%20S3%20Created.png)
5. Here's the result.
![10. Analyst Created](./IMG/10.%20Analyst%20Created.png)

## Create a Group for Developer Team

1. In the IAM console, I select `User groups` and in the right top corner I select `**Create group**`
![11. User Group](./IMG/11.%20User%20Group.png)
2. Then I provide a name for the group which I name `Development-Team`.
![12. Development Team](./IMG/12.%20Development%20Team.png)
3. Then I attached the **developer policy** I create earily for **Developer Team**, then click on `Create group.`
![13. Development Attached](./IMG/13,%20Development%20Attached.png)
4. And I have successful create **Development-Team**, which will be use only by the backend developer team.
![14. Development Successful](./IMG/14.%20Development%20Successful.png)


## Create a Group for Analyst Team

1. In the IAM console, I select `User groups` and in the right top corner I select `**Create group**`
![11. User Group](./IMG/11.%20User%20Group.png)
2. Then I provide a name for the group which I name `Analyst-Team`.
![15. Analyst-Team](./IMG/15.%20Analyst-Team.png)
3. Then I attached the **analyst policy** I create earily for **Analyst Team**, then click on `Create group.`
![16. Analyst Successful](./IMG/16.%20Analyst%20Successful.png)
4. And I have successful create **Analyst-Team**, which will be use only by the analyst team.
![17. Groups](./IMG/17.%20Groups.png)

## Creating IAM User for John

Let's not forget that **John** is one of the backend developer team, therefore he need to be added as a user to the `**Development-Team**` group.
1. I navigate to the IAM dashboard, select `User` and click `Create user`.
![18. Create User](./IMG/18.%20Create%20User.png)
2. Then I have 4 steps to complete before I could create the user I want.
- Step1: Under **Username** I input `John`, I make sure to tick the small box which is Provide user access to the AWS Management Console - optional, if not user will not be able to log in from the browser.
![19. John Step1](./IMG/19.%20John%20Step1.png)
![20. John Step2](./IMG/20.%2019.%20John%20Step2.png)
- Step 2: Set permissions - under **Permissions options** I select `Add user to group` and under **User groups** I select `Development-Team` for **John**, then click on `Next`.
![21. John Step3](./IMG/21.%20John%20Step3.png)
- Step 3: Review and create - Here give us the overview of my user, then I click on `Creat user`.
![22. John Create](./IMG/22.%20John%20Create.png)
- Step 4: Retrieve password - Details of my user was display here, then I download the login credentials for John.
![23. John Successful](./IMG/23.%20John%20Successful.png)

## Creating IAM User for Mary

Let's not forget that **Mary** is one of the analyst team, therefore he need to be added as a user to the **Analyst-Team**.

1. I navigate to the IAM dashboard, select `User` and click `Create user`.
![18. Create User](./IMG/18.%20Create%20User.png)
2. Then I have 4 steps to complete before I could create the user I want.
- Step1: Under **Username** I input `Mary`, I make sure to tick the small box which is Provide user access to the AWS Management Console - optional, if not user will not be able to log in from the browser.
![24. Mary 1](./IMG/24.%20Mary%201.png)
- Step 2: Set permissions - under **Permissions options** I select `Add user to group` and under **User groups** I select `Aanalyst-Team` for **Mary**, then click on `Next`.
![25. Mary2](./IMG/25.%20Mary2.png)
- Step 3: Review and create - Here give us the overview of my user, then I click on `Creat user`.
![26. Mary3](./IMG/26.%20Mary3.png)
- Step 4: Retrieve password - Details of my user was display here, then I download the login credentials for Mary.
![27. Download Mary](./IMG/27.%20Download%20Mary.png)

PROOF
![28. User](./IMG/28.%20User.png)

## Testing and Validation

### Test John's Access
1. I make sure to log out of the root account and I log in back as **John**.
2. Then it prompt me to change my password because of the configuration we place when creating the user.
Then I insert the old password, new password and re-enter the new password.
![29. John Login](./IMG/29.%20John%20Login.png)
3. Then I test if **John** can realy properly setup
4. I navigate to the **EC2** tab then start a **Ubuntu_server**.
![30. John EC2](./IMG/30.%20John%20EC2.png)
![31. John Start](./IMG/31.%20John%20Start.png)
5. I try to create **S3 Bucket** with **John** but is not allowed.
![32. John Bucket](./IMG/32.%20John%20Bucket.png)

So this indicate that **John** is properly setup in IAM.

### Test Mary's Access
1. I make sure to log out from John account and I log in back as **Mary**.
![33. Mary Next](./IMG/33.%20Mary%20Next.png)
2. Then it prompt me to change my password because of the configuration we place when creating the user.
Then I insert the old password, new password and re-enter the new password.
![34. Mary Reset](./IMG/34.%20Mary%20Reset.png)
3. Then I navigate to `**S3**` to test if **Mary** is IAM is set properly for her.
4. Then I create a new **S3 Bucket** which I name `iyanubucket`, and is successful.
![35. Iyanu Bucket](./IMG/35.%20Iyanu%20Bucket.png)
5. I also try if Mary can access **EC2 Instance** at all and I get error which really proved, I am set.
![36. Mary EC2](./IMG/36.%20Mary%20EC2.png)


## Implement Multi-Factor Authentication (MFA)
Now that I have created a new users. I create Multi-factor Authentication for John and Mary.

### Explain Multi-Factor Authentication (MFA)

MFA is a security feature that adds an extra layer of protection to Users AWS account and resources. With MFA enabled, users are required to provide two or more forms of authentication before they can access AWS resources.

John, the backend developer, logs into the AWS Management Console to access EC2 instance for deploying and testing his code. However, to further secure his access, Zappy e-Bank requres John to use MFA in addition to his regular username and password.

When John attempts to log in, after providing his username and password, AWS prompts him to enter a one-time code generated by a MFA device.

## Setting Up for John

1. I make sure to switched back to the **Root account**.
2. Then naviagte to **IAM** tab and click on **Users**, then select the user I want to modify in this case is **John**.
![37. John IAM](./IMG/37.%20John%20IAM.png)
3. Then I click on **Enabled without MFA** then **enable MFA** .
![38. John MFA](./IMG/38.%20John%20MFA.png)
4. Then I name the **Device name** as `John-MFA`, and also select `Authenticator app` under **Device options**, then I click on **Next**.
![39. John Auth](./IMG/39.%20John%20Auth.png)
5. I open my **Google authenticator** application on my mobile phone then I scan the QR Code, then I fill in the 2 consecutive code which is 10 seconds interval.
![40. John Google](./IMG/40.%20John%20Google.png)
6. After the above steps MFA is now enabled for John.
![41. John Okay](./IMG/41.%20John%20Okay.png)

## Setting Up MFA for Mary
1. I make sure to switched back to the **Root account**.
2. Then naviagte to **IAM** tab and click on **Users**, then select the user I want to modify in this case is **Mary**.
![37. Mary IAM](./IMG/37.%20John%20IAM.png)
3. Then I click on **Enabled without MFA** then **enable MFA** .
![42. Mary MFA](./IMG/42.%20Mary%20MFA.png)
4. Then I name the **Device name** as `Mary-MFA`, and also select `Authenticator app` under **Device options**, then I click on **Next**.
![43. Mary IAM](./IMG/43.%20Mary%20IAM.png)
5. I open my **Google authenticator** application on my mobile phone then I scan the QR Code, then I fill in the 2 consecutive code which is 10 seconds interval.
![44. Mary Google](./IMG/44.%20Mary%20Google.png)
6. After the above steps MFA is now enabled for Mary.
![45. Mary Okay](./IMG/45.%20Mary%20Okay.png)

7. Lastly, I try to log in to Mary to test the MFA enablement and it works.
![46. Mary Test](./IMG/46.%20Mary%20Test.png)






