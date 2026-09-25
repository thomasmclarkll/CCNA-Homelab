# Capstone: The Branch Office Build

**Ran on:** Real switch + pfSense for the routed/segmented core (Part A);
Packet Tracer for the multi-device extension (Part B: three switches, HSRP
pair, wireless, Cisco NAT, EtherChannel).

## Goal

Build a small branch-office network from a wiped switch, using only a
requirements list, then verify every requirement and inject faults across
several domains at once. This ties together Weeks 1–6.

## Requirements

Reproduce the requirements table you worked from (security, VLANs/trunking,
SVIs, OSPF + floating static, DHCP/NTP/syslog/SNMP, ACL/port
security/snooping/DAI, and an Ansible verification playbook). Link back to
`docs/study-log.md` for the date this was done and the time it took.

## What I built

Narrative walkthrough, linking to `configs/` and `verification/`.

## Verification

For each requirement, the `show` command that proves it, with the interesting
output pulled inline and full output saved under `verification/`.

## Faults injected during the timed verification pass

Same format as the weekly labs: symptom, diagnosis, root cause, fix.

## Packet Tracer extension (Part B)

What this covered that the single switch couldn't: STP root election across
three switches, EtherChannel, an HSRP pair, a WLC + APs with a WPA2 WLAN, and
Cisco-native PAT to a simulated ISP. `.pkt` file(s) in `packet-tracer/`.

## Timing

- Part A (real hardware) build + verification:
- Part B (Packet Tracer) build + verification:
- Full timed practice exam afterward: score, and domains missed:
