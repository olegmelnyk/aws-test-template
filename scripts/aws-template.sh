#!/bin/bash

action=$1

if [[ "$action" == "create" ]]; then
  aws cloudformation create-stack --profile oleh-test \
  --region eu-central-1 \
  --stack-name fgactest \
  --capabilities CAPABILITY_IAM \
  --parameters ParameterKey=MasterInstanceType,ParameterValue=t2.small.elasticsearch ParameterKey=DataInstanceType,ParameterValue=t2.small.elasticsearch \
  --template-body file://$PWD/template.yaml
elif [[ "$action" == "update" ]]; then
  aws cloudformation update-stack --profile oleh-test \
  --region eu-central-1 \
  --stack-name fgactest \
  --capabilities CAPABILITY_IAM \
  --parameters ParameterKey=MasterInstanceType,ParameterValue=t2.small.elasticsearch ParameterKey=DataInstanceType,ParameterValue=t2.small.elasticsearch \
  --template-body file://$PWD/template.yaml
elif [[ "$action" == "delete"  ]]; then
  aws cloudformation delete-stack --profile oleh-test \
  --region eu-central-1 \
  --stack-name fgactest
fi;
