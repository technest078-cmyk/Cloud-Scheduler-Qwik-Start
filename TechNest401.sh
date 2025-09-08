#!/bin/bash
# ==========================================================
#        🚀 TechNest - Cloud Scheduler Automation 🚀
# ==========================================================
# This script will:
# 1. Authenticate gcloud user
# 2. Enable Cloud Scheduler API
# 3. Create Pub/Sub topic
# 4. Create Pub/Sub subscription
#
# Author : TechNest
# Note   : Run inside Google Cloud Shell
# ==========================================================

banner() {
echo -e "${MAGENTA}${BOLD}"
cat << "EOF"
████████╗███████╗ ██████╗██╗  ██╗███╗   ██╗███████╗███████╗████████╗
╚══██╔══╝██╔════╝██╔════╝██║  ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝
   ██║   █████╗  ██║     ███████║██╔██╗ ██║█████╗  ███████╗   ██║   
   ██║   ██╔══╝  ██║     ██╔══██║██║╚██╗██║██╔══╝  ╚════██║   ██║   
   ██║   ███████╗╚██████╗██║  ██║██║ ╚████║███████╗███████║   ██║   
   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝   ╚═╝   
EOF
echo -e "${RESET}"
}


# List gcloud accounts
echo "🔹 Checking authentication accounts..."
gcloud auth list

# Enable Cloud Scheduler API
echo "🔹 Enabling Cloud Scheduler API..."
gcloud services enable cloudscheduler.googleapis.com --project=$DEVSHELL_PROJECT_ID

# Create Pub/Sub topic
echo "🔹 Creating Pub/Sub topic: cron-topic"
gcloud pubsub topics create cron-topic

# Create Pub/Sub subscription
echo "🔹 Creating Pub/Sub subscription: cron-sub"
gcloud pubsub subscriptions create cron-sub --topic cron-topic

echo "✅ Setup completed successfully!"
echo "=============================================="
echo "     🚀 TechNest | Cloud Scheduler Ready! 🚀"
echo "=============================================="
