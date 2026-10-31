# Optimization Notes

Practical tips for the Koolcenter Merlin 386.7_2 build on the Netgear RAX50.

---

## 1. Wi-Fi recommendations (BCM6750)

| Band | Recommended | Notes |
|------|-------------|-------|
| **2.4 GHz** | Channel 1, 6, or 11 at 20 MHz | Avoid 40 MHz unless the environment is very quiet. |
| **5 GHz** | Non-DFS channel (36, 40, 44, 48) at 80 MHz | DFS channels can cause radar-related dropouts. 80 MHz is the practical maximum for stable performance. |
| **5 GHz (optional)** | Channel 149–161 (if available and not DFS) | Good alternative if the lower channels are crowded. |

### Tips
- After changing channels, wait 30–60 seconds and re-test client speeds.
- If clients drop when moving between rooms, lower 5 GHz transmit power slightly instead of forcing higher power.
- Disable Smart Connect if you want predictable band steering.
- This pension build does not add special Wi-Fi drivers beyond the base Merlin/ASUS code.

---

## 2. Soft Center update domains

The Soft Center checks for updates from Koolcenter/ddnsto hosts. Useful if you want tighter outbound firewall rules:

| Domain / Pattern | Purpose |
|------------------|---------|
| `*.ddnsto.com` | Soft Center update and plugin downloads |
| `rogsoft.ddnsto.com` | Primary Soft Center package source for this platform |
| `fw.koolcenter.com` | Firmware download server (manual updates) |

### Firewall notes
- Blocking these domains prevents Soft Center and plugin updates but does not break basic routing.
- To allow firmware updates only, permit `fw.koolcenter.com` and block the ddnsto hosts.
- Exact subdomains can change. Check connection logs after opening the Software Center if you need a precise allow-list.

---

## 3. English Soft Center menu map

Many Soft Center pages are Chinese-first.

| Chinese (approx.) | English | What it does |
|-------------------|---------|--------------|
| 软件中心 | Software Center | Main plugin store |
| 已安装 | Installed | List of installed plugins |
| 更新 | Update | Check for updates |
| 卸载 | Uninstall | Remove a plugin |
| 启用 / 禁用 | Enable / Disable | Turn a plugin on or off |
| 设置 | Settings | Plugin configuration |
| 重启 | Reboot | Restart the router |
| 日志 | Log | View log |
| 下载 | Download | Download a package |
| 安装 | Install | Install a plugin |

### Common plugin names
- **Swap** — virtual memory
- **Tailscale / ZeroTier / SoftEther** — VPN options
- **KoolProxy** — ad/content filtering
- **USB2JFFS** — expand storage with USB
- **ACME** — Let’s Encrypt certificates
- **ShellInABox** — web terminal

If a page is mostly Chinese, look for the English plugin name or action buttons (Install / Update / Enable), which are often still recognizable.

---

## Quick checklist

- [ ] Set 2.4 GHz to channel 1/6/11 at 20 MHz
- [ ] Set 5 GHz to a non-DFS channel at 80 MHz
- [ ] Decide whether to allow or block Soft Center update domains
- [ ] Use the menu map when navigating Chinese Soft Center pages
- [ ] Install Swap before heavy plugins ([addons guide](Soft-Center-Addons.md))

---

See also: [Soft Center Addons](Soft-Center-Addons.md) · [Flashing Guide](README.md)
