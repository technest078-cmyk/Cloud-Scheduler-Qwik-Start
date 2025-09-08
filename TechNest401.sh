#!/bin/bash

# Show TechNest Banner
banner "TechNest"

echo "================================="
echo " 🚀 GCP Cloud Scheduler Setup 🚀 "
echo "================================="

# Step 1: List accounts
echo ">>> Listing active gcloud accounts..."
gcloud auth list

# Step 2: Enable Cloud Scheduler API
echo ">>> Enabling Cloud Scheduler API..."
gcloud services enable cloudscheduler.googleapis.com --project=$DEVSHELL_PROJECT_ID

# Step 3: Create Pub/Sub topic
echo ">>> Creating Pub/Sub topic: cron-topic"
gcloud pubsub topics create cron-topic

# Step 4: Create Pub/Sub subscription
echo ">>> Creating Pub/Sub subscription: cron-sub"
gcloud pubsub subscriptions create cron-sub --topic=cron-topic

echo "✅ TechNest Setup complete!"
