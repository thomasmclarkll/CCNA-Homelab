# Ansible: Verifying and Backing Up SW1

A small playbook that connects to the real Catalyst switch over SSH, reads
version and VLAN state, ensures two VLANs exist, and backs up the running
config. Demonstrates idempotence: running it twice produces no changes the
second time.

## Setup

```bash
python3 -m venv ansible-env && . ansible-env/bin/activate
pip install ansible paramiko
ansible-galaxy collection install cisco.ios ansible.netcommon
```

Copy `inventory.example.yml` to `inventory.yml` (gitignored) and fill in your
switch's management IP. Credentials come from environment variables, never
from a committed file:

```bash
export SW_PASS='your-ssh-password'
export SW_ENABLE='your-enable-password'
```

## Run

```bash
ansible-playbook -i inventory.yml site.yml
ansible-playbook -i inventory.yml site.yml --check --diff   # dry run
```

## What it does

1. Reads `show version` and prints the first line.
2. Ensures VLAN 40 (IOT) and VLAN 50 (PRINTERS) exist.
3. Backs up the running config to `backups/` (gitignored — backups may
   contain hostnames/addressing you don't want public; sanitize before
   committing an example).

## Result

Run once: two VLANs reported as changed. Run again: `changed=0` across the
board, which is idempotence in practice, not just in the textbook definition.
Paste your actual `--check --diff` output here (sanitized) as evidence.
