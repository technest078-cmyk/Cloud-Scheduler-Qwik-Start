#!/bin/bash

# ===============================================================
# TechNest Automation Script - Cloud Scheduler + Pub/Sub Setup
# ===============================================================

GREEN=$'\033[1;92m'
YELLOW=$'\033[1;93m'
MAGENTA=$'\033[1;95m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

banner() {
echo -e "${MAGENTA}${BOLD}"
cat << "EOF_BANNER"
████████╗███████╗ ██████╗██╗  ██╗███╗   ██╗███████╗███████╗████████╗
╚══██╔══╝██╔════╝██╔════╝██║  ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝
   ██║   █████╗  ██║     ███████║██╔██╗ ██║█████╗  ███████╗   ██║   
   ██║   ██╔══╝  ██║     ██╔══██║██║╚██╗██║██╔══╝  ╚════██║   ██║   
   ██║   ███████╗╚██████╗██║  ██║██║ ╚████║███████╗███████║   ██║   
   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝   ╚═╝   
EOF_BANNER
echo -e "${RESET}"
}

clear
banner
echo "${YELLOW}${BOLD}⚡ Starting TechNest Cloud Scheduler Setup...${RESET}"
echo

# ---------------- GCP COMMANDS ----------------
echo "${GREEN}${BOLD}>>> Listing active gcloud accounts...${RESET}"
gcloud auth list

echo "${GREEN}${BOLD}>>> Enabling Cloud Scheduler API...${RESET}"
gcloud services enable cloudscheduler.googleapis.com --project=$DEVSHELL_PROJECT_ID

echo "${GREEN}${BOLD}>>> Creating Pub/Sub topic: cron-topic${RESET}"
gcloud pubsub topics create cron-topic

echo "${GREEN}${BOLD}>>> Creating Pub/Sub subscription: cron-sub${RESET}"
gcloud pubsub subscriptions create cron-sub --topic=cron-topic

# ---------------- END MESSAGE ----------------
banner
echo "${GREEN}${BOLD}🎉 Lab Completed Successfully!${RESET}"
echo "${YELLOW}${BOLD}💡 Subscribe to TechNest: https://www.youtube.com/@TechNest_078${RESET}"
