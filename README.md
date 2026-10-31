# RAX50 Koolcenter Merlin Firmware Guide

Detailed steps for flashing **Koolcenter Merlin** on the **Netgear RAX50**.

> Official Asuswrt-Merlin does **not** support the RAX50. Only the Koolcenter ports work.

## Recommended Firmware

- **File**: `RAX50_386.7_2_ubi_8b0b4dd_koolcenter.chk`
- **Download**: [https://fw.koolcenter.com/KoolCenter_Merlin_New_Gen_386/Netgear/RAX50/](https://fw.koolcenter.com/KoolCenter_Merlin_New_Gen_386/Netgear/RAX50/)

## Before You Start

- Use a **wired** connection (computer → any LAN port on the RAX50).
- Use **Chrome** (or any Chromium-based browser).
- Do **not** interrupt power during the flash.
- Have a paperclip ready in case you need to factory reset later.

## Step 1: Flash from stock Netgear firmware

1. Connect your computer to any **LAN** port on the RAX50.
2. Power on the router and open a browser to `http://192.168.1.1` (or `http://routerlogin.net`).
3. Log in with your admin password.
4. Go to **Advanced → Administration → Router Update** (or Firmware Update).
5. Click **Browse** and select the **`.chk`** file (`RAX50_386.7_2_ubi_...koolcenter.chk`).
6. Click **Upload**.
   - You may see a warning that the version is older. Click **Yes** / **OK** to continue.
7. Wait for the upload and flash to finish (usually 1–2 minutes). The router will reboot automatically.

## Step 2: First login after flash

1. After reboot, the router’s IP changes to **`192.168.50.1`**.
2. Open a browser and go to `http://192.168.50.1` (or `http://router.asus.com`).
3. Complete the setup wizard (set Wi-Fi name, password, admin password, etc.).
4. You should now see the Merlin interface with the **“Powered by koolshare”** banner and the 八万 logo (Koolcenter branding).

## Step 3: Required post-flash setup (important)

1. Go to **Administration → Restore/Save/Upload Setting**.
2. Under **Factory default**, check the box and click **Restore**. Confirm.
   - This is Merlin’s factory reset (not Netgear’s). The router will reboot.
3. After it comes back up, log in again at `192.168.50.1`.
4. Go to **Administration → System**.
5. Enable these two options:
   - **Format JFFS partition at next boot** → Yes
   - **Enable JFFS custom scripts and configs** → Yes
6. Click **Apply** at the bottom of the page.
7. Click the **Reboot** button at the top of the page and wait for the router to restart.

## Step 4: Verify

- After the final reboot, log in again.
- You should now have a working Merlin interface.
- The **Software Center** menu should appear (you can update it if a newer version is available).

## Optional later upgrades

Once you are on Merlin, future updates use the **`.w`** file (not `.chk`) under **Administration → Firmware Upgrade**.

## Recovery

The RAX50 has a hardware recovery mode that can restore it even after a bad flash. Use a **wired** connection and a static IP on your computer in the `192.168.1.x` range (e.g. `192.168.1.10`).

### Method 1: Netgear recovery tool / nmrpflash (recommended)

1. Download Netgear’s recovery tool or `nmrpflash` (community tool that works with many Netgear models).
2. Unplug the router’s power.
3. Hold the **Reset** button (paperclip) and plug the power back in.
4. Keep holding Reset until the power LED starts blinking (usually 10–20 seconds). Release.
5. The router should now be in recovery mode (often reachable at `192.168.1.1`).
6. Run the recovery tool or `nmrpflash` and point it at a stock Netgear `.chk` firmware file.
7. Wait for the flash to complete and the router to reboot.

**Timing tip:** Some users report better success if they start the recovery tool/nmrpflash *just before* or *immediately after* releasing the Reset button. If the first attempt fails, power-cycle and try again.

### Method 2: TFTP (if nmrpflash is unavailable)

1. Put the router into recovery mode (same Reset + power-on sequence above).
2. Set your computer to a static IP in `192.168.1.x`.
3. Use a TFTP client to push a stock `.chk` file to `192.168.1.1`.
4. Wait for the transfer to finish and the router to reboot.

### Returning to stock from a working Merlin install

1. Download an older official Netgear RAX50 `.chk` firmware.
2. In the Merlin web UI go to **Administration → Firmware Upgrade** and upload the Netgear `.chk`.
3. After it boots into Netgear firmware, you can let it auto-update to the latest stock version or manually flash the newest Netgear firmware.

### If recovery fails

- Try a different LAN port.
- Disable any firewall/antivirus that might block TFTP or the recovery tool.
- Use a different computer or network adapter.
- Repeat the Reset + power-on sequence; timing is the most common variable.

## Disclaimer

Flashing custom firmware carries risk of bricking. Proceed at your own risk. This guide is based on community documentation and user reports.
