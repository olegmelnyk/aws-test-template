#!/bin/bash

action=$1

#--parameters ParameterKey=MasterInstanceType,ParameterValue=t2.small.elasticsearch ParameterKey=DataInstanceType,ParameterValue=t2.small.elasticsearch \
#--parameters ParameterKey=ZoneAwarenessEnabled,ParameterValue=true ParameterKey=DeploymentType,ParameterValue=production \

if [[ "$action" == "create" ]]; then
  aws cloudformation create-stack --profile romexsoft-oleh \
  --region eu-central-1 \
  --stack-name fgactest \
  --capabilities CAPABILITY_IAM \
  --template-body file://$PWD/template.yaml
elif [[ "$action" == "update" ]]; then
  aws cloudformation update-stack --profile romexsoft-oleh \
  --region eu-central-1 \
  --stack-name fgactest \
  --capabilities CAPABILITY_IAM \
  --template-body file://$PWD/template.yaml
elif [[ "$action" == "delete"  ]]; then
  aws cloudformation delete-stack --profile romexsoft-oleh \
  --region eu-central-1 \
  --stack-name fgactest
fi;
