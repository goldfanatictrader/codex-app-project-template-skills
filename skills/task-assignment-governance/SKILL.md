---
name: task-assignment-governance
description: Use when AI-managed work must be broken into owned tasks with clear assignees, reviewers, dependencies, escalation rules, and status transitions before execution starts.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - governance
  - assignment
  - orchestration
tags:
  - task-assignment
  - governance
  - ownership
  - dependencies
---

# Task Assignment Governance

Use this skill when AI work must be assigned in a disciplined way rather than as a vague task list.

## Goals

1. Turn scope into assignable work units.
2. Define owner, reviewer, dependency, and escalation path for each task.
3. Make status transitions explicit so the AI PM can manage progress.

## Workflow

1. Break scope into tasks small enough to own and review.
2. Assign each task a logical AI worker and role.
3. Use `.github/ISSUE_TEMPLATE/ai-task.md` as the default task structure.
4. Define:
   - owner;
   - reviewer;
   - dependency list;
   - blocker escalation path; and
   - definition of done.
5. Separate parallel work from sequential work.
6. Mark tasks that should not start until prerequisites are complete.

Use [docs/AI_TEAM_GITHUB_OPERATIONS.md](../../docs/AI_TEAM_GITHUB_OPERATIONS.md) when the GitHub board conventions need to be applied consistently.

## Output Format

Produce:

1. task list;
2. owner and reviewer for each task;
3. dependency map;
4. status flow; and
5. escalation rules.

## Rules

- Do not create tasks that are too broad to review.
- Every task should have exactly one primary logical owner.
- Dependencies should be explicit, not implied.
