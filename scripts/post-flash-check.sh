#!/bin/sh
# post-flash-check.sh — RAX50 Koolcenter Merlin health check
# Run after first boot with JFFS enabled.
# Usage: sh post-flash-check.sh

echo "=== RAX50 Post-Flash Health Check ==="
echo

# JFFS mounted?
if mount | grep -q "jffs"; then
    echo "[OK] JFFS partition is mounted"
else
    echo "[FAIL] JFFS is not mounted"
    echo "      Go to Administration → System and enable JFFS options, then reboot."
fi

# Soft Center directory
if [ -d "/jffs/.koolshare" ] || [ -d "/koolshare" ]; then
    echo "[OK] Soft Center directory present"
else
    echo "[WARN] Soft Center directory not found yet (normal before first Soft Center launch)"
fi

# Free memory
FREE=$(free | awk '/Mem:/ {print $4}')
echo "[INFO] Free memory: ${FREE} KB"
if [ "$FREE" -lt 50000 ]; then
    echo "[WARN] Low free memory. Consider installing the Swap plugin."
fi

# Soft Center process (if running)
if pidof httpdb >/dev/null 2>&1 || pidof perpboot >/dev/null 2>&1; then
    echo "[OK] Soft Center related process detected"
else
    echo "[INFO] Soft Center process not running (may start after first login to Software Center)"
fi

echo
echo "=== Done ==="
echo "If JFFS is OK, open the web UI and check for the Software Center menu."
