# RAX50 Scripts

Lightweight, read-only shell scripts for the RAX50 running Koolcenter Merlin.

## Scripts

| Script | Purpose |
|--------|---------|
| [`post-flash-check.sh`](post-flash-check.sh) | Verifies JFFS mount, Soft Center presence, and free memory after first boot |
| [`memory-alert.sh`](memory-alert.sh) | Logs a warning when free memory drops below a threshold |

## Usage

1. Copy the script to the router (SCP, SFTP, or USB).
2. Make it executable: `chmod +x script.sh`
3. Run: `sh script.sh`

### post-flash-check.sh

Run once after enabling JFFS and rebooting. It reports:
- Whether JFFS is mounted
- Whether the Soft Center directory exists
- Free memory (with a warning if low)
- Whether a Soft Center process is running

### memory-alert.sh

- Edit `THRESHOLD` (default 60 MB free) if desired.
- Call from cron or the RouterHook plugin for periodic checks.
- Output is written to `/tmp/memory-alert.log` (volatile). For persistent logs, change the path to a USB or JFFS location.

## Notes

- Scripts only report status; they do not change settings.
- Designed for Merlin’s busybox environment.
- Safe to run repeatedly.
