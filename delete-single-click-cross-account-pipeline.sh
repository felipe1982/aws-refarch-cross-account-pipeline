#!/usr/bin/env bash
echo -n "Enter ToolsAccount ProfileName for AWS Cli operations> "
read ToolsAccountProfile
echo -n "Enter DevAccount ProfileName for AWS Cli operations> "
read DevAccountProfile
echo -n "Enter TestAccount ProfileName for AWS Cli operations> "
read TestAccountProfile
echo -n "Enter ProdAccount ProfileName for AWS Cli operations> "
read ProdAccountProfile


#7
echo "Deleting sample-lambda-pipeline from Tools Account"
aws cloudformation delete-stack --stack-name sample-lambda-pipeline --profile $ToolsAccountProfile
#6
echo "Removing Permissions to the CMK in Tools Account"
aws cloudformation delete-stack --stack-name pre-reqs --profile $ToolsAccountProfile
#5
echo "Deleting Pipeline in Tools Account"
aws cloudformation delete-stack --stack-name sample-lambda-pipeline --profile $ToolsAccountProfile
#4
echo "Deleting in PROD Account"
aws cloudformation delete-stack --stack-name toolsacct-codepipeline-cloudformation-role --profile $ProdAccountProfile
#3
echo "Deleting in TEST Account"
aws cloudformation delete-stack --stack-name toolsacct-codepipeline-cloudformation-role --profile $TestAccountProfile
#2
echo "Deleting in DEV Account"
aws cloudformation delete-stack --stack-name toolsacct-codepipeline-role --profile $DevAccountProfile
#1
echo "Deleting prerequisites in Tools Account"
aws cloudformation delete-stack --stack-name pre-reqs --profile $ToolsAccountProfile
