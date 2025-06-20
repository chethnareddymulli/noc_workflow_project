# 🛠️ NOC Workflow Automation System

A shell-script-based automation system to simulate Network Operations Center (NOC) workflows such as ticket creation, SLA tracking, escalation, report generation, and alerting. Built for Linux environments with MariaDB/SQL backend, suitable for roles like **Software Support Engineer (Linux, SQL)**.

---

## 📌 Project Overview

This project simulates real-world NOC operations with automation around:

- 🎫 Ticket creation and management
- ⏱️ SLA tracking and automatic escalations
- 📊 Report generation (CSV exports)
- 🚨 Alerting for critical/escalated issues (console, logs)
- 🕒 Cron-based periodic monitoring

Designed with simplicity, portability, and low-resource requirements in mind — ideal for showcasing Linux & SQL operational automation skills.

---



## 🛠️ Scripts Description

| Script                 | Purpose                                                                 |
|------------------------|-------------------------------------------------------------------------|
| `create_ticket.sh`     | Manually create a ticket with severity and title                        |
| `update_ticket.sh`     | Update status or timestamp of existing tickets                          |
| `escalate_tickets.sh`  | Auto-escalates tickets that exceed SLA deadline                         |
| `generate_report.sh`   | Generates CSV report of all tickets                                     |
| `send_notification.sh` | Sends alert if any ticket is critical or escalated (console/log based)  |





📦 Features
✅ SQL-based ticket backend

✅ SLA-aware escalation logic

✅ Log and report-friendly output

✅ Fully CLI-operated — ideal for Linux system engineers


