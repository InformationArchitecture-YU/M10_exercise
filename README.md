# M10 Exercise: Create a flat file exchange with a checksum 

In this exercise, you will follow the steps to create a flat file exchange from your MySQL database and load it into an s3 bucket. The following are the steps that we will take: 

<ul>
<li>Step 1. Generate Dimension Files. Steps below. In this example, we will generate just one file. </li>
<li>Step 2. Move Files to folder 'checksum'</li>
<li>Step 3. Create check sum procedure</li>
<li>Step 4: Zip files with checksum in directory called checksum. </li>
<li>Step 5: Load zipped package into AWS S3 with checksum. </li> 
</ul>

## What you need to complete this exercise?
You will need to have the following installed in order to complete the exercise: 
<ul>
<li>Python 3.0+</li>
<li>Jupyter</li>
<li>MySQL v8.0+</li>
</ul>

The following Python Libraries are used:  email, smtplib, ssl, xlrd, xlwt, s3fs, hashlib, shutil, time, boto3, os, re, mysql.connector.

For the s3fs and boto3 libraries it is important that you followed the exercises in M9 in order to complete assigning your AWS credentials and connect to AWs, create and upload a file to that location. 

The exercise has scripts loaded into this GitHub in the following location: flat_file_exchange/scripts. You will need to downlaod these scripts in order to run them and complete the exercise. 

## What is the benefit of this exercise?
Fundamentally, it is to learn about file verification processes. With this exercise you will get an opportunity to use the dimension files that we have created in previous labs. Moreover, this lab contains a <a href ="https://en.wikipedia.org/wiki/MD5" target="blank">MD5 hash procedure</a>, which will be generated from the dimension flat file that you have created. The MD5 hash algorithm will provide an output based on the data in the file. When the file is sent to the target database, the same check procedure. This same MD5 hash should produce the same output if the file has not been corrupted (data in the file has changed). If the file is corrupted (i.e., the data in the file has been altered), a different hashed output will occur and the file should be blocked. Hence, this procedure is used for data integrity and file verification processes. 

![image info](./pictures/image.png)

See <a href ="https://www.securityfocus.com/bid/11849/discuss" target="blank">MD5 Message Digest Algorithm Hash Collision Weakness </a> and take note of the vulnerabilities of the MD5 hash algorithm in particular. Other <a href = "https://en.wikipedia.org/wiki/Secure_Hash_Algorithms" target="blank">hash alogorithms</a> are more secure and used for different security purposes. This exercise is meant to be a worked example. 





