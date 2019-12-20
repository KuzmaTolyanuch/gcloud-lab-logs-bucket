#! /bin/bash
# Get default project id
PROJECT_NAME=`gcloud config list --format 'value(core.project)'`
# get 1st billing account id
BILLING_ACCOUNT_ID=`gcloud beta billing accounts list --format='value(name.basename(account_id))' | head -n 1`
# unset billing account from current project
gcloud beta billing projects unlink $PROJECT_NAME --billing-account=$BILLING_ACCOUNT_ID
# delete project
gcloud -q projects delete -y $PROJECT_NAME
