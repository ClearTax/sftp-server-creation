#USER INPUT - BEGIN#
CLIENT_NAME="datamatics"
CLIENT_EMAIL_ADDRESS="anwar.shaikh@datamatics.com"
#environment will either be staging (aws_ct_staging) or prod (aws_ct_prod)
#environment name is based on the AWS CLI user profile you've created on your system
CURRENT_ENVIRONMENT="aws_ct_staging"
DEFAULT_REGION="ap-south-1"
#USER INPUT - END#

#CREATE SFTP TRANSFER USER#
USERNAME="${CLIENT_NAME}_ftp_user"
ROLE_ARN="arn:aws:iam::612304127751:role/BaseIAMRole"
RANDOM_PASSWORD=$(LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''*+.?@^' </dev/urandom | head -c 13 ; echo)
SECRET_VALUE='{"HomeDirectory":"/ct-integrations-sftp/'$CLIENT_NAME'", "Password":"'$RANDOM_PASSWORD'","Role":"'$ROLE_ARN'"}'
aws secretsmanager create-secret --name SFTP/$USERNAME --description "SFTP Transfer User" --secret-string '{"HomeDirectory":"/ct-integrations-sftp/'$CLIENT_NAME'", "Password":"'$RANDOM_PASSWORD'","Role":"'$ROLE_ARN'"}' --profile $CURRENT_ENVIRONMENT --region $DEFAULT_REGION
echo "Created Staging Transfer User with this config: $SECRET_VALUE"

#CREATE FTP MAGNET USER#
USERNAME="${CLIENT_EMAIL_ADDRESS}"
RANDOM_PASSWORD=$(LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''*+.?@^' </dev/urandom | head -c 13 ; echo)
SECRET_VALUE='{"HomeDirectory":"/ct-integrations-sftp/'$CLIENT_NAME'", "Password":"'$RANDOM_PASSWORD'","Role":"'$ROLE_ARN'"}'
aws secretsmanager create-secret --name SFTP/$USERNAME --description "FTP Magnet User" --secret-string '{"HomeDirectory":"/ct-integrations-sftp/'$CLIENT_NAME'", "Password":"'$RANDOM_PASSWORD'","Role":"'$ROLE_ARN'"}' --profile $CURRENT_ENVIRONMENT --region $DEFAULT_REGION
echo "Created FTP Magnet User with this config: $SECRET_VALUE"