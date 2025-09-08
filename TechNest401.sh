#!/bin/bash
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

# ===================== END =====================
banner
echo "${MAGENTA}${BOLD}🎉 Lab Completed at $(timestamp)!${RESET}"
echo
echo "${YELLOW}${BOLD}💡 SUBSCRIBE TO TECHNEST for more hacks & labs:${RESET}"
echo "${GREEN}${UNDERLINE}👉 https://www.youtube.com/@TechNest_078${RESET}"
echo
