---
name: github-traceability-board-sync
description: Use when AI-managed work must be reflected clearly in GitHub issues, pull requests, project fields, labels, and board state so ownership and progress remain auditable with one shared GitHub account.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - github
  - traceability
  - board
tags:
  - github
  - traceability
  - project-board
  - metadata
---

# GitHub Traceability Board Sync

Use this skill when logical AI roles must remain visible in GitHub even though the actual GitHub account is shared.

## Goals

1. Make AI ownership visible in issues and board items.
2. Keep GitHub status aligned with the real work state.
3. Preserve auditability for task flow, review, and handoff.

## Recommended Metadata

Track fields such as:

- `AI Worker`
- `AI Role`
- `Managed By`
- `Review Owner`
- `Depends On`
- `Risk`
- `Workstream`

Also use consistent:

- branch naming;
- PR title and body conventions;
- commit trailers; and
- issue labels or status mapping.

## Workflow

1. Map the logical AI roster to GitHub metadata.
2. Ensure each issue or board item carries the required ownership fields.
3. Sync task state changes to board movement and review state.
4. Keep branch, PR, and issue references consistent.

## Output Format

Produce:

1. required GitHub fields;
2. naming conventions;
3. sync rules for status changes; and
4. traceability gaps that need fixing.

## Rules

- One shared GitHub account is fine, but logical AI identity must still be explicit.
- GitHub should show who logically owns the task, not just who pushed the commit.
- Traceability should be consistent across issue, board, branch, and PR.
