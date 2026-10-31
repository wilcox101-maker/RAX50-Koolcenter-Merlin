#!/bin/sh
# memory-alert.sh — Simple low-memory logger for RAX50
# Can be called from a cron job or RouterHook.
# Logs to /tmp/memory-alert.log

THRESHOLD=60000   # KB free — adjust as needed
LOG=/tmp/memory-alert.log

FREE=$(free | awk '/Mem:/ {print $4}')
DATE=$(date)

if [ "$FREE" -lt "$THRESHOLD" ]; then
    echo "$DATE — LOW MEMORY: ${FREE} KB free" >> "$LOG"
    # Optional: trigger a notification if ServerChan/PushPlus is configured
    # logger -t memory-alert "Low memory: ${FREE} KB free"
else
    echo "$DATE — OK: ${FREE} KB free" >> "$LOG"
fi

# Keep log small
tail -n 50 "$LOG" > "$LOG.tmp" && mv "$LOG.tmp" "$LOG"
