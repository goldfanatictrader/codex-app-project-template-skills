---
name: experiment
description: Comprehensive memory bank template - long-term project memory for AI-assisted development
version: 2.0.0
created: 2026-04-07
last_updated: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - template
  - memory-bank
  - long-term-memory
tags:
  - project-template
  - memory-bank
  - long-term-memory
  - comprehensive
---

# Project Memory Bank

> **Quick Reference Card** - Start here for current state

| Item | Value |
|------|-------|
| Project | experiment |
| Phase | Template |
| Last Session | 2026-04-08 |
| Current Focus | Make skill-router the memory bootstrap entry point |
| Next Action | Commit and push the automatic memory bootstrap workflow |

---

## Quick Links

- [Template Files](./) - Copy this repository into new projects as `memory/`
- [Decisions](./DECISIONS.md) - Decision log
- [Meetings](./MEETINGS.md) - Meeting notes
- [Glossary](./GLOSSARY.md) - Terminology
- [Stack](./context/stack.md) - Technology stack
- [Architecture](./context/architecture.md) - System design
- [Conventions](./context/conventions.md) - Coding standards

---

## Project Overview

### Basic Information

| Field | Value |
|-------|-------|
| **Project Name** | experiment |
| **Type** | Template / Memory Bank System |
| **Description** | Comprehensive memory bank template for AI-assisted development |
| **Problem Solved** | Enables AI agents to maintain long-term context across sessions |
| **Target Users** | Developers using AI coding assistants |
| **Phase** | Template (ready to copy to new projects) |
| **Status** | Active |

### Purpose

This is a **template project** demonstrating the memory bank pattern. The `memory/` folder contains a complete, reusable template that can be copied to any new project.

### Template Contents

The memory bank template includes:

| File | Purpose |
|------|---------|
| `TEMPLATE.md` | Complete template with all sections |
| `DECISIONS.md` | Decision log template |
| `MEETINGS.md` | Meeting notes template |
| `GLOSSARY.md` | Glossary template |
| `context/stack.md` | Technology stack template |
| `context/architecture.md` | Architecture template |
| `context/conventions.md` | Coding conventions template |
| `context/workflows.md` | Workflows template |
| `context/environments.md` | Environments template |
| `docs/*.md` | Documentation templates |

---

## Session History

| Date | Session # | Agent | Focus | Outcome |
|------|-----------|-------|-------|---------|
| 2026-04-07 | 1 | codex | Initial template creation | Created comprehensive memory bank template |
| 2026-04-08 | 2 | codex | Make skill-router bootstrap memory automatically | Added bootstrap scripts, updated entry skills, and aligned docs for project-first memory creation |

### Detailed Sessions

#### Session #1 - 2026-04-07

- **Agent**: codex
- **Duration**: ~1 hour
- **Focus**: Create comprehensive memory bank template
- **Work Done**:
  - Created `TEMPLATE.md` with all sections
  - Created `DECISIONS.md` for tracking decisions
  - Created `MEETINGS.md` for meeting notes
  - Created `GLOSSARY.md` for terminology
  - Created `context/stack.md` for tech stack
  - Created `context/architecture.md` for system design
  - Created `context/conventions.md` for coding standards
  - Created `context/workflows.md` for CI/CD and processes
  - Created `context/environments.md` for environment config
  - Created documentation templates in `docs/`
  - Updated `AGENTS.md` with complete instructions
- **Decisions Made**:
  - Created comprehensive template with all sections for true long-term memory
  - Used markdown with YAML frontmatter for metadata
  - Included templates for decisions, meetings, and glossary
- **Next Steps**: Copy template to new projects as needed

#### Session #2 - 2026-04-08

- **Agent**: codex
- **Duration**: ~1 hour
- **Focus**: Turn `skill-router` into the first-call entry point for new projects
- **Work Done**:
  - Added `scripts/bootstrap-memory.sh` to copy the template into `./memory/`
  - Added wrapper bootstrap scripts under `skills/skill-router/` and `skills/memory-bank/`
  - Updated `skill-router`, `memory-bank`, and `project-developer` to bootstrap project memory automatically when missing
  - Updated agent metadata and top-level docs to describe the new entry-point behavior
  - Verified skill structure and tested bootstrap against a temporary empty project
- **Decisions Made**:
  - `skill-router` is now the preferred first call for fresh projects
  - Bootstrap should initialize a fresh `memory/PROJECT.md` from `TEMPLATE.md`, not from the template repo's own `PROJECT.md`
- **Next Steps**: Commit and push the automatic memory bootstrap workflow

---

## Decisions Log

