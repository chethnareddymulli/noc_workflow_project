#!/bin/bash
DB="noc_monitor_db"
USER="root"
PASS="parrot"
NOW=$(date "+%F %T")
mysql -u "$USER" -p"$PASS" "$DB" <<EOF
UPDATE noc_tickets
SET status = 'Escalated', updated_at = '$NOW'
WHERE status IN ('Open','In Progress')
  AND sla_due_time < '$NOW';
EOF
echo "🚨 Escalation check done."
