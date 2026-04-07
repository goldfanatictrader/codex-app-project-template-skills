---
name: infra-environments
description: Use when defining or reviewing development, staging, and production environments, environment parity, secret flow, config boundaries, or infrastructure ownership.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - infrastructure
  - environments
  - operations
tags:
  - infra
  - environments
  - config
  - deployment
---

# Infra Environments

Use this skill when environment layout and deployment safety matter.

## Workflow

1. Map existing environments and owners.
2. Check configuration boundaries across local, staging, and production.
3. Review secret injection and runtime configuration.
4. Check parity gaps that create “works locally” failures.
5. Review deployment dependencies and rollback assumptions.

## Focus Areas

- config drift;
- secret distribution;
- environment-specific services;
- staging realism;
- deployment ownership; and
- rollback path.

## Output Contract

Use this environment packet:

```md
# Environment Topology Packet

## Environment Map
| Environment | Purpose | Owner | Deploy Path |
|-------------|---------|-------|-------------|
| local | development | ... | ... |
| staging | pre-release | ... | ... |
| production | live traffic | ... | ... |

## Config And Secret Flow
- How config enters each environment
- How secrets are injected

## Parity Gaps
- Gap 1
- Gap 2

## Deployment Dependencies
- Dependency 1
- Dependency 2

## Rollback And Recovery Notes
- Rollback method
- Recovery assumption

## Recommended Cleanup
- Cleanup 1
- Cleanup 2

## Recommended Next Step
- Usually: `$cicd-delivery`, `$security-production-readiness`, or `$qa-e2e-release`
```

## Output Format

Report:

1. environment map;
2. parity gaps;
3. config and secret risks;
4. deployment dependencies; and
5. recommended cleanup.

## Rules

- Environment differences should be intentional, not accidental.
- Prefer explicit configuration boundaries.
- Call out where staging is not representative enough for release confidence.
- Every output should identify whether staging is trustworthy enough for release validation.
