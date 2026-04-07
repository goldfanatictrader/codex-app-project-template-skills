---
name: qa-e2e-release
description: Use when preparing a feature, milestone, or release for final verification. It focuses on QA coverage, smoke tests, end-to-end readiness, and go or no-go decisions.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - qa
  - release
  - e2e
tags:
  - qa
  - e2e
  - release-readiness
  - smoke-test
---

# QA E2E Release

Use this skill when the question is whether a change is ready to ship.

## Workflow

1. Define the release scope.
2. Identify critical user journeys.
3. Map verification to unit, integration, smoke, and E2E layers.
4. Run the narrowest high-signal checks first.
5. Identify blockers, gaps, and residual risks.
6. Give a clear go, no-go, or go-with-risk assessment.

## Priority Checks

- startup and health check;
- authentication and authorization path;
- happy-path critical flows;
- core data write paths;
- rollback or recovery readiness; and
- environment-specific release checks.

## Output Format

Report:

1. release scope;
2. checks run;
3. blockers;
4. missing coverage;
5. residual risk; and
6. release recommendation.

## Rules

- Distinguish confirmed blockers from missing evidence.
- Prefer high-value user journeys over exhaustive test lists.
- If E2E coverage does not exist, say what smoke coverage is still needed.
