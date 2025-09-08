#!/bin/bash

# ================================
#   GCP Cloud Scheduler Setup 🚀
# ================================
# This script will:
#   1. List active gcloud accounts
#   2. Enable Cloud Scheduler API
#   3. Create a Pub/Sub topic
#   4. Create a Pub/Sub subscription
# ================================

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}"
echo "======================================"
echo "     🚀 GCP Cloud Scheduler Setup     "
echo "======================================"
echo -e "${NC}"

# Step 1: List accounts
echo -e "${GREEN}>>> Listing active gcloud accounts...${NC}"
gcloud auth list

# Step 2: Enable Cloud Scheduler API
echo -e "${GREEN}>>> Enabling Cloud Scheduler API...${NC}"
gcloud services enable cloudscheduler.googleapis.com --project=$DEVSHELL_PROJECT_ID

# Step 3: Create Pub/Sub topic
echo -e "${GREEN}>>> Creating Pub/Sub topic: cron-topic${NC}"
gcloud pubsub topics create cron-topic

# Step 4: Create Pub/Sub subscription
echo -e "${GREEN}>>> Creating Pub/Sub subscription: cron-sub${NC}"
gcloud pubsub subscriptions create cron-sub --topic=cron-topic

echo -e "${GREEN}✅ Setup complete!${NC}"
