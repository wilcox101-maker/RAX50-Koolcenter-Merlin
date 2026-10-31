# Soft Center Addons

Useful **rogsoft** plugins for the Netgear RAX50 running Koolcenter Merlin.

> Only install plugins that appear in the Software Center after JFFS is enabled. Do not install armsoft or packages from other platforms.

## Prerequisites

1. Complete the [flashing guide](README.md) (including factory reset and JFFS enable).
2. Reboot so the Software Center menu appears.
3. Install **Swap** first if you plan to run more than one or two plugins (the RAX50 has 512 MB RAM).

## Recommended starting set

1. **Swap** — virtual memory
2. **Tailscale** or **SoftEther** — remote access
3. **KoolProxy** — filtering (monitor RAM after enabling)
4. **USB2JFFS** — if you have a USB drive

---

## Plugin details

### Swap
Creates virtual memory to reduce the chance of running out of RAM.

1. Software Center → install **Swap**.
2. Choose a size (256–512 MB is typical).
3. Enable and apply.
4. Verify with `free` or the plugin status page.

### Tailscale
Easy mesh VPN for secure remote access without port forwarding.

1. Install **Tailscale**.
2. Follow the auth link and log in.
3. Approve the router in the Tailscale admin console.
4. Other Tailscale devices can then reach the router and LAN (depending on subnet settings).

### SoftEther
Full-featured VPN server/client.

1. Install **SoftEther**.
2. Configure port, user, and password (or certificate).
3. Export a client config or use SoftEther client software.
4. Connect from outside your network.

### ZeroTier
Virtual LAN across the internet using a network ID.

1. Install **ZeroTier**.
2. Join your network with the network ID.
3. Authorize the router in the ZeroTier web UI.
4. Authorized devices communicate as if on the same LAN.

### KoolProxy
Network-wide ad-blocking and content filtering.

1. Install **KoolProxy**.
2. Enable the service and choose rule sets.
3. Apply and test on a client.

**Note:** Larger rule sets increase CPU and RAM use. Monitor after enabling.

### USB2JFFS
Expands storage by mounting a USB drive as additional JFFS space.

1. Plug in a USB drive (ext4 recommended).
2. Install **USB2JFFS**.
3. Select the partition and enable.
4. Reboot if prompted.

### SFTP Server
Secure file access over SSH.

1. Install **SFTP Server**.
2. Enable and set the port.
3. Connect with any SFTP client using router credentials.

### ACME (Let’s Encrypt)
Free TLS certificates.

1. Install **ACME**.
2. Enter a domain (requires working DDNS).
3. Choose HTTP or DNS validation.
4. Apply and wait for issuance.

### ShellInABox
Web-based terminal.

1. Install **ShellInABox**.
2. Enable and note the web port.
3. Open the URL in a browser and log in.

### Entware
Package manager for extra Linux tools.

1. Install **Entware**.
2. From SSH: `opkg update` then `opkg install <package>`.
3. Prefer storing packages on USB or expanded JFFS.

### DDNS plugins
(Cloudflare, DNSPod, DDNSTO, AliDDNS, etc.)

1. Install the plugin that matches your provider.
2. Enter credentials or API token.
3. Enable and apply.

### ServerChan / PushPlus / RouterHook
Notifications on events.

1. Install the plugin.
2. Enter your token or webhook URL.
3. Enable the events you want.

---

## Tips

- Install **Swap** before heavy plugins.
- Check memory after adding services (`free` or the Merlin status page). Consider [`scripts/memory-alert.sh`](scripts/memory-alert.sh).
- Keep the Software Center updated from within the menu.
- Uninstall unused plugins to free RAM and flash space.
- See the [English menu map](Optimization-Notes.md#3-english-soft-center-menu-map) if pages are mostly Chinese.

## Disclaimer

Plugins are community-maintained. Test one at a time and keep a recovery method available.

---

See also: [Optimization Notes](Optimization-Notes.md) · [Merlin vs Netgear](Merlin-vs-Netgear.md)
