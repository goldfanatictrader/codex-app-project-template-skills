---
name: memory-bank-template
description: Comprehensive memory bank template for long-term project memory - complete with all sections for AI-assisted development continuity
version: 2.0.0
created: 2026-04-07
updated: 2026-04-07
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
  - reusable
  - comprehensive
---

# Project Memory Bank - Complete Template

> **IMPORTANT**: This `memory/` folder is a **self-contained GitHub repository**.
> Clone or copy this folder into any project for long-term AI memory.

---

## GitHub Repository Structure

```
memory/                     ← THIS IS A GITHUB REPO
├── AGENTS.md              # Codex repo instructions
├── CODEX.md               # Codex usage guide
├── QUICKSTART.md          # Codex quick start
├── skills/                # Codex skills
│   ├── memory-bank/
│   ├── coding-assistant/
│   └── project-developer/
├── PROJECT.md              # Main memory (rename from TEMPLATE.md)
├── TEMPLATE.md            # This template
├── DECISIONS.md           # Decision log
├── MEETINGS.md            # Meeting notes
├── GLOSSARY.md            # Terminology
├── context/               # Technical details
│   ├── stack.md
│   ├── architecture.md
│   ├── conventions.md
│   ├── workflows.md
│   └── environments.md
└── docs/                  # Documentation
    ├── README.md
    ├── API.md
    ├── DEPLOYMENT.md
    └── ONBOARDING.md
```

---

## How to Use This Template

### Option 1: Clone as Git Submodule
```bash
# In your project root:
git submodule add https://github.com/YOUR_USERNAME/memory-bank.git memory
cd memory
mv TEMPLATE.md PROJECT.md
# Edit PROJECT.md with your project details
```

### Option 2: Copy Folder
```bash
# Copy to new project
cp -r memory/ /path/to/new-project/memory/
cd /path/to/new-project/memory
mv TEMPLATE.md PROJECT.md
# Edit PROJECT.md with your project details
```

### Option 3: Initialize Fresh
```bash
# Create memory directory
mkdir memory
cd memory
# Copy files from template repo
# Start fresh with PROJECT.md
```

---

## Quick Reference Card

| Item | Value |
|------|-------|
| Project | `[PROJECT_NAME]` |
| Phase | Planning / In Progress / Maintenance / Archived |
| Last Session | YYYY-MM-DD |
| Current Focus | Brief description |
| Next Action | What to do next |

---

## 1. Project Overview

### 1.1 Basic Information

| Field | Value |
|-------|-------|
| **Project Name** | |
| **Type** | Web App / API / CLI / Library / Mobile / Desktop / Other |
| **Description** | One-sentence description |
| **Problem Solved** | What problem does this project solve? |
| **Target Users** | Who is this for? |
| **Phase** | Planning → Development → Testing → Production → Maintenance |
| **Status** | Active / On Hold / Abandoned / Completed |

### 1.2 Goals & Objectives

#### Primary Goals
- [ ] Goal 1
- [ ] Goal 2
- [ ] Goal 3

#### Secondary Goals
- [ ] Goal 1
- [ ] Goal 2

### 1.3 Constraints

| Type | Constraint |
|------|------------|
| **Timeline** | e.g., "Must be completed by YYYY-MM-DD" |
| **Budget** | e.g., "$0" (open source) / specific budget |
| **Technical** | e.g., "Must work offline", "Must support IE11" |
| **Regulatory** | e.g., "GDPR compliant", "HIPAA" |
| **Resource** | e.g., "1 developer", "2-person team" |

### 1.4 Success Criteria

How do we know the project is successful?
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

---

## 2. Project State

### 2.1 Current Status

```
Phase: [Planning/Development/Testing/Production/Maintenance]
Progress: [X%]
Health: [🟢 Healthy / 🟡 Warning / 🔴 Critical]
Last Activity: YYYY-MM-DD
```

### 2.2 Key Metrics

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| Features Complete | X/Y | Y | 🟢 |
| Test Coverage | X% | 80% | 🟡 |
| Documentation | X% | 100% | 🔴 |
| Bugs Open | X | 0 | 🟡 |

### 2.3 Blockers & Risks

#### Active Blockers
| Blocker | Impact | Owner | Status |
|---------|--------|-------|--------|
| | | | |

#### Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| | | | |

---

## 3. Project Directory Structure

