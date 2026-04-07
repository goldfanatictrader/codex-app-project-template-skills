# Quick Start: Codex Memory Bank Template

This repository is meant to be copied or cloned into a project as `memory/`.

## 1. Add It To A Project

### Copy

```bash
cp -R codex-app-template /path/to/your-project/memory
cd /path/to/your-project/memory
mv TEMPLATE.md PROJECT.md
```

### Submodule

```bash
cd /path/to/your-project
git submodule add <your-fork-or-copy-url> memory
cd memory
mv TEMPLATE.md PROJECT.md
```

## 2. Install The Codex Skills

```bash
./scripts/install-skills.sh
```

This links each folder in `skills/` into `${CODEX_HOME:-$HOME/.codex}/skills/`.

## 3. Customize The Memory Bank

Update:

- `PROJECT.md`
- `context/stack.md`
- `context/architecture.md`
- `context/conventions.md`
- `requirements/*.md`
- `timeline/ROADMAP.md`
- `backlog/BACKLOG.md`

## 4. Verify The Skills

```bash
./scripts/check-skills.sh
```

## 5. Use It In Codex

Main AI-team flow reference:

- `docs/AI_TEAM_SKILL_FLOW.md`

Typical prompts:

- `Use $skill-router to decide which skill should handle this request`
- `Use $client-intake-normalizer to turn this client discussion into a brief`
- `Use $solution-options-tradeoffs to compare the best product or technical approaches`
- `Use $scope-convergence to decide what belongs in the MVP`
- `Use $ai-project-manager-orchestrator to run this as an AI-managed project`
- `Use $ai-team-planner to size the AI team for this project`
- `Use $task-assignment-governance to define AI task ownership and dependencies`
- `Use $github-traceability-board-sync to map AI worker identity into GitHub`
- `Use $cross-agent-handover to prepare the next AI worker handoff`
- `Use $memory-bank and tell me what to do next`
- `Use $project-developer to implement authentication`
- `Use $repo-discovery to inspect this repository before coding`
- `Use $requirements-analysis to turn this idea into a BRD and user stories`
- `Use $review-verification to review the latest diff for regressions`
- `Use $debugging-incident to investigate a flaky production bug`
- `Use $database-schema-migrations to plan a safe schema rollout`
- `Use $api-contract-integration to review an API breaking change`
- `Use $auth-identity to design roles and login flows`
- `Use $frontend-ui-states to complete a screen beyond the happy path`
- `Use $autonomous-agent to drive the project from planning to delivery`

## Session Rules

1. Read `PROJECT.md` first.
2. Check `DECISIONS.md` before making architectural changes.
3. Update memory before ending the session.

`memory-bank` and `project-developer` may be used implicitly by Codex because they are configured for automatic invocation.
