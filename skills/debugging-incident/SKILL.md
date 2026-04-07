---
name: debugging-incident
description: Use when a bug is hard to reproduce, an incident is active, tests are flaky, or a production issue needs structured diagnosis, containment, and root cause analysis.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - debugging
  - incident
  - reliability
tags:
  - debugging
  - incident-response
  - root-cause
  - flaky-tests
---

# Debugging Incident

Use this skill for defects that need diagnosis, not just implementation.

## Workflow

1. Define the failing behavior precisely.
2. Establish impact, scope, and urgency.
3. Reproduce the issue with the smallest reliable case.
4. Narrow the fault domain: app logic, state, environment, data, or dependency.
5. Contain the issue if production impact is active.
6. Identify likely root cause and supporting evidence.
7. Propose or implement the safest fix.
8. Add regression protection.

## During Investigation

- Prefer evidence over guesses.
- Record what was ruled out.
- Note whether the issue is deterministic, intermittent, or environment-specific.
- Separate symptom, trigger, and root cause.

## Output Contract

Use this incident packet:

```md
# Incident Packet

## Observed Failure
- Symptom
- Trigger

## Impact And Urgency
- User impact
- Severity

## Reproduction Status
- Reproduced / not reproduced
- Smallest known repro

## Likely Root Cause
- Evidence-backed cause

## Containment Or Workaround
- Short-term action

## Recommended Fix
- Safe fix path

## Regression Guard
- Test or monitoring addition

## Recommended Next Step
- Usually: `$project-developer`, `$review-verification`, or `$cross-agent-handover`
```

## Output Format

Report:

1. observed failure;
2. impact and urgency;
3. reproduction status;
4. likely root cause;
5. containment or workaround;
6. recommended fix; and
7. regression guard.

## Rules

- Do not call something root cause without evidence.
- If reproduction is missing, say what makes it hard.
- If rollback is safer than a hotfix, say so clearly.
- Every incident packet should separate symptom, trigger, and root cause explicitly.
