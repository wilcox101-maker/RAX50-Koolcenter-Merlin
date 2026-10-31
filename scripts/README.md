# RAX50 Improvement Scripts

Simple shell scripts for the RAX50 running Koolcenter Merlin.

## Files

| Script | Purpose |
|--------|---------|
| `post-flash-check.sh` | Verifies JFFS mount, Soft Center presence, and free memory after first boot |
| `memory-alert.sh` | Logs a warning when free memory drops below a threshold |

## How to use

1. Copy the script(s) to the router (SCP, SFTP, or USB).
2. Make executable: `chmod +x script.sh`
3. Run: `sh script.sh`

### post-flash-check.sh
Run once after enabling JFFS and rebooting. It reports whether JFFS is mounted and how much free memory you have.

### memory-alert.sh
- Edit the `THRESHOLD` value if desired.
- Call it from a cron job or from the RouterHook plugin for periodic checks.
- Output goes to `/tmp/memory-alert.log`.

## Notes

- These scripts are lightweight and safe to run.
- They do not modify settings; they only report status.
- For persistent logging, redirect output to a USB drive or JFFS path.
