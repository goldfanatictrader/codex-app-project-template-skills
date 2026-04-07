---
name: ai-team-planner
description: Use when the project needs a logical AI team roster, role definitions, workstream ownership, and handoff structure sized to the project rather than assumed in advance.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - team-planning
  - orchestration
  - ai-team
tags:
  - ai-team
  - roster
  - planning
  - ownership
---

# AI Team Planner

Use this skill to define the logical AI team for a project.

## Workflow

1. Size the logical team based on scope, risk, and parallel workstreams.
2. Define the roles that are actually needed.
3. Map each role to ownership, dependencies, and review path.
4. Recommend the first assignments.

## Typical Roles

- AI Project Manager
- Architect
- Backend Engineer
- Frontend Engineer
- QA or Release Engineer
- DevOps or Infra Engineer
- Docs or Handover Owner

## Output Format

Produce:

1. proposed AI team roster;
2. role responsibilities;
3. workstream ownership map; and
4. recommended first assignments.

## Rules

- Add roles only when they change delivery capacity or risk.
- One person can cover multiple logical AI roles on small projects.
- Large projects still need clear ownership boundaries.
