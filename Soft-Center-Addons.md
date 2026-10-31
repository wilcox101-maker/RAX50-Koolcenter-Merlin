# RAX50 Soft Center Addons Guide

Detailed descriptions and basic usage notes for the most useful **rogsoft** Soft Center plugins on the Netgear RAX50 (Koolcenter Merlin).

> Only install plugins that appear in the Software Center menu after JFFS is enabled. Do not install armsoft or packages from other platforms.

## Prerequisites

1. Flash Koolcenter Merlin and complete the post-flash setup (factory reset + enable JFFS custom scripts).
2. Reboot so the Software Center menu appears.
3. Install **Swap** first if you plan to run more than one or two plugins (RAX50 has 512 MB RAM).

---

## Recommended Addons

### Swap
**Purpose:** Creates virtual memory (swap space) to prevent the router from running out of RAM when plugins are active.

**Why useful on RAX50:** 512 MB is tight once you add VPN, filtering, or other services.

**Basic steps:**
1. Software Center → install **Swap**.
2. Choose a size (256–512 MB is typical).
3. Enable and apply.
4. Verify with `free` or the plugin status page.

---

### Tailscale
**Purpose:** Easy mesh VPN. Creates a private network between your devices without port forwarding or complex config.

**Why useful:** Secure remote access to your home network and the router itself.

**Basic steps:**
1. Install **Tailscale** from the Software Center.
2. Follow the plugin’s auth link to log in with your Tailscale account.
3. Approve the router on the Tailscale admin console.
4. Devices on your Tailscale network can then reach the router and LAN (depending on subnet settings).

---

### SoftEther
**Purpose:** Full-featured VPN server and client (supports multiple protocols).

**Why useful:** Traditional VPN access if you prefer SoftEther or need OpenVPN-compatible clients.

**Basic steps:**
1. Install **SoftEther**.
2. Configure the server (port, user, password, or certificate).
3. Export the client config or use SoftEther client software.
4. Connect from outside your network.

---

### ZeroTier
**Purpose:** Creates a virtual LAN across the internet. Devices join a network with a single network ID.

**Why useful:** Simple peer-to-peer access without a central VPN server.

**Basic steps:**
1. Install **ZeroTier**.
2. Join a network with your ZeroTier network ID.
3. Authorize the router in the ZeroTier web UI.
4. Other authorized devices can communicate as if on the same LAN.

---

### KoolProxy
**Purpose:** Network-wide ad-blocking and content filtering proxy.

**Why useful:** Blocks ads and unwanted content for all devices on the network.

**Basic steps:**
1. Install **KoolProxy**.
2. Enable the service.
3. Choose filtering rules / lists.
4. Apply and test on a client device.

**Note:** Can increase CPU/RAM use depending on the rule sets. Monitor after enabling.

---

### USB2JFFS
**Purpose:** Mounts a USB drive and uses it to expand the JFFS partition (plugin storage, logs, downloads).

**Why useful:** Extra space beyond the limited internal flash.

**Basic steps:**
1. Plug in a USB drive (formatted ext4 or similar).
2. Install **USB2JFFS**.
3. Select the USB partition and enable.
4. Reboot if prompted. Plugins and data will use the USB space.

---

### SFTP Server
**Purpose:** Secure file transfer over SSH so you can browse or upload files on the router.

**Why useful:** Easy access to plugin data, logs, or USB storage without opening a full shell.

**Basic steps:**
1. Install **SFTP Server**.
2. Enable and set the port (usually 22 or a custom port).
3. Connect with any SFTP client using the router’s admin credentials or a dedicated user.

---

### ACME (Let’s Encrypt)
**Purpose:** Automatically obtains and renews free TLS certificates.

**Why useful:** HTTPS for the router web UI or other services without buying a certificate.

**Basic steps:**
1. Install **ACME**.
2. Enter your domain (requires working DDNS).
3. Choose validation method (usually HTTP or DNS).
4. Apply and wait for certificate issuance.

---

### ShellInABox
**Purpose:** Web-based terminal (SSH in the browser).

**Why useful:** Quick access to the router shell without installing a separate SSH client.

**Basic steps:**
1. Install **ShellInABox**.
2. Enable and note the web port.
3. Open the URL in a browser and log in with router credentials.

---

### Entware
**Purpose:** Package manager that lets you install additional Linux tools (curl, nano, htop, etc.).

**Why useful:** Extra utilities not included in the base firmware.

**Basic steps:**
1. Install **Entware**.
2. Use `opkg update` and `opkg install <package>` from SSH.
3. Packages are stored on JFFS or USB (recommended).

---

### DDNS Plugins
(Cloudflare, DNSPod, DDNSTO, AliDDNS, etc.)

**Purpose:** Update a hostname when your public IP changes.

**Why useful:** Reliable remote access without a static IP.

**Basic steps:**
1. Choose the DDNS plugin that matches your provider.
2. Install and enter your credentials / API token.
3. Enable and apply. The hostname should update automatically.

---

### ServerChan / PushPlus / RouterHook
**Purpose:** Send notifications (WeChat, Telegram-style, or custom hooks) on events.

**Why useful:** Alerts for WAN disconnect, reboot, or custom conditions.

**Basic steps:**
1. Install the notification plugin.
2. Enter your token / webhook URL.
3. Enable the events you want to be notified about.

---

## Tips

- Install **Swap** before heavy plugins.
- After installing several plugins, check memory usage (`free` or the Merlin status page).
- Keep the Software Center itself updated from within the menu.
- Uninstall unused plugins to free RAM and flash space.

## Disclaimer

Plugins are community-maintained. Test one at a time and keep a way to recover (paperclip reset or Netgear recovery) if something goes wrong.
