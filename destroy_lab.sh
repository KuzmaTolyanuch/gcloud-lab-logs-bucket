#! /bin/bash
# Get default project id
PROJECT_NAME=`gcloud config list --format 'value(core.project)'`
# delete project
gcloud -q projects delete -y $PROJECT_NAME
