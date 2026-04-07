---
name: api-contract-integration
description: Use when defining or changing APIs, checking compatibility, aligning client-server integration, or reviewing schema drift between producers and consumers.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - api
  - contracts
  - integration
tags:
  - api
  - contracts
  - compatibility
  - integration
---

# API Contract Integration

Use this skill when interfaces between systems matter more than one codebase alone.

## Workflow

1. Identify producer and consumer boundaries.
2. Define or inspect the contract: routes, payloads, errors, auth, versioning.
3. Check backward compatibility.
4. Identify breaking changes and migration requirements.
5. Confirm test or mock strategy for integration confidence.

## Focus Areas

- request and response schema;
- optional versus required fields;
- error formats;
- auth and permission assumptions;
- pagination and filtering conventions; and
- client impact from breaking changes.

## Output Contract

Use this interface packet:

```md
# API Contract Packet

## Producer And Consumers
- Producer service
- Consumer service or client

## Contract Surface
- Route or event
- Auth model
- Request schema
- Response schema
- Error schema

## Compatibility Assessment
- additive / compatible
- breaking
- migration needed

## Consumer Impact
- Consumer 1 impact
- Consumer 2 impact

## Test And Mock Plan
- Integration test needed
- Contract test needed
- Mock or fixture needed

## Recommended Change Strategy
- Preferred path
- What to avoid

## Recommended Next Step
- Usually: `$project-developer`, `$review-verification`, or `$qa-e2e-release`
```

## Output Format

Report:

1. contract summary;
2. consumer impact;
3. compatibility risks;
4. integration test needs; and
5. recommended change strategy.

## Rules

- Treat consumer breakage as a release risk.
- Prefer additive changes over breaking changes when possible.
- Mention versioning strategy when compatibility cannot be preserved.
- Every output should say explicitly whether the change is additive, compatible, or breaking.
