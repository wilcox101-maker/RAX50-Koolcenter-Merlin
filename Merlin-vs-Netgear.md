# Merlin (Koolcenter) vs Stock Netgear on RAX50

| Aspect | Stock Netgear | Koolcenter Merlin | Notes |
|--------|---------------|-------------------|-------|
| **Web UI** | Netgear Nighthawk | ASUS Merlin-style | Merlin UI is more feature-rich and customizable |
| **Plugin system** | None | Soft Center (koolshare) | Major gain — dozens of plugins (VPN, DNS, monitoring, etc.) |
| **JFFS / scripts** | Limited | Full JFFS + custom scripts | Enables persistent scripts, Entware, etc. |
| **VPN** | Basic OpenVPN/WireGuard | Stronger OpenVPN, WireGuard, policy routing, multiple clients | Clear improvement |
| **DNS** | Basic | DNS Filter, Adblock, custom dnsmasq, DoH/DoT options | Significant improvement |
| **QoS / Traffic** | Netgear QoS | Adaptive QoS, bandwidth monitor, more controls | Better control |
| **AiMesh** | No | Enabled in 386.7_2 | Can join ASUS AiMesh (with caveats) |
| **Updates** | Official Netgear | Community (Koolcenter) | Stock gets security patches longer; Merlin RAX50 is on a “pension” build |
| **Stability** | High (official) | Generally good, but community-supported | Stock is safer for pure reliability |
| **Recovery** | Easy (Netgear tools) | Possible but more involved | Stock is simpler to recover |
| **Region / power** | Locked to region | Often more flexible | Merlin can allow higher power or different regions (use carefully) |
| **Nighthawk app** | Full support | Limited / broken | Loss of Netgear mobile app features |
| **Official support** | Yes | None | No Netgear warranty/support once flashed |
| **Resource use** | Lower | Higher (plugins + Soft Center) | Merlin uses more RAM/CPU with plugins enabled |

## What you gain

- Soft Center plugins
- Better VPN and policy-based routing
- More powerful DNS controls
- Custom scripts and Entware
- AiMesh support (in this build)
- More transparent and configurable firewall/QoS

## What you lose

- Official Netgear updates and support
- Full Nighthawk app functionality
- Some Netgear-specific features (e.g., certain armor/security integrations)
- Simpler recovery path

## Bottom line

**Merlin wins** if you want plugins, better VPN/DNS control, and customization.  
**Stock Netgear wins** if you want maximum reliability, official updates, and zero risk of community-firmware issues.

For most power users the Soft Center and extra controls make the switch worthwhile; for set-and-forget use, stock is safer.
