#!/bin/bash

# Usage check
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <ticket_id> <new_status>"
  exit 1
fi

TICKET_ID="$1"
NEW_STATUS="$2"

DB="noc_monitor_db"
USER="root"
PASS="parrot"
UPDATED_AT=$(date "+%F %T")

mysql -u "$USER" -p"$PASS" "$DB" <<EOF
UPDATE noc_tickets
SET status = '$NEW_STATUS', updated_at = '$UPDATED_AT'
WHERE id = $TICKET_ID;
EOF

if [ $? -eq 0 ]; then
  echo "✅ Ticket $TICKET_ID updated to '$NEW_STATUS'"
else
  echo "❌ Failed to update ticket $TICKET_ID"
fi
