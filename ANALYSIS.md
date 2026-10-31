# Firmware Analysis Summary

Static review of `RAX50_386.7_2_ubi_8b0b4dd_koolcenter.chk`.

## Work performed

1. Confirmed the file is a Koolcenter-modified Asuswrt-Merlin image for the Netgear RAX50.
2. Extracted in WSL:
   - Stripped the Netgear header (UBI starts at offset `0x3A`).
   - Carved volumes with `ubireader_extract_images`.
   - Identified the root filesystem as **Squashfs** (not UBIFS).
   - Extracted the full rootfs with `binwalk -e`.
3. Inspected the resulting structure and key Koolcenter components.

## Key findings

### Firmware base
- Based on Asuswrt-Merlin 386.7_2 (ported from the RT-AX58U).
- Uses the Koolcenter Soft Center (rogsoft) plugin framework.
- Root filesystem is a standard Squashfs (xz compressed, ~42 MB, created March 2025).

### Directory structure
- `/rom/etc/koolshare/` — core startup and helper scripts
- `/www/` — Merlin web UI (ASUS-style)
- Symlinks: `etc` → `tmp/etc`, `home` → `tmp/home`, `koolshare` → `jffs/.koolshare`
- Standard Merlin layout plus Koolcenter additions

### Startup / plugin system
- `rom/etc/koolshare/bin/kscore.sh` — Soft Center detection and permission setup
- Helper scripts (`helper.sh`, `ks-*.sh`) follow the usual Merlin/Koolcenter pattern
- Soft Center runs from `/jffs/.koolshare` after JFFS is enabled

### Security review (static)
- No obvious hardcoded credentials, reverse shells, or unexpected outbound binaries in the startup scripts examined.
- Outbound references are limited to normal Koolcenter update domains (ddnsto-related endpoints).
- No evidence of hidden backdoors in the core init scripts reviewed.
- Residual risk is typical of any Koolcenter build: the plugin system and any third-party plugins installed later.

### Practical notes
- First flash from stock Netgear requires the `.chk` file.
- Subsequent updates use the `.w` file.
- Post-flash factory reset + enabling JFFS custom scripts is required for Soft Center.
- Official Merlin does **not** support the RAX50; only these Koolcenter ports do.

## Bottom line

The 386.7_2 image is a functional Merlin port for the RAX50 with the standard Soft Center. Static review of the core startup and helper scripts did not reveal backdoors or anomalous behavior. The primary residual risk is the same as any Koolcenter build: whatever plugins are installed later.

---

See also: [Flashing Guide](README.md) · [Soft Center Addons](Soft-Center-Addons.md)
