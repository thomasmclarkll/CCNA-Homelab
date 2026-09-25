# Terraform: Declarative State (Concept Demo)

The Catalyst 3560-CX has no Terraform provider, so this uses the `local`
provider as a stand-in to demonstrate the concept the exam cares about:
declarative, desired-state configuration and drift detection, as opposed to
Ansible's procedural, push-based model.

## Files

- `main.tf` — declares a file representing "desired VLAN state"

## Run

```bash
terraform init
terraform plan
terraform apply
```

Change the content in `main.tf`, run `terraform plan` again, and Terraform
shows exactly what would change. Delete the generated file by hand and run
`terraform plan` again — Terraform detects the drift and offers to recreate
it, which is the core idea behind infrastructure as code.

```bash
terraform destroy
```

## Ansible vs. Terraform, in practice

| | Ansible | Terraform |
|---|---|---|
| Model | Procedural (run these tasks) | Declarative (reach this state) |
| Idempotence | Each task checks before changing | Compares state file to reality |
| Used here for | Pushing config to the real switch over SSH | Demonstrating drift detection (local provider only — no real device support) |
