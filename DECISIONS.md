---
name: decisions-log
description: Template for tracking architectural and significant decisions
version: 1.0.0
created: 2026-04-07
---

# Decisions Log

> All significant architectural and technical decisions should be documented here with full rationale.

---

## How to Use This Log

When making a significant decision:
1. Create a new entry with auto-incremented ID (D001, D002, etc.)
2. Fill in all sections
3. If deprecated later, update status and add replacement reference

---

## Decision Template

```markdown
### DXXX - YYYY-MM-DD: [Decision Title]

**Status**: Active / Deprecated / Superseded
**Made By**: Name/Team
**Related**: DXXX (if related to other decisions)

**Decision**: What was decided
**Context**: Why this decision needed to be made

**Alternatives Considered**:
| Alternative | Pros | Cons | Why Rejected |
|-------------|------|------|--------------|
| Option A | ... | ... | ... |
| Option B | ... | ... | ... |
| Option C (Chosen) | ... | ... | ... |

**Consequences**:
- Positive: What benefits this brings
- Negative: What trade-offs or technical debt this introduces

**Implementation**: How this was/should be implemented

**Status History**:
- YYYY-MM-DD: Active - Initial decision
```

---

## Active Decisions

### D000 - 2026-04-08: Use Skill Router As The Fresh-Project Entry Point

**Status**: Active
**Made By**: codex
**Related**:

**Decision**: `$skill-router` should bootstrap `./memory/` automatically when a project has neither `memory/PROJECT.md` nor `PROJECT.md`.

**Context**: The template should record project-specific work from the first skill invocation without making the user perform a separate manual memory setup step.

**Alternatives Considered**:
| Alternative | Pros | Cons | Why Rejected |
|-------------|------|------|--------------|
| Manual copy step only | Explicit and simple | Easy to skip, breaks continuity in new projects | Too much friction |
| `memory-bank` only bootstraps | Keeps router pure | First user call may still start without memory | Not enough coverage |
| `skill-router` as entry point (Chosen) | Natural first call, guarantees memory exists before routing | Adds a small bootstrap side effect to routing | Best fit for the desired workflow |

**Consequences**:
- **Positive**: New projects get `memory/` automatically and start recording session history immediately.
- **Negative**: Router logic now includes one setup responsibility in addition to classification.

**Implementation**: Added `scripts/bootstrap-memory.sh`, wrapper scripts inside `skill-router` and `memory-bank`, and updated docs plus entry skill instructions.

### D001 - YYYY-MM-DD: [Title]

**Status**: Active
**Made By**: 
**Related**: 

**Decision**: 

**Context**: 

**Alternatives Considered**:
| Alternative | Pros | Cons | Why Rejected |
|-------------|------|------|--------------|
| | | | |

**Consequences**:
- **Positive**: 
- **Negative**: 

**Implementation**: 

---

## Deprecated Decisions

### DXXX - YYYY-MM-DD: [Title]

**Status**: Deprecated on YYYY-MM-DD
**Replaced By**: DYYY
**Original Date**: YYYY-MM-DD

**Original Decision**: 

**Why Deprecated**: 

---

## Quick Reference

| ID | Decision | Date | Status |
|----|----------|------|--------|
| D001 | | YYYY-MM-DD | Active |
| D002 | | YYYY-MM-DD | Active |
| D003 | | YYYY-MM-DD | Deprecated |

---

*Last updated: YYYY-MM-DD*
