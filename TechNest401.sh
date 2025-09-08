#!/bin/bash

# ───────────────────────────────────────────────
# TechNest Banner
# ───────────────────────────────────────────────
echo "████████╗███████╗ ██████╗██╗  ██╗███╗   ██╗███████╗███████╗████████╗"
echo "╚══██╔══╝██╔════╝██╔════╝██║  ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝"
echo "   ██║   █████╗  ██║     ███████║██╔██╗ ██║█████╗  ███████╗   ██║   "
echo "   ██║   ██╔══╝  ██║     ██╔══██║██║╚██╗██║██╔══╝  ╚════██║   ██║   "
echo "   ██║   ███████╗╚██████╗██║  ██║██║ ╚████║███████╗███████║   ██║   "
echo "   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝   ╚═╝   "
echo ""
echo "⚡ Starting TechNest Cloud Scheduler Setup..."
echo ""
git clone https://github.com/TechNest078/Cloud-Scheduler-Qwik-Start.git
cd Cloud-Scheduler-Qwik-Start
# Copy your TechNest401.sh into this folder
git add TechNest401.sh
git commit -m "Add TechNest401.sh script for Cloud Scheduler lab"
git push origin main

# ───────────────────────────────────────────────
# Set Project ID (metadata server fallback)
# ───────────────────────────────────────────────
echo ">>> Fetching Project ID..."
PROJECT_ID=$(gcloud config get-value project 2>/dev/null)

if [[ -z "$PROJECT_ID" ]]; then
    PROJECT_ID=$(curl -s -H "Metadata-Flavor: Google" \
        http://metadata.google.internal/computeMetadata/v1/project/project-id)
    gcloud config set project $PROJECT_ID
fi

echo "✅ Using Project: $PROJECT_ID"

# ───────────────────────────────────────────────
# Enable APIs
# ───────────────────────────────────────────────
echo ">>> Enabling Cloud Scheduler API..."
gcloud services enable cloudscheduler.googleapis.com --project=$PROJECT_ID
gcloud services enable pubsub.googleapis.com --project=$PROJECT_ID

# ───────────────────────────────────────────────
# Create Pub/Sub Topic and Subscription
# ───────────────────────────────────────────────
echo ">>> Creating Pub/Sub topic: cron-topic"
gcloud pubsub topics create cron-topic --project=$PROJECT_ID

echo ">>> Creating Pub/Sub subscription: cron-sub"
gcloud pubsub subscriptions create cron-sub --topic=cron-topic --project=$PROJECT_ID

# ───────────────────────────────────────────────
# Done
# ───────────────────────────────────────────────
echo ""
echo "🎉 Lab Completed Successfully!"
echo "💡 Subscribe to TechNest: https://www.youtube.com/@TechNest_078"
