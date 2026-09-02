# passcheck. - Password Strength and Breach Checker

A password strength and known-breach checker that runs entirely in your browser. Your password is never sent anywhere in full, and the strength analysis never leaves the page at all.

**Live app:** https://aipal-staging.cloud/passcheck/

## Features

- **Live strength meter**: estimates entropy (in bits) from length and character variety as you type, with a plain English explanation of what is helping or hurting the score
- **Pattern detection**: flags common passwords (like "password123" or "qwerty"), obvious sequences (like "abcd" or "1234"), and repeated characters (like "aaaa"), and scores them down even if they look long
- **Checklist view**: quick pass and fail indicators for length, character variety, common password checks, and pattern checks
- **Breach check via k-anonymity**: on demand, hashes the password locally with SHA-1 and sends only the first 5 characters of that hash to the Have I Been Pwned Pwned Passwords API. The API returns every breached hash sharing that prefix, and the exact match is confirmed locally. The full password and full hash never leave the browser
- **Show and hide toggle**: password field is masked by default
- **Client side only**: no backend, no tracking, no logging of anything typed into the page

## Tech stack

Single file vanilla HTML, CSS, and JS (no framework, no build step). Uses the browser's built in `crypto.subtle` API for local SHA-1 hashing. IBM Plex Sans/Mono for a clean, technical feel, matching the visual language of the other tools in this portfolio.

## Development and deployment

This project follows a server first workflow. All changes are made and deployed directly on the host VM, with no local development environment involved.

```bash
ssh <vm-host>
cd ~/passcheck
git pull
./deploy.sh
```

`deploy.sh` copies the app to `/var/www/passcheck/` (served via Caddy) and fixes ownership. Reload Caddy only if `/etc/caddy/Caddyfile` itself changes.

---

Built by Tim, a small tool for a specific job.
