---
name: security-production-readiness
description: Use when reviewing a system before release or when security-sensitive features are changing. It focuses on secrets, auth, permissions, dependency risk, hardening, and operational safety.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - security
  - production
  - hardening
tags:
  - security
  - hardening
  - secret-management
  - release-readiness
---

# Security Production Readiness

Use this skill to check whether the app is safe enough to expose to real users.

## Workflow

1. Identify the sensitive surfaces: auth, secrets, data access, admin actions, external integrations.
2. Review how secrets are stored, injected, rotated, and logged.
3. Check permission boundaries and unsafe defaults.
4. Review dependency and supply-chain exposure.
5. Check hardening basics for runtime, storage, and network exposure.
6. Summarize priority fixes before release.

## Focus Areas

- secret handling;
- auth and session security;
- role and permission checks;
- input validation and unsafe trust boundaries;
- data exposure in logs or responses;
- backup and restore posture; and
- dependency or container vulnerabilities.

## Output Contract

Use this security gate packet:

```md
# Security Gate Packet

## Critical Risks
- Risk 1
- Risk 2

## Medium Risks
- Risk 1
- Risk 2

## Existing Controls
- Control 1
- Control 2

## Missing Safeguards
- Safeguard 1
- Safeguard 2

## Release Recommendation
- Block release / allow with fixes / allow with accepted risk

## Recommended Next Step
- Usually: `$project-developer`, `$auth-identity`, or `$qa-e2e-release`
```

## Output Format

Report:

1. critical risks;
2. medium risks;
3. security controls already present;
4. missing safeguards; and
5. release recommendation.

## Rules

- Prioritize exploitable risk over theoretical style issues.
- If evidence is incomplete, state the uncertainty explicitly.
- Prefer concrete remediations over generic “secure this” advice.
- The release recommendation must tie back to exploitable risk, not vague concern.
