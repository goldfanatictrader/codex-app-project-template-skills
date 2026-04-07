---
name: docs-sync-handover
description: Use when implementation or planning changes must be reflected in project memory, handover notes, operational docs, or onboarding material so future sessions stay aligned.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - docs
  - handover
  - continuity
tags:
  - documentation
  - handover
  - memory-sync
  - onboarding
---

# Docs Sync Handover

Use this skill to keep documentation and project memory aligned with reality.

## Workflow

1. Identify what changed: architecture, behavior, operations, roadmap, or team knowledge.
2. Map those changes to the docs that should reflect them.
3. Update the smallest set of documents that restores consistency.
4. Leave a clear handover trail for the next session or owner.

## Typical Targets

- `PROJECT.md`
- `DECISIONS.md`
- `docs/README.md`
- `docs/API.md`
- `docs/DEPLOYMENT.md`
- `docs/ONBOARDING.md`
- roadmap and backlog artifacts

## Output Contract

Use this documentation sync packet:

```md
# Documentation Sync Packet

## Change Summary
- What changed in the project

## Docs Updated
- File
- Reason updated

## Docs Still Out Of Sync
- File
- Missing update

## Handover Note
- What the next owner should know

## Remaining Risk
- Risk 1
- Risk 2

## Recommended Next Step
- Usually: `$memory-bank` or `$cross-agent-handover`
```

## Output Format

Report:

1. what changed;
2. which docs were updated;
3. what still needs documentation; and
4. next handover note.

## Rules

- Do not update docs mechanically if behavior is still uncertain.
- Prefer concise, high-signal updates over long prose.
- Handover should tell the next owner where to continue and what still carries risk.
- The handover note should point to exact docs or files, not just broad areas.