```
[PROJECT_NAME]/              ← YOUR PROJECT ROOT
├── src/                    # Source code
├── tests/                  # Test files
├── docs/                   # Project docs (outside memory)
├── memory/                 # ← COPY OR CLONE THIS FOLDER
│   ├── PROJECT.md          # Main memory (rename from TEMPLATE.md)
│   ├── TEMPLATE.md         # Template (keep for reference)
│   ├── DECISIONS.md        # Decision log
│   ├── MEETINGS.md         # Meeting notes
│   ├── GLOSSARY.md         # Project terminology
│   ├── context/            # Technical contexts
│   │   ├── stack.md        # Technology stack
│   │   ├── architecture.md # System architecture
│   │   ├── conventions.md  # Coding conventions
│   │   ├── workflows.md     # CI/CD, workflows
│   │   └── environments.md  # Environment config
│   └── docs/               # Documentation templates
│       ├── README.md        # Project README
│       ├── API.md          # API documentation
│       ├── DEPLOYMENT.md   # Deployment guide
│       └── ONBOARDING.md   # Onboarding guide
├── .env.example            # Environment template
└── AGENTS.md               # AI agent instructions (project root)
```
[PROJECT_NAME]/
├── src/                    # Source code
├── tests/                  # Test files
├── docs/                   # Documentation
├── scripts/                # Build/utility scripts
├── config/                 # Configuration files
├── assets/                 # Static assets
├── memory/                 # THIS MEMORY BANK
│   ├── PROJECT.md          # Main memory (this file)
│   ├── TEMPLATE.md         # Template (keep for new projects)
│   ├── DECISIONS.md        # Decision log
│   ├── MEETINGS.md         # Meeting notes
│   ├── GLOSSARY.md         # Project terminology
│   ├── context/            # Detailed contexts
│   │   ├── stack.md        # Technology stack
│   │   ├── architecture.md # System architecture
│   │   ├── conventions.md  # Coding conventions
│   │   ├── workflows.md     # CI/CD, development workflows
│   │   └── environments.md  # Dev/Staging/Prod setup
│   └── docs/               # Additional documentation
│       ├── README.md       # Project README
│       ├── API.md          # API documentation
│       ├── DEPLOYMENT.md   # Deployment guide
│       └── ONBOARDING.md   # New member onboarding
├── .env.example            # Environment template
├── README.md               # Link to docs/README.md
└── AGENTS.md               # AI agent instructions
```

---

## 4. Technology Stack

### 4.1 Core Technologies

| Category | Technology | Version | Purpose |
|----------|------------|---------|---------|
| **Language** | | | |
| **Runtime** | | | |
| **Framework** | | | |
| **Database** | | | |
| **Cache** | | | |
| **Queue** | | | |
| **Search** | | | |

### 4.2 Dependencies

#### Production Dependencies
| Package | Version | Purpose | Notes |
|---------|---------|---------|-------|
| | | | |

#### Development Dependencies
| Package | Version | Purpose | Notes |
|---------|---------|---------|-------|
| | | | |

### 4.3 Infrastructure

| Component | Service | Purpose |
|-----------|---------|---------|
| **Hosting** | | |
| **CDN** | | |
| **DNS** | | |
| **SSL** | | |
| **Monitoring** | | |
| **Logging** | | |
| **Error Tracking** | | |

### 4.4 Environment Configuration

#### Development
```
KEY=value
```

#### Staging
```
KEY=value
```

#### Production
```
KEY=value
```

---

## 5. Session History

### How to Read This Log

This log tracks all significant work sessions. When continuing work, start here to understand what's been done.

| Date | Session # | Agent | Focus | Outcome |
|------|-----------|-------|-------|---------|
| YYYY-MM-DD | 1 | codex | Initial setup | Project scaffold created |
| YYYY-MM-DD | 2 | codex | Feature X | Completed, pending review |

### Detailed Sessions

#### Session #1 - YYYY-MM-DD
- **Agent**: codex
- **Duration**: ~X hours
- **Focus**: Initial project setup
- **Work Done**:
  - Created project structure
  - Set up initial dependencies
  - Documented architecture
- **Decisions Made**:
  - Chose TypeScript over JavaScript
  - Used FastAPI instead of Express
- **Blockers**: None
- **Next Steps**: Implement user authentication

#### Session #2 - YYYY-MM-DD
- **Agent**: codex
- **Duration**: ~X hours
- **Focus**: User authentication module
- **Work Done**:
  - Implemented JWT auth
  - Created user model
  - Added login/logout endpoints
- **Decisions Made**:
  - Use bcrypt for password hashing
  - JWT expiry: 24 hours
- **Blockers**: None
- **Next Steps**: Add user registration endpoint

---

## 6. Decisions Log

> **Important**: All significant decisions must be documented here with rationale.

### Active Decisions

| ID | Date | Decision | Rationale | Status |
|----|------|----------|-----------|--------|
| D001 | YYYY-MM-DD | Use PostgreSQL over MongoDB | Better for relational data, ACID compliance | Active |
| D002 | YYYY-MM-DD | TypeScript strict mode enabled | Catch errors early, better IDE support | Active |

### Deprecated Decisions

| ID | Date | Decision | Rationale | Deprecated | Replacement |
|----|------|----------|-----------|------------|-------------|
| D003 | YYYY-MM-DD | Initially chose MySQL | Familiarity | YYYY-MM-DD | D001 (PostgreSQL) |

### Decision Template

```
### DXXX - YYYY-MM-DD: [Decision Title]

