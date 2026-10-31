# Merlin (Koolcenter) vs Stock Netgear

Comparison for the Netgear RAX50.

| Aspect | Stock Netgear | Koolcenter Merlin | Notes |
|--------|---------------|-------------------|-------|
| **Web UI** | Netgear Nighthawk | ASUS Merlin-style | Merlin UI is more feature-rich and customizable |
| **Plugin system** | None | Soft Center (rogsoft) | Major gain — VPN, DNS, monitoring, and more |
| **JFFS / scripts** | Limited | Full JFFS + custom scripts | Enables persistent scripts and Entware |
| **VPN** | Basic OpenVPN/WireGuard | Stronger options + policy routing | Clear improvement |
| **DNS** | Basic | DNS Filter, Adblock, custom dnsmasq, DoH/DoT | Significant improvement |
| **QoS / Traffic** | Netgear QoS | Adaptive QoS, bandwidth monitor | Better control |
| **AiMesh** | No | Enabled in 386.7_2 | Can join ASUS AiMesh (with caveats) |
| **Updates** | Official Netgear | Community (Koolcenter) | Stock receives security patches longer; this Merlin build is a pension release |
| **Stability** | High (official) | Generally good, community-supported | Stock is safer for pure reliability |
| **Recovery** | Straightforward | Possible but more involved | See [Recovery](README.md#recovery) |
| **Region / power** | Locked to region | Often more flexible | Use carefully |
| **Nighthawk app** | Full support | Limited / broken | Loss of Netgear mobile app features |
| **Official support** | Yes | None | No Netgear warranty once flashed |
| **Resource use** | Lower | Higher with plugins | Merlin uses more RAM/CPU |

## What you gain

- Soft Center plugins
- Better VPN and policy-based routing
- Stronger DNS controls
- Custom scripts and Entware
- AiMesh support (in this build)
- More transparent firewall and QoS options

## What you lose

- Official Netgear updates and support
- Full Nighthawk app functionality
- Some Netgear-specific features
- The simplest recovery path

## Bottom line

**Choose Merlin** if you want plugins, better VPN/DNS control, and customization.  
**Choose stock Netgear** if you want maximum reliability, official updates, and zero community-firmware risk.

For most power users the Soft Center makes the switch worthwhile. For set-and-forget use, stock is safer.

---

See also: [Soft Center Addons](Soft-Center-Addons.md) · [Optimization Notes](Optimization-Notes.md)
