# Lessons Learned

The highlights, written for someone skimming this repo who wants to know what
you actually understand rather than what you configured. Update this as you
go; don't wait until the end.

## Troubleshooting patterns that stuck

(Example prompts to replace with your own findings.)

- What's the fastest way to tell a duplex mismatch from a bad cable?
- What's the one command you check first when an OSPF neighbor won't form?
- What's the most common mistake with `switchport trunk allowed vlan`, and
  why does it happen?

## Design decisions and tradeoffs

- Router-on-a-stick vs. SVI-based inter-VLAN routing: which did you use where,
  and why?
- Why does the floating static route to UniFi need an AD above 110, not just
  above 1?
- Where did you place standard vs. extended ACLs, and why does it matter?

## Mistakes worth keeping

Real mistakes, kept rather than edited out, are more convincing than a
spotless log. A few sentences each:

- A misconfiguration that took a while to diagnose, and how you found it.
- A time the lab environment (VM networking, VLAN tagging, etc.) caused a
  problem that looked like a Cisco config problem at first.

## What Packet Tracer couldn't show me vs. what the real switch couldn't show me

- Real hardware advantages you noticed (actual interface counters, real SSH
  negotiation quirks, etc.).
- Things only possible in Packet Tracer given a one-switch homelab (STP root
  elections, EtherChannel, wireless, HSRP, Cisco NAT).
