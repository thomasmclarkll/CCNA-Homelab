# CCNA Homelab: Segmented Network with Routing, Security, and Automation

A six-week, hands-on CCNA 200-301 study project built on real hardware: a Cisco
Catalyst WS-C3560CX-12TC-S, a pfSense firewall VM, and a UniFi router, with
Packet Tracer used for multi-device scenarios the single switch can't cover
(STP root elections, EtherChannel, wireless, Cisco NAT, HSRP).

**Status:** in progress, started September 2026, targeting the CCNA exam before
Thanksgiving 2026. `docs/study-log.md` tracks weekly progress; each week below
links to its own writeup.

## What I built

- VLAN segmentation with 802.1Q trunking from a Catalyst switch into a
  virtualized firewall
- Inter-VLAN routing (router-on-a-stick and switch SVIs), OSPFv2 peering with
  pfSense, and floating static routes for failover to a second ISP path
- DHCP (server and relay), NTP, syslog, SNMPv3, and SSH-only management
- Extended ACLs, port security, DHCP snooping, and Dynamic ARP Inspection,
  including a live rogue-DHCP-server test
- Ansible playbooks that verify switch state and back up configuration over SSH

## Repo layout

```
docs/             topology, IP/VLAN plan, weekly study log, lessons learned
labs/weekN-*/     one folder per exam domain: README, sanitized configs,
                  saved verification output, and any Packet Tracer files
capstone/         the week 6 branch-office build tying all domains together
automation/       Ansible playbooks and Terraform examples
scripts/          sanitize.sh strips secrets/real IPs before anything is committed
```

## Skills demonstrated, and where to look

| Area | Where |
|---|---|
| VLANs, trunking, STP | [labs/week2-network-access](labs/week2-network-access) |
| Routing, OSPF troubleshooting | [labs/week3-ip-connectivity](labs/week3-ip-connectivity) |
| Network services (DHCP/NTP/syslog/SNMP) | [labs/week4-ip-services](labs/week4-ip-services) |
| Security hardening, ACLs, DHCP snooping/DAI | [labs/week5-security](labs/week5-security) |
| Automation (Ansible/Terraform, REST, JSON) | [automation](automation) |
| Full build tying it together | [capstone](capstone) |

## Real hardware vs. Packet Tracer

Most of this ran on real gear: the 3560-CX, pfSense, and UniFi. A single
switch can't demonstrate everything the exam covers (a second switch for real
STP elections and EtherChannel, a WLC and APs for wireless, HSRP, Cisco-style
NAT). Every lab README says explicitly which parts were physical and which
were done in Cisco Packet Tracer, and why.

## Lab topology

See [docs/topology.md](docs/topology.md) for the full diagram and IP/VLAN
plan. All addressing here uses private ranges or RFC 5737/3849 documentation
prefixes; nothing reflects real public IPs.

## About this project

I built this as a structured way to prepare for the CCNA while documenting
the process the way I'd want to show it to a hiring manager: real configs,
real `show` output, real faults I injected and diagnosed, not just a
certificate. Feedback welcome via issues.