**Decision**: What was decided
**Context**: Why this came up
**Alternatives Considered**:
  - Option A: [brief description] - Rejected because...
  - Option B: [brief description] - Chosen because...
**Outcome**: Expected impact
**Status**: Active
```

---

## 7. Architecture

### 7.1 System Overview

[Description of the overall system architecture]

### 7.2 High-Level Diagram

```
┌─────────────────────────────────────────────────────────┐
│                      Client Layer                        │
│  [Web App]  [Mobile]  [API Clients]                     │
└─────────────────────────┬───────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────┐
│                      API Layer                           │
│  [REST API]  [GraphQL]  [WebSocket]                     │
└─────────────────────────┬───────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────┐
│                    Service Layer                         │
│  [Auth Service]  [Business Logic]  [Workers]            │
└─────────┬───────────────────┬───────────────────────────┘
          │                   │
┌─────────▼─────────┐ ┌───────▼───────────────────────────┐
│   Data Layer      │ │        External Services           │
│  [PostgreSQL]     │ │  [Email]  [Payments]  [Analytics]  │
│  [Redis Cache]    │ │                                    │
└───────────────────┘ └────────────────────────────────────┘
```

### 7.3 Component Details

#### Component: [Name]
- **Purpose**: What this component does
- **Location**: File path or service name
- **Dependencies**: Other components/services
- **Public API**:
  - `endpoint/method`: Description

### 7.4 Data Models

#### User
```typescript
interface User {
  id: string;
  email: string;
  name: string;
  createdAt: Date;
  updatedAt: Date;
}
```

### 7.5 Data Flow

1. User sends request
2. [What happens]
3. [What happens]
4. Response returned

### 7.6 External Integrations

| Service | Purpose | Auth Method | Status |
|---------|---------|-------------|--------|
| | | | |

---

## 8. Features & Functionality

### 8.1 Implemented Features

| Feature | Status | Location | Notes |
|---------|--------|----------|-------|
| User Authentication | ✅ Done | src/auth/ | JWT-based |
| User Profile | ✅ Done | src/users/ | CRUD operations |
| File Upload | 🚧 WIP | src/uploads/ | S3 integration |
| Email Notifications | 📋 Planned | | |

### 8.2 Feature Details

#### Feature: [Name]

**Description**: What it does
**Status**: ✅ Done / 🚧 In Progress / 📋 Planned / ❌ Cancelled
**Priority**: High / Medium / Low
**Location**: File/path

**User Story**: As a [user type], I want [goal] so that [benefit].

**Acceptance Criteria**:
- [ ] Criterion 1
- [ ] Criterion 2

**Implementation Notes**:
- Note 1
- Note 2

---

## 9. Tasks & Roadmap

### 9.1 Current Sprint

**Sprint**: Sprint #X
**Duration**: YYYY-MM-DD to YYYY-MM-DD
**Goal**: [Sprint goal]

#### Sprint Tasks

| ID | Task | Status | Assignee | Notes |
|----|------|--------|----------|-------|
| S1 | Task name | 🟢 Todo / 🟡 In Progress / ✅ Done | | |
| S2 | Task name | 🟢 Todo | | |

### 9.2 Backlog

| Priority | Task | Description |
|----------|------|-------------|
| High | | |
| Medium | | |
| Low | | |

### 9.3 Roadmap

```
[████████████] ████░░░░░░░░░░░ 60% - Phase 1: Core Features
░░░░░░░░░░░░░░░░░░░░░░░░░░░░ 0% - Phase 2: Advanced Features
░░░░░░░░░░░░░░░░░░░░░░░░░░░░ 0% - Phase 3: Polish & Launch
```

| Phase | Target | Features |
|-------|--------|----------|
| Phase 1 | YYYY-Q1 | Core functionality |
| Phase 2 | YYYY-Q2 | Advanced features |
| Phase 3 | YYYY-Q3 | Launch & polish |

---

## 10. Known Issues

### 10.1 Open Issues

| Issue | Severity | Status | Workaround |
|-------|----------|--------|------------|
| Bug in export | Medium | Open | Export one by one |

### 10.2 Resolved Issues

| Issue | Resolved | Solution |
|-------|----------|----------|
| Memory leak in worker | YYYY-MM-DD | Updated to use connection pool |

---

## 11. Learnings & Notes

### 11.1 Key Learnings

Things we learned while building this project:

| Date | Learning | Context |
|------|----------|---------|
| YYYY-MM-DD | Lesson learned | Situation/outcome |

### 11.2 Important Notes

> **Warning**: Don't use approach X because...
> 
> **Note**: Library Y has breaking change in v2.0

### 11.3 Gotchas

- ❌ Don't do X, it causes Y
- ❌ Library Z version 1.2 is broken, use 1.1 or 1.3
- ❌ API endpoint /api/v1/deprecated - use /api/v2 instead

---

## 12. Meeting Notes

See [MEETINGS.md](./MEETINGS.md) for detailed meeting notes.

### Recent Meetings

| Date | Meeting | Key Decisions | Action Items |
|------|---------|---------------|--------------|
| YYYY-MM-DD | Sprint Planning | Q3 focus areas | AI to document decisions |

---

## 13. Team & Contacts

### Core Team

| Name | Role | Responsibility |
|------|------|-----------------|
| | Lead Developer | Architecture, code review |
| | Designer | UI/UX decisions |

### External Contacts

| Name | Role | Contact | Purpose |
|------|------|---------|---------|
| | | | |

---

## 14. Glossary

See [GLOSSARY.md](./GLOSSARY.md) for project-specific terminology.

### Quick Terms

| Term | Definition |
|------|------------|
| | |

---

## 15. Resources & Links

### Documentation
- [Internal Wiki](link)
- [API Documentation](./docs/API.md)
- [Deployment Guide](./docs/DEPLOYMENT.md)

### External Resources
- [Official Docs](link)
- [Related Projects](link)
- [Tutorials](link)

### Monitoring
- [Production Dashboard](link)
- [Error Tracking](link)
- [Logs](link)

---

## 16. Session Continuation Guide

### For AI Agents

#### Starting Fresh (First Session)
1. Read this entire `PROJECT.md`
2. Check `context/` folder for technical details
3. Review `docs/` for user documentation
4. Check `DECISIONS.md` for rationale
5. Explore codebase structure
6. Ask clarifying questions if needed

#### Returning Session
1. Read "Quick Reference Card" at top
2. Review "Session History" section
3. Check "Current Sprint" in tasks
4. Review any new decisions since last session
5. Continue from "Next Steps" or "Open Tasks"

#### Before Ending Session
**MUST update this file with:**
- [ ] New entry in Session History
- [ ] Any new decisions in DECISIONS.md
- [ ] Updated task status
- [ ] New action items if any
- [ ] Next steps for next session

**ALSO consider:**
- [ ] Update meeting notes if discussed
- [ ] Add to learnings if discovered something
- [ ] Update blockers/risk section if changed

---

## Appendix A: Command Reference

| Command | Purpose |
|---------|---------|
| `npm install` | Install dependencies |
| `npm run dev` | Start development server |
| `npm run build` | Build for production |
| `npm test` | Run tests |
| `npm run lint` | Lint code |

## Appendix B: Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| NODE_ENV | Yes | development | Environment |
| DATABASE_URL | Yes | | PostgreSQL connection |
| JWT_SECRET | Yes | | JWT signing secret |

## Appendix C: Security

- **Authentication**: JWT with 24h expiry
- **Password Policy**: Minimum 8 chars, bcrypt hashing
- **API Security**: Rate limiting, CORS configured
- **Secrets**: Never commit .env, use vault in production

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| v2.0.0 | 2026-04-07 | Complete rewrite with comprehensive sections |
| v1.0.0 | 2026-04-07 | Initial template |

---

*Last updated: YYYY-MM-DD*
*Memory bank template v2.0.0*
