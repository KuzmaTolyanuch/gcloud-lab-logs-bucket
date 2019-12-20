#! /bin/bash
PROJECT_NAME=$1
# create project, enable apis and set new project as default
gcloud projects create $PROJECT_NAME --enable-cloud-apis --set-as-default
# Set default compute zone and region
gcloud config set compute/region us-west1
gcloud config set compute/zone us-west1-a
# make bucket for logs
gsutil mb gs://$PROJECT_NAME
# Enable gcloud compute apis
gcloud services enable compute.googleapis.com
# Set default compute region and zone
gcloud compute instances create \
        --machine-type "f1-micro" \
        --metadata "lab-logs-bucket=gs://$PROJECT_NAME/" \
        --metadata-from-file "startup-script=startup_scripts/worker-startup-script.sh"
