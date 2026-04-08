---
name: memory-bank
description: Memory Bank integration skill - ensures AI always reads and updates project memory for long-term continuity
version: 1.0.0
created: 2026-04-07
author: User
license: MIT
compatibility:
  - codex app
categories:
  - memory
  - context
  - continuity
tags:
  - memory-bank
  - long-term-memory
  - project-context
  - session-continuity
---

# Memory Bank Integration Skill

## Position In The AI Team Stack

This is a primary continuity skill.

Use it:

1. before almost any project work begins; and
2. before `docs-sync-handover` or `cross-agent-handover` ends a session.

## Purpose

This skill ensures the AI reads and updates the project memory bank at the start and end of every session, enabling true long-term memory across sessions.

## Workflow

### Session Start (MANDATORY)

**FIRST ACTION**: Read project memory before ANY other action:

```bash
# If the current project has no memory yet, bootstrap it from the template snapshot
if [ ! -f "memory/PROJECT.md" ] && [ ! -f "PROJECT.md" ]; then
  bash scripts/bootstrap-memory.sh "$PWD"
fi

# Check if project has memory bank
if [ -f "memory/PROJECT.md" ]; then
  cat memory/PROJECT.md
elif [ -f "PROJECT.md" ]; then
  cat PROJECT.md
fi
```

**If memory exists:**
1. Read `memory/PROJECT.md` completely
2. Check `memory/DECISIONS.md` for rationale
3. Review current tasks and blockers
4. Note last session date and next steps

**If NO memory exists:**
1. Run the bundled `scripts/bootstrap-memory.sh "$PWD"` from this skill directory
2. Re-read `memory/PROJECT.md`
3. Continue the session with the new local memory copy
4. Tell the user that project memory was bootstrapped automatically

### During Session

**When making decisions:**
- Document in memory/DECISIONS.md with full rationale
- Include "why" not just "what"

**When completing tasks:**
- Update memory/PROJECT.md task status

**When discovering important information:**
- Add to appropriate memory section

### Session End (MANDATORY)

**BEFORE responding "done" or ending conversation:**

Update memory bank with:
1. New session entry in Session History
2. Any new decisions made
3. Updated task status
4. Next steps for continuation

```bash
# Quick memory update commands
# Add to session history in memory/PROJECT.md
# Add to decisions in memory/DECISIONS.md if needed
```

## Memory Bank Location Priority

1. `./memory/PROJECT.md` when working from a project root
2. `./PROJECT.md` when working inside the memory repository directly
3. `./docs/memory/PROJECT.md` only if the project stores memory there explicitly

## Key Reminders

- ALWAYS read memory at session start
- ALWAYS bootstrap `memory/` automatically if it is missing
- ALWAYS update memory at session end
- Include rationale in decisions
- Mark tasks as complete
- Provide clear "next steps"

## Output Contract

Use this continuity packet:

```md
# Continuity Packet

## Current State
- Current focus
- Last meaningful session

## Active Tasks
- Task 1
- Task 2

## Blockers
- Blocker 1
- Blocker 2

## Active Decisions
- Decision 1
- Decision 2

## Memory Updates Made
- PROJECT.md updated
- DECISIONS.md updated

## Next Action
- Exact next step for the next session or worker
```

## Memory Bank Structure

```
memory/
├── PROJECT.md       # Main memory (Quick Reference + Overview + History)
├── DECISIONS.md    # Decision log with rationale
├── MEETINGS.md     # Meeting notes
├── GLOSSARY.md     # Project terminology
├── context/        # Technical details
│   ├── stack.md
│   ├── architecture.md
│   ├── conventions.md
│   ├── workflows.md
│   └── environments.md
└── docs/          # Documentation
    ├── README.md
    ├── API.md
    └── DEPLOYMENT.md
```

## Quick Reference

| Action | Memory Update |
|--------|---------------|
| Start session | Read PROJECT.md + DECISIONS.md |
| Make decision | Add to DECISIONS.md |
| Complete task | Mark in PROJECT.md tasks |
| End session | Add session history entry |

## Rules

- If memory conflicts with the codebase, call out the mismatch instead of silently trusting one side.
- The next action must be concrete enough that another AI worker can resume immediately.

---

*Memory Bank Skill v1.0.0*
