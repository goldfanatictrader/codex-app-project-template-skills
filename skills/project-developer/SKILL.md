---
name: project-developer
description: Combined skill for project development - integrates memory bank workflow with coding best practices for complete AI-assisted development sessions
version: 1.0.0
created: 2026-04-07
author: User
license: MIT
compatibility:
  - codex app
categories:
  - development
  - memory
  - coding
tags:
  - project-development
  - memory-bank
  - coding-best-practices
  - session-workflow
---

# Project Developer Skill

Complete workflow skill that combines memory bank integration with coding best practices.

## Session Workflow

### STEP 1: Session Start (MANDATORY - DO THIS FIRST)

**Read project memory before ANYTHING else:**

```
1. Check for memory bank locations (in order):
   - ./memory/PROJECT.md
   - ./PROJECT.md
   - ./docs/memory/PROJECT.md

2. Read PROJECT.md and extract:
   - Quick Reference Card (current state)
   - Last session date
   - Active tasks
   - Blockers
   - Next steps

3. Check DECISIONS.md for:
   - Recent decisions
   - Architectural rationale
   - Technology choices

4. Review relevant context files:
   - context/conventions.md (coding style)
   - context/stack.md (tech stack)
   - context/architecture.md (if needed)
```

### STEP 2: Understand & Plan

**Before implementing:**
- [ ] Understand the problem completely
- [ ] Ask clarifying questions if needed
- [ ] Plan the approach
- [ ] Consider existing patterns

### STEP 3: Implement

**Follow coding conventions:**
- Use consistent naming (check conventions.md)
- Write small, focused functions
- Add explicit types
- Handle errors explicitly
- Write tests

### STEP 4: Verify

**Before completing:**
- [ ] Run lint check
- [ ] Run type check
- [ ] Run tests
- [ ] Fix any issues

### STEP 5: Session End (MANDATORY - DO THIS BEFORE ENDING)

**Update memory bank:**

1. **Session History** - Add new entry:
```markdown
#### Session #X - YYYY-MM-DD
- **Agent**: codex
- **Duration**: ~X hours
- **Focus**: What was worked on
- **Work Done**:
  - Item 1
  - Item 2
- **Decisions Made**: Any new decisions with rationale
- **Blockers**: Any blockers encountered
- **Next Steps**: Clear next actions
```

2. **Decisions Log** - Add if new decisions:
```markdown
### DXXX - YYYY-MM-DD: [Decision Title]
**Decision**: What was decided
**Rationale**: Why this choice
**Status**: Active
```

3. **Tasks** - Update status:
- Mark completed tasks as ✅ Done
- Add new tasks discovered
- Note blockers resolved

4. **Quick Reference Card** - Update:
```markdown
| Item | Value |
|------|-------|
| Last Session | YYYY-MM-DD |
| Current Focus | Brief summary |
| Next Action | Clear next step |
```

## Key Rules

### ALWAYS

✅ Read memory at session start
✅ Update memory at session end
✅ Follow project conventions
✅ Write tests for new code
✅ Handle errors explicitly
✅ Document decisions with rationale
✅ Provide clear next steps

### NEVER

❌ Start implementing without reading memory
❌ End session without updating memory
❌ Leave TODO comments (create tasks instead)
❌ Hardcode values (use constants)
❌ Write code without error handling
❌ Skip lint/type check before finishing

## Memory Bank Structure

```
memory/
├── PROJECT.md           # Main memory (Quick Reference + History)
├── DECISIONS.md        # Decision log
├── MEETINGS.md         # Meeting notes
├── GLOSSARY.md         # Terminology
├── context/           # Technical details
│   ├── stack.md        # Technology stack
│   ├── architecture.md # System architecture
│   ├── conventions.md # Coding conventions
│   ├── workflows.md   # CI/CD & processes
│   └── environments.md # Environment config
└── docs/              # Documentation
    ├── README.md
    ├── API.md
    ├── DEPLOYMENT.md
    └── ONBOARDING.md
```

## Quick Reference

| Action | What to Do |
|--------|------------|
| Start session | Read PROJECT.md + DECISIONS.md |
| Make decision | Document in DECISIONS.md with why |
| Complete task | Update task in PROJECT.md |
| Find bug | Document in Known Issues |
| End session | Add session history + update Quick Reference |

## Example Session

```
User: "Add user profile page"

AI Response:
1. [Reads memory/PROJECT.md]
2. [Checks existing patterns in codebase]
3. [Implements profile page following conventions]
4. [Writes tests]
5. [Runs lint + type check]
6. [Updates memory/PROJECT.md with new session]
7. [Response: "Done! Added user profile page. Next: Add edit functionality"]
```

---

*Project Developer Skill v1.0.0*
