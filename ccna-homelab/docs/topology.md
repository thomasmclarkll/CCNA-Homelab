# Topology and Addressing

## Diagram

```
                     Home LAN / Internet
                            |
                     [UniFi router]
                       |         \
           (pfSense WAN vNIC)     Week 3+: SW1 Gi0/2 (VLAN 200 transit)
                       |
 [Hypervisor: pfSense VM + Linux VM]
         |  802.1Q trunk (VLANs 10,20,30,99,100)
         |
       Gi0/1
     [ SW1: WS-C3560CX-12TC-S ]
       Gi0/3  PC1 (VLAN 10)        Gi0/4  Laptop (VLAN 20)
       Gi0/5  spare / SPAN dest    Gi0/6  loop-cable / port-security tests
```

## VLAN and subnet plan

All addressing below is either RFC 1918 private space used only inside the
lab, or documentation space (RFC 5737 / RFC 3849) for anything meant to
represent a "public" or "ISP" address in examples. No real public IPs or
WAN addresses appear in this repo.

| VLAN | Name | Subnet | Purpose |
|---|---|---|---|
| 10 | STAFF | 10.10.10.0/24 | Main client VLAN |
| 20 | GUEST | 10.10.20.0/24 | Restricted clients, ACL-limited |
| 30 | SERVERS | 10.10.30.0/24 | Linux VM: DHCP relay target, syslog, TFTP |
| 99 | MGMT | 10.10.99.0/24 | Switch management SVI |
| 100 | TRANSIT-PF | 172.16.1.0/30 | SW1 <-> pfSense, OSPF peering |
| 200 | TRANSIT-UNIFI | 172.16.2.0/30 | SW1 <-> UniFi, floating static backup |

IPv6 lab addressing uses the documentation prefix `2001:db8::/32`.

## Hardware and virtualization

- **Switch:** Cisco WS-C3560CX-12TC-S, IP Base feature set (see
  `labs/week1-network-fundamentals/README.md` for the exact IOS version and
  a feature probe of what this image does and doesn't support).
- **Firewall:** pfSense, running as a VM with one NIC on the home WAN and one
  NIC trunked to the switch.
- **Router:** UniFi router, providing a second upstream path used for
  floating-static failover testing.
- **Client/server VMs:** a small Linux VM (DHCP relay target, syslog
  receiver, TFTP server) and a laptop used as a second client.

## What's real hardware vs. Packet Tracer

See each week's README for specifics, but as a rule: anything involving a
single switch, one router (pfSense), and one client is real hardware.
Anything needing a second Cisco switch, multiple routers, a WLC/AP, or
Cisco-native NAT is Packet Tracer, and is labeled as such in that week's
files.
