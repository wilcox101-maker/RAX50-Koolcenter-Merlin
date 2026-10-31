# RAX50 Koolcenter Merlin

Practical guide for running **Koolcenter Merlin** on the **Netgear RAX50**.

> Official Asuswrt-Merlin does **not** support the RAX50. Only the Koolcenter ports work.

## Contents

| Document | Description |
|----------|-------------|
| [Flashing Guide](#flashing-guide) | Step-by-step install and recovery |
| [Merlin vs Netgear](Merlin-vs-Netgear.md) | What you gain and lose |
| [Firmware Analysis](ANALYSIS.md) | Extraction notes and static review |
| [Soft Center Addons](Soft-Center-Addons.md) | Useful plugins with setup steps |
| [Optimization Notes](Optimization-Notes.md) | Wi-Fi, update domains, English menu map |
| [Scripts](scripts/) | Post-flash check and memory alert |

---

## Flashing Guide

### Recommended Firmware

- **File**: `RAX50_386.7_2_ubi_8b0b4dd_koolcenter.chk`
- **Download**: [fw.koolcenter.com — RAX50](https://fw.koolcenter.com/KoolCenter_Merlin_New_Gen_386/Netgear/RAX50/)

### Before You Start

- Use a **wired** connection (computer → any LAN port).
- Use **Chrome** or another Chromium-based browser.
- Do **not** interrupt power during the flash.
- Have a paperclip ready for recovery if needed.

### Step 1 — Flash from stock Netgear

1. Connect your computer to any **LAN** port.
2. Open `http://192.168.1.1` (or `http://routerlogin.net`) and log in.
3. Go to **Advanced → Administration → Router Update**.
4. Upload the **`.chk`** file.
5. Confirm any “older version” warning.
6. Wait for the router to reboot (1–2 minutes).

### Step 2 — First login

1. The router IP changes to **`192.168.50.1`**.
2. Open `http://192.168.50.1` (or `http://router.asus.com`).
3. Complete the setup wizard.
4. You should see the Merlin UI with the **Powered by koolshare** banner.

### Step 3 — Required post-flash setup

1. **Administration → Restore/Save/Upload Setting** → Factory default → **Restore**.
2. After reboot, log in again.
3. **Administration → System**:
   - **Format JFFS partition at next boot** → Yes
   - **Enable JFFS custom scripts and configs** → Yes
4. **Apply**, then **Reboot**.

### Step 4 — Verify

- Log in after the final reboot.
- Confirm the **Software Center** menu is present.
- Optional: run [`scripts/post-flash-check.sh`](scripts/post-flash-check.sh).

### Later upgrades

Once on Merlin, use the **`.w`** file (not `.chk`) under **Administration → Firmware Upgrade**.

---

## Recovery

The RAX50 has a hardware recovery mode. Use a wired connection and a static IP in the `192.168.1.x` range.

### nmrpflash / Netgear recovery tool

1. Download Netgear’s recovery tool or [`nmrpflash`](https://github.com/jclehner/nmrpflash).
2. Unplug power.
3. Hold **Reset** and plug power back in.
4. Release when the power LED blinks (typically 10–20 seconds).
5. Push a stock Netgear `.chk` to the router (usually at `192.168.1.1`).
6. Wait for reboot.

**Tip:** Timing is the most common variable. If the first attempt fails, power-cycle and retry.

### Return to stock from a working Merlin install

1. Download an official Netgear RAX50 `.chk`.
2. Upload it via **Administration → Firmware Upgrade**.
3. After it boots into Netgear firmware, update to the latest stock version if desired.

---

## Quick recommendations after flashing

1. Install the **Swap** plugin (512 MB RAM is tight).
2. Set Wi-Fi: 2.4 GHz on channel 1/6/11 at 20 MHz; 5 GHz on a non-DFS channel at 80 MHz. See [Optimization Notes](Optimization-Notes.md).
3. Only install plugins that appear in the Software Center (rogsoft / axhnd.675x).

---

## Disclaimer

Flashing custom firmware carries risk of bricking. Proceed at your own risk. This guide is based on community documentation and user reports.
