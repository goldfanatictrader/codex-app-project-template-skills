# Codex Project Guide

This repository is the Codex-oriented version of the original OpenCode template.

## Purpose

It combines:

- a reusable project memory bank;
- a structured documentation pack for planning and delivery; and
- a multi-skill Codex workflow for development, project management, GitHub operations, and delivery.

## Codex Workflow

### At Session Start

1. Read `PROJECT.md`.
2. Check `DECISIONS.md`.
3. Review `context/conventions.md`.
4. Load any other context documents needed for the current task.

### During The Session

- Update decisions when rationale changes.
- Keep backlog, roadmap, and requirements in sync with the real state of the project.
- Use the appropriate installed skill from `skills/`.

### At Session End

1. Add a session entry to `PROJECT.md`.
2. Add any new decision to `DECISIONS.md`.
3. Update task status and next actions.

## Suggested Skill Entry Points

- `$skill-router` when the correct workflow is not obvious
- `$memory-bank` for continuity across sessions
- `$project-developer` for normal implementation work
- `$autonomous-agent` for end-to-end project execution
- `$repo-discovery` for unfamiliar repositories or inherited codebases
- `$requirements-analysis` for discovery and planning
- `$review-verification` for code review, regression checks, and release confidence
- `$debugging-incident` for hard bugs and incidents
- `$qa-e2e-release` for release gates and critical-flow verification
- `$security-production-readiness` for hardening and pre-release risk review
- `$observability-monitoring` for logs, metrics, and alerts
- `$database-schema-migrations` for persistent data changes
- `$api-contract-integration` for interface and compatibility work
- `$auth-identity` for auth, RBAC, and account lifecycle changes
- `$frontend-ui-states` for non-happy-path UX coverage
- `$infra-environments` for environment and deployment topology
- `$docs-sync-handover` for keeping memory and documentation aligned
- `$backlog-management` and `$github-projects` for delivery tracking

`$memory-bank` and `$project-developer` are also suitable as implicit core skills for normal project work.

## Installation

Run `./scripts/install-skills.sh` from the repository root to link the skills into Codex.
