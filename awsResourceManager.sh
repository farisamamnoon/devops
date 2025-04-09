#!/bin/bash

###################
# Author: Faris Mamnoon
# Date: 6th April 2025
# 
# This script monitors the AWS resources in use
#
########################

set -x # Debug mode

# Print ec2 instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# Print s3 buckets
aws s3 ls

# Print Lambda functions
aws lambda list-functions

# Print IAM users
aws iam list-users
