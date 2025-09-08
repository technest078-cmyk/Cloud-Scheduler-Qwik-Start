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

# ───────────────────────────────────────────────
# Set Project ID
# ───────────────────────────────────────────────
echo ">>> Setting Project ID..."
export PROJECT_ID=$(gcloud config get-value project)
gcloud config set project $PROJECT_ID

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
