# SFTP Server Creation

These scripts are aimed at automating the process of creating an SFTP server hosted via AWS Transfer Service.

In order to create a new SFTP Server hosted under the existing AWS Transfer Instance, we need to perform the following steps:

1. Create the default folder structure within a new S3 folder for the client.
2. Create a new user account (username & password) via AWS Secrets Manager.

These 2 steps have now been automated via the 2 scripts in this repository.

**Run each step in this way (*after updating the script with the specific client parameters*):**

`./s3_creation.sh`

or 

`./secret_creation.sh`


> **NOTE**: Currently this only works in STAGING AWS as we don't have similar permissions for PROD AWS.