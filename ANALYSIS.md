# RAX50 Koolcenter Merlin Firmware Analysis Summary

## Work Performed

1. Confirmed the firmware file `RAX50_386.7_2_ubi_8b0b4dd_koolcenter.chk` is a Koolcenter-modified Asuswrt-Merlin image for the Netgear RAX50.
2. Extracted the image in WSL:
   - Stripped the Netgear header (UBI starts at offset `0x3A`).
   - Used `ubireader_extract_images` to carve volumes.
   - Identified the root filesystem volume as **Squashfs** (not UBIFS).
   - Extracted the full rootfs with `binwalk -e`.
3. Inspected the resulting `squashfs-root` structure and key Koolcenter components.

## Key Findings

### Firmware base
- Based on Asuswrt-Merlin 386.7_2 (ported from the RT-AX58U).
- Uses the Koolcenter “Soft Center” / koolshare plugin framework.
- Root filesystem is a standard Squashfs (xz compressed, ~42 MB, created March 2025).

### Directory structure highlights
- `/rom/etc/koolshare/` — core Koolcenter startup and helper scripts
- `/www/` — Merlin web UI (ASUS-style)
- Symlinks: `etc` → `tmp/etc`, `home` → `tmp/home`, `koolshare` → `jffs/.koolshare`
- Standard Merlin layout plus Koolcenter additions

### Startup / plugin system
- `rom/etc/koolshare/bin/kscore.sh` — main detection and permission setup for the Soft Center
- Helper scripts (`helper.sh`, `ks-*.sh`) follow the usual Asuswrt-Merlin / Koolcenter pattern for mounting, NAT, and service hooks
- Soft Center is designed to run from `/jffs/.koolshare` after JFFS is enabled

### Security / backdoor review (static)
- No obvious hardcoded credentials, reverse shells, or unexpected outbound binaries in the startup scripts examined.
- Outbound references are limited to normal Koolcenter update domains (e.g. ddnsto-related endpoints used by the Soft Center).
- No evidence of hidden backdoors in the core init scripts reviewed.
- Risk surface is typical of Koolcenter builds: plugin system + any third-party plugins the user later installs.

### Practical notes
- First flash from stock Netgear requires the `.chk` file.
- Subsequent updates use the `.w` file.
- Post-flash factory reset + enabling JFFS custom scripts is required for the Soft Center to function correctly.
- Official Merlin does **not** support the RAX50; only these Koolcenter ports do.

## Bottom line

The 386.7_2 Koolcenter image is a functional Merlin port for the RAX50 with the standard Soft Center plugin system. Static review of the core startup and helper scripts did not reveal backdoors or anomalous behavior. The primary residual risk is the same as any Koolcenter build: whatever plugins are installed later.
