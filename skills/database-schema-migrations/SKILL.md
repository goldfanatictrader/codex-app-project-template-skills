---
name: database-schema-migrations
description: Use when designing schema changes, writing migrations, planning data backfills, or validating rollback safety for persistent data changes.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - database
  - migrations
  - data
tags:
  - schema
  - migrations
  - backfill
  - rollback
---

# Database Schema Migrations

Use this skill when changing persistent data structures.

## Workflow

1. Define the schema change and affected write paths.
2. Check backward and forward compatibility.
3. Decide whether the change needs expand, migrate, contract phases.
4. Plan backfill and rollout order.
5. Define rollback or recovery options.
6. Verify data integrity after change.

## Focus Areas

- locking and downtime risk;
- compatibility with old and new app versions;
- default values and null handling;
- index creation cost;
- backfill safety; and
- rollback realism.

## Output Contract

Use this migration packet:

```md
# Migration Packet

## Schema Change Summary
- What changes

## Compatibility Strategy
- Backward compatibility
- Forward compatibility

## Rollout Plan
- Expand
- Migrate
- Contract

## Backfill Plan
- Data rewrite steps
- Safety controls

## Rollback Plan
- What can be rolled back
- What cannot be rolled back safely

## Integrity Checks
- Check 1
- Check 2

## Recommended Next Step
- Usually: `$project-developer`, `$review-verification`, or `$qa-e2e-release`
```

## Output Format

Report:

1. schema change summary;
2. rollout plan;
3. backfill plan;
4. rollback plan; and
5. integrity checks.

## Rules

- Prefer expand and contract migrations for production systems.
- Do not assume rollback is trivial when data has been rewritten.
- Call out destructive changes explicitly.
- The packet should say directly whether rollback is realistic or only partial.
