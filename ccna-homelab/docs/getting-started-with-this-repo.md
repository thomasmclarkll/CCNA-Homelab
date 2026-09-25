# Getting Started With This Repo (delete this file, or move its contents
into a CONTRIBUTING.md, once you're comfortable with the workflow)

## First-time setup

```bash
cd ccna-homelab
git init
git add .
git commit -m "Initial scaffold: structure, templates, sanitize script"

# Secret scanning
pip install pre-commit
pre-commit install
```

Create your GitHub repo (private, to start) and push:

```bash
git remote add origin git@github.com:YOUR-USERNAME/ccna-homelab.git
git branch -M main
git push -u origin main
```

## Weekly workflow

1. During the week, fill in `docs/study-log.md` for that week as you go —
   don't wait until Saturday night to write it all at once.
2. After a lab session, before committing anything:
   - Copy the raw config or `show` output into the week's `verification/` or
     `configs/` folder.
   - Run it through the sanitizer: `scripts/sanitize.sh raw-file.txt -i`
   - **Read the file yourself.** The script is a safety net, not a
     guarantee. It targets passwords, secrets, community strings, and MAC
     addresses — it will not catch everything, and it deliberately does not
     touch IP addresses, since most of them are lab-only and are the point.
3. Fill in that week's `README.md` — especially the "faults injected"
   section. That's the part a hiring manager actually reads.
4. Commit with a specific message: `git commit -m "week2: trunk config +
   native VLAN mismatch writeup"`, not `git commit -m "week 2"`.
5. After finishing a week, tag it: `git tag week-2-complete && git push
   --tags`.

## Before making the repo public

- [ ] Run `pre-commit run --all-files` once, so gitleaks scans everything
      already committed, not just new commits.
- [ ] Skim every file in every `configs/` and `verification/` folder by eye.
- [ ] Confirm `inventory.yml`, `.tfstate`, and any pfSense export never got
      committed (`git log --all --full-history -- inventory.yml` should be
      empty).
- [ ] If a secret WAS committed at any point: rotate it on the real device
      immediately, then remove it from history with `git filter-repo` before
      making the repo public. Deleting it in a later commit is not enough —
      it stays in history and is trivially recoverable.
- [ ] Flip the GitHub repo from private to public.
- [ ] Pin the repo on your GitHub profile.
