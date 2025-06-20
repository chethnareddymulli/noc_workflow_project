#!/bin/bash
DB="noc_monitor_db"
USER="root"
PASS="parrot"
DATE=$(date +%F)

# Determine project root and output path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT="$PROJECT_ROOT/reports/ticket_report_$DATE.csv"

# Remove old temp file if exists
rm -f /tmp/temp_report.csv

# Run SELECT INTO OUTFILE (will now succeed since temp file is removed)
mysql ...
USE $DB;
SELECT id, title, severity, status, created_at, updated_at, sla_due_time
FROM noc_tickets
ORDER BY id DESC
INTO OUTFILE '/tmp/temp_report.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n';"

# Move only if temp file was created
if [ -f /tmp/temp_report.csv ]; then
  mv /tmp/temp_report.csv "$OUTPUT"
  echo "✅ Report generated: $OUTPUT"
else
  echo "❌ /tmp/temp_report.csv not found; SELECT INTO OUTFILE may have failed."
fi
