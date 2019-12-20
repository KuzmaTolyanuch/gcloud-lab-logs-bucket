#! /bin/bash
# Get default project id
PROJECT_NAME=`gcloud config list --format 'value(core.project)'`
# delete project
gcloud -q projects delete $PROJECT_NAME
