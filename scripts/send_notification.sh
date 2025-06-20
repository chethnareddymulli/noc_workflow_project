#!/bin/bash
DB="noc_monitor_db"
USER="root"
PASS="parrot"
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/XXX/YYY/ZZZ"  # replace with your webhook

# Count tickets needing attention
CRITICAL_COUNT=$(mysql ...
USE $DB;
SELECT COUNT(*) FROM noc_tickets WHERE status='Escalated' OR severity='Critical';
")

if [ "$CRITICAL_COUNT" -gt 0 ]; then
  MSG="🚨 NOC Alert: $CRITICAL_COUNT critical/escalated tickets need attention."
  echo "$MSG"

  # Send to Slack
  payload="{\"text\":\"$MSG\"}"
  curl -s -X POST -H 'Content-type: application/json' --data "$payload" "$SLACK_WEBHOOK_URL"
else
  echo "No critical/escalated tickets."
fi
