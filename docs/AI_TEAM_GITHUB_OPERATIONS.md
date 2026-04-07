# AI Team GitHub Operations

This document defines how a logical AI team should appear inside GitHub when the actual GitHub account is shared.

## Purpose

Use these conventions so GitHub still shows:

- who logically owns a task;
- who is reviewing it;
- who is managing it;
- what depends on what; and
- where work is blocked or handed off.

## Core Principle

One GitHub account is acceptable.

Logical AI identity must be expressed through metadata, not through multiple GitHub users.

## Required GitHub Project Fields

Create fields like these in GitHub Projects:

| Field | Purpose | Example |
|------|---------|---------|
| `Status` | Current workflow state | `In Progress` |
| `AI Worker` | Logical worker identity | `ai-backend-01` |
| `AI Role` | Responsibility type | `backend-engineer` |
| `Managed By` | AI PM owner | `ai-project-manager` |
| `Review Owner` | Review or QA owner | `ai-qa-01` |
| `Workstream` | Domain or feature slice | `auth-mvp` |
| `Priority` | Delivery priority | `P0` |
| `Risk` | Delivery or technical risk | `medium` |
| `Depends On` | Upstream dependency | `#42` |
| `Phase` | Delivery phase | `implementation` |
| `Next Handoff` | Next AI receiver | `ai-qa-01` |

## Recommended Status Flow

Use a clear workflow such as:

1. `Backlog`
2. `Ready`
3. `In Progress`
4. `In Review`
5. `In QA`
6. `In Handover`
7. `Blocked`
8. `Done`

## Issue Template Usage

Use [.github/ISSUE_TEMPLATE/ai-task.md](../.github/ISSUE_TEMPLATE/ai-task.md) for tasks that are owned by a logical AI worker.

Required fields in each task:

- objective;
- AI worker;
- AI role;
- managed by;
- review owner;
- depends on;
- definition of done; and
- next handoff.

## Pull Request Template Usage

Use [.github/pull_request_template.md](../.github/pull_request_template.md) so every PR shows:

- logical AI owner;
- manager;
- verification run;
- residual risks; and
- next handoff.

## Branch Naming Convention

Use consistent branch naming:

```text
ai/<worker>/<task-id>-<short-scope>
```

Examples:

```text
ai/backend-01/123-login-api
ai/frontend-01/124-login-screen
ai/qa-01/125-auth-regression
```

## Commit Trailer Convention

Use commit trailers on AI-generated work:

```text
AI-Worker: ai-backend-01
AI-Role: backend-engineer
Managed-By: ai-project-manager
Task-ID: 123
```

## Handoff Rules

When work moves between logical AI roles:

1. update `Next Handoff`;
2. move the board item to the matching status;
3. link the relevant issue or PR; and
4. include a short handoff note using the cross-agent handover format.

## Minimal Setup Checklist

- [ ] create the custom project fields
- [ ] adopt the status flow
- [ ] use the AI task issue template
- [ ] use the PR template
- [ ] standardize branch naming
- [ ] standardize commit trailers
- [ ] require `AI Worker` and `Managed By` on every tracked task
