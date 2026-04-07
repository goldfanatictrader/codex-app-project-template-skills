---
name: frontend-ui-states
description: Use when building or reviewing user-facing screens that need strong handling of loading, empty, success, error, form, and responsive states across the UI.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - frontend
  - ui
  - product
tags:
  - ui-states
  - frontend
  - forms
  - responsive
---

# Frontend UI States

Use this skill to make interfaces complete, not just visually present.

## Workflow

1. Identify the primary user journey on the screen.
2. Enumerate required states: loading, empty, success, error, disabled, partial, and responsive.
3. Review form validation and async feedback.
4. Check navigation and recovery paths after failure.
5. Make sure the interface still works on smaller screens and slower networks.

## Focus Areas

- loading and skeleton strategy;
- empty-state messaging;
- error messaging and recovery action;
- optimistic versus confirmed state updates;
- form validation timing; and
- mobile and narrow-screen behavior.

## Output Contract

Use this screen-state packet:

```md
# UI State Packet

## Primary Journey
- Main user goal on this screen

## Required States
| State | Exists | Quality | Notes |
|-------|--------|---------|-------|
| loading | yes/no | strong/weak | ... |
| empty | yes/no | strong/weak | ... |
| success | yes/no | strong/weak | ... |
| error | yes/no | strong/weak | ... |
| disabled | yes/no | strong/weak | ... |
| responsive | yes/no | strong/weak | ... |

## Missing States
- Missing state 1
- Missing state 2

## Recovery Paths
- After error
- After empty result
- After validation failure

## Risky Interaction Points
- Risk 1
- Risk 2

## Recommended Improvements
- Improvement 1
- Improvement 2

## Recommended Next Step
- Usually: `$project-developer` or `$review-verification`
```

## Output Format

Report:

1. critical screen states;
2. missing UX states;
3. risky interaction points; and
4. recommended improvements.

## Rules

- A screen is not complete if it only handles the happy path.
- Prefer actionable empty and error states.
- Keep state handling consistent across similar screens.
- State reviews should mention recovery behavior, not just presentation.
