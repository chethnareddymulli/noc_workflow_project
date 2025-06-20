#!/bin/bash

TITLE="$1"
MESSAGE="$2"
SEVERITY="$3"

DB="noc_monitor_db"
USER="root"
PASS="parrot"

CREATED_AT=$(date "+%F %T")
SLA_DUE=$(date -d "+2 hours" "+%F %T")

mysql -u "$USER" -p"$PASS" "$DB" <<EOF
INSERT INTO noc_tickets (title, message, severity, status, created_at, updated_at, sla_due_time)
VALUES ('$TITLE', '$MESSAGE', '$SEVERITY', 'Open', '$CREATED_AT', '$CREATED_AT', '$SLA_DUE');
EOF

echo "✅ Ticket created: $TITLE"
