# AI Team Skill Flow

This document defines the intended flow between the active Codex skills in this repository.

## Core Principle

Every active skill should do three things clearly:

1. accept a known input state;
2. produce a reusable output packet; and
3. make the next skill obvious.

## Primary Flow

### 1. Intake And Scope

1. `client-intake-normalizer`
2. `solution-options-tradeoffs`
3. `scope-convergence`

Artifacts:

- normalized brief
- option comparison
- scope decision

### 2. Orchestration And Team Formation

4. `ai-project-manager-orchestrator`
5. `ai-team-planner`
6. `backlog-management`
7. `task-assignment-governance`
8. `github-traceability-board-sync`

Artifacts:

- AI PM control packet
- AI team plan
- delivery backlog
- assignment packet
- traceability packet

### 3. Implementation And Delivery

9. `memory-bank`
10. `repo-discovery` when needed
11. domain skills such as:
   - `api-contract-integration`
   - `auth-identity`
   - `frontend-ui-states`
   - `infra-environments`
   - `database-schema-migrations`
   - `observability-monitoring`
12. `project-developer`
13. `review-verification`

Artifacts:

- continuity packet
- repository map packet
- domain-specific packets
- implementation packet
- verification packet

### 4. Release, Security, And Closure

14. `qa-e2e-release`
15. `security-production-readiness`
16. `docs-sync-handover`
17. `cross-agent-handover` when another AI role continues

Artifacts:

- release gate packet
- security gate packet
- documentation sync packet
- handoff packet

## Specialist Incident Flow

Use this for bugs, incidents, or flaky behavior:

1. `memory-bank`
2. `debugging-incident`
3. `project-developer`
4. `review-verification`
5. `docs-sync-handover`

## Routing Entry Point

Use `skill-router` when the starting path is unclear.

The router should choose the smallest valid path and prefer the active AI-team flow over legacy PM skills.

## Legacy And Supporting Skills

These skills are still available, but they are not the primary AI-team path:

- `autonomous-agent`
- `project-manager`
- `project-initialization`
- `requirements-analysis`
- `team-setup`
- `team-roles`
- `timeline-roadmap`
- `github-integration`
- `github-projects`
- `docker-setup`
- `cicd-delivery`
- `coding-assistant`

Use them when their specific artifact or support function is required, not as the default route.

## Ready-State Checklist

The skill pack is considered coherent when:

- each active skill has a clear output contract or packet;
- upstream and downstream relationships are visible;
- GitHub traceability is consistent with AI worker ownership;
- memory and docs closure are part of the normal flow; and
- legacy skills are clearly marked so they do not compete with the main path.