| ID | Date | Decision | Rationale | Status |
|----|------|----------|-----------|--------|
| D001 | 2026-04-07 | Create comprehensive memory bank v2.0 | Previous template was too basic for true long-term memory | Active |
| D002 | 2026-04-07 | Separate decision log from main project file | Decisions need their own file for clarity and searchability | Active |

---

## Template Structure

```
memory/
├── TEMPLATE.md              # Main template (copy this)
├── DECISIONS.md             # Decision log template
├── MEETINGS.md              # Meeting notes template
├── GLOSSARY.md              # Glossary template
├── context/
│   ├── stack.md             # Tech stack
│   ├── architecture.md      # System design
│   ├── conventions.md       # Coding standards
│   ├── workflows.md         # CI/CD & processes
│   └── environments.md       # Environment config
└── docs/
    ├── README.md           # Project README template
    ├── API.md              # API docs template
    ├── DEPLOYMENT.md       # Deployment guide template
    └── ONBOARDING.md       # Onboarding guide template
```

---

## How to Use This Template

### For New Projects

1. **Copy the memory folder:**
   ```bash
   cp -r memory/ /path/to/new-project/memory/
   ```

2. **Rename template to project:**
   ```bash
   cd /path/to/new-project
   mv memory/TEMPLATE.md memory/PROJECT.md
   ```

3. **Customize PROJECT.md:**
   - Update frontmatter with project name
   - Fill in project overview
   - Add initial tasks
   - Set up session history

4. **Set up context files:**
   - Copy relevant context templates
   - Fill in technology details
   - Document architecture

### For Existing Projects

1. Read `memory/PROJECT.md` first
2. Check context files for technical details
3. Review decisions log for rationale
4. Update memory after any significant work

---

## Session Continuation Guide

### For AI Agents

#### Starting Fresh
1. Read `memory/PROJECT.md` when working from a project root, or `PROJECT.md` when working inside the memory repository directly
2. Check `memory/context/` or `context/` for technical details
3. Review `memory/docs/` or `docs/` for documentation
4. Check `memory/DECISIONS.md` or `DECISIONS.md` for rationale
5. Explore codebase structure
6. Ask clarifying questions if needed

#### Returning Session
1. Read **Quick Reference Card** at top
2. Review **Session History** section
3. Check **Decisions Log**
4. Review any **Tasks** or **Blockers**
5. Continue from **Next Steps**

#### Before Ending Session (MANDATORY)
1. Add entry to **Session History**
2. Add any new **Decisions** to DECISIONS.md
3. Update **Task** status
4. Update **Quick Reference Card**

---

## Knowledge Base

### What We Know

- This is a comprehensive memory bank template
- Designed for true long-term memory across AI sessions
- Includes separate files for decisions, meetings, glossary
- Has detailed context files for technical documentation
- Templates are reusable for any project type

### What This Template Includes

- Quick Reference Card for fast orientation
- Complete project overview section
- Detailed session history with timestamps
- Decision log with rationale
- Task tracking with sprint management
- Known issues and risks
- Learnings and important notes
- Meeting notes template
- Comprehensive context files
- Documentation templates

### Template Copy Instructions

```bash
# Copy template to new project
cp -r memory/ /path/to/new-project/memory/

# Rename template file
cd /path/to/new-project
mv memory/TEMPLATE.md memory/PROJECT.md

# Customize the project file
# Update frontmatter, overview, and initial state
```

---

## Open Tasks

- [ ] Template is complete and ready for use
- [ ] Copy to actual projects as needed

---

## Learnings & Notes

### Key Learnings

| Date | Learning | Context |
|------|----------|---------|
| 2026-04-07 | AI needs structured memory to maintain context | Created comprehensive template to solve this |
| 2026-04-07 | Separating decisions helps maintain rationale | Created DECISIONS.md for this purpose |

### Important Notes

- This is a TEMPLATE - customize for each project
- Always update memory before ending session
- Include "why" not just "what" in decisions

---

## Resources

### Documentation Links
- [TEMPLATE.md](./TEMPLATE.md) - Main template
- [DECISIONS.md](./DECISIONS.md) - Decision template
- [MEETINGS.md](./MEETINGS.md) - Meeting template
- [GLOSSARY.md](./GLOSSARY.md) - Glossary template
- [Stack](./context/stack.md) - Tech stack template
- [Architecture](./context/architecture.md) - Architecture template
- [Conventions](./context/conventions.md) - Conventions template
- [Workflows](./context/workflows.md) - Workflows template
- [Environments](./context/environments.md) - Environments template

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| v2.0.0 | 2026-04-07 | Complete rewrite with comprehensive sections, separate decision/meeting files |
| v1.0.0 | 2026-04-07 | Initial basic template |

---

*Last updated: 2026-04-07*
*Memory Bank Template v2.0.0*
