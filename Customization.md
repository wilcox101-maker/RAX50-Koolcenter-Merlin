# Merlin Customization Options

Practical customization paths on the Netgear RAX50 running Koolcenter Merlin 386.7_2.

## 1. Soft Center plugins (highest impact)

The main customization path on this build. Only install plugins that appear in the Software Center (rogsoft / axhnd.675x).

| Category | Examples | Notes |
|----------|----------|-------|
| **Memory** | Swap | Strongly recommended first on 512 MB RAM |
| **VPN** | Tailscale, SoftEther, ZeroTier | Remote access / mesh VPN |
| **Filtering** | KoolProxy | Network-wide ad/content blocking |
| **Storage** | USB2JFFS | Expand plugin/log space with USB |
| **Access** | SFTP Server, ShellInABox | File and shell access |
| **Certificates** | ACME | Let’s Encrypt |
| **Packages** | Entware | Extra Linux tools (`opkg`) |
| **DDNS** | Cloudflare, DDNSTO, etc. | Dynamic DNS |
| **Notifications** | ServerChan, PushPlus, RouterHook | Alerts |

Full setup steps: [Soft Center Addons](Soft-Center-Addons.md)

## 2. JFFS custom scripts

Once JFFS custom scripts are enabled:

- Place scripts in `/jffs/scripts/` (e.g. `services-start`, `wan-start`, `firewall-start`)
- Ready-to-use examples in this repo:
  - [`scripts/post-flash-check.sh`](scripts/post-flash-check.sh)
  - [`scripts/memory-alert.sh`](scripts/memory-alert.sh)

These run at boot or on events without needing a plugin.

## 3. Built-in Merlin features

Available in the web UI (no plugins required):

| Feature | Location | Use |
|---------|----------|-----|
| **DNS Filter** | LAN → DNS Filter | Force clients to specific DNS |
| **VPN Director** | VPN | Policy-based routing |
| **Adaptive QoS** | QoS | Bandwidth prioritization |
| **AiMesh** | AiMesh | Join/create mesh (supported in this build) |
| **Traffic Monitor** | Tools / Network Map | Per-client charts (USB recommended for history) |
| **Custom dnsmasq** | Administration → System | Extra DNS options |
| **JFFS format / scripts** | Administration → System | Required for Soft Center and custom scripts |

## 4. Entware

After installing the Entware plugin:

```bash
opkg update
opkg install nano htop curl
```

Useful for diagnostics or lightweight services. Prefer storing packages on USB or expanded JFFS.

## 5. Web UI notes

- Theme is the standard blue ASUSWRT (not ROG red on this port)
- Language can be switched in the UI (some Soft Center pages remain Chinese-first)
- See the [English menu map](Optimization-Notes.md#3-english-soft-center-menu-map) for Soft Center navigation

## Recommended order

1. Enable JFFS + factory reset (see [flashing guide](README.md))
2. Install **Swap**
3. Add one VPN or remote-access plugin if needed
4. Add custom scripts or Entware tools as required
5. Monitor free memory (`free` or the memory-alert script)

## Limits on this build

The practical ceiling is Soft Center + JFFS scripts + Entware. Heavier customization (kernel modules, full OpenWrt-style packages) is limited by the 512 MB RAM and the pension nature of the 386.7_2 release.

---

See also: [Soft Center Addons](Soft-Center-Addons.md) · [Optimization Notes](Optimization-Notes.md) · [Scripts](scripts/)
