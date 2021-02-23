#SFTP Server Creation
These scripts are aimed at automating the process of creating an SFTP server hosted via AWS Transfer Service.

In order to create a new SFTP Server hosted under the existing AWS Transfer Instance, we need to perform the following steps:

1. Create the default folder structure within a new S3 folder for the client.
2. Create a new user account (username & password) via AWS Secrets Manager.

These 2 steps have now been automated via the 2 scripts in this repository.

> **NOTE**: Unfortunately this script will only work in the STAGING AWS account as we do not have the required permissions in our PRODUCTION AWS account.