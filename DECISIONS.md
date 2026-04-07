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
