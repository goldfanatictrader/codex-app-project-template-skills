---
name: cross-agent-handover
description: Use when work is moving from one AI role to another and the receiving worker needs a compact, high-signal handoff with current state, decisions, risks, and exact next actions.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - handover
  - coordination
  - ai-team
tags:
  - handoff
  - coordination
  - ai-team
  - continuity
---

# Cross Agent Handover

Use this skill when one logical AI worker is finishing a task slice and another worker must continue from a stable checkpoint.

## Goals

1. Preserve context across worker boundaries.
2. Reduce duplicated analysis.
3. Make the next action obvious to the receiving worker.

## Handover Format

Every handoff should include:

1. objective;
2. work completed;
3. relevant files, issues, or PRs;
4. decisions made;
5. unresolved risks or blockers; and
6. exact next action.

## Workflow

1. Summarize only what the next worker truly needs.
2. Point to concrete artifacts rather than rewriting everything.
3. State what is done, what is not done, and what must not be changed casually.
4. Mark whether the handoff is to implementation, review, QA, docs, or release.

## Rules

- Handoff should be short, specific, and operational.
- Never hide uncertainty; call it out directly.
- A good handoff lets the next worker start immediately.
