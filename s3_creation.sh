#USER INPUT - BEGIN#
CLIENT_NAME="randomtestclient"
#environment will either be staging (aws_ct_staging) or prod (aws_ct_prod)
#environment name is based on the AWS CLI user profile you've created on your system
CURRENT_ENVIRONMENT="aws_ct_staging"
#ROOT BUCKET for STAGING is ct-integrations-sftp
#ROOT BUCKET for PROD is ct-sftp-integrations
ROOT_BUCKET="ct-integrations-sftp" 
#USER INPUT - END#

#CREATE S3 BUCKETS#
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/ --profile $CURRENT_ENVIRONMENT
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/GENERATE_IRN/INPUT/FAILED/ --profile $CURRENT_ENVIRONMENT
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/GENERATE_IRN/INPUT/INIT/ --profile $CURRENT_ENVIRONMENT
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/GENERATE_IRN/INPUT/PROCESSED/ --profile $CURRENT_ENVIRONMENT
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/GENERATE_IRN/INPUT/PROCESSING/ --profile $CURRENT_ENVIRONMENT
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/GENERATE_IRN/OUTPUT/GENERATION_ERR/ --profile $CURRENT_ENVIRONMENT
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/GENERATE_IRN/OUTPUT/SUCCESS/ --profile $CURRENT_ENVIRONMENT
aws s3api put-object --bucket $ROOT_BUCKET --key ${CLIENT_NAME}/GENERATE_IRN/OUTPUT/UPLOAD_ERROR/ --profile $CURRENT_ENVIRONMENT
echo "Created S3 buckets for client $CLIENT_NAME"