---
name: backlog-management
description: Backlog Management skill with GitHub integration - AI creates and manages project backlog, GitHub Issues, Projects, and milestones
version: 1.0.0
created: 2026-04-07
author: User
license: MIT
compatibility:
  - codex app
categories:
  - backlog
  - github
  - project-management
  - sprint
tags:
  - backlog
  - github-issues
  - github-projects
  - sprint
  - agile
---

# Backlog Management Skill

## Overview

AI manages the complete backlog with GitHub integration. Creates Issues, Projects, and Milestones automatically.

## GitHub Setup Workflow

### Step 1: Authenticate
```bash
# Check if authenticated
gh auth status

# If not authenticated, prompt user:
# "Please authenticate with GitHub:
#  1. Run: gh auth login
#  2. Or set token: gh auth token YOUR_TOKEN
#  3. Or set GH_TOKEN environment variable"
```

### Step 2: Initialize Project
```bash
# Create GitHub Project (Beta)
gh project create --title "Project Name" --owner "username" --template "Automatic"

# Or create classic project board
gh api repos/{owner}/{repo}/projects --field name="Project Name"
```

### Step 3: Create Milestones (Sprints)
```bash
# Create milestones for sprints
gh issue milestone create --title "Sprint 1" --description "Foundation & Auth" --due "2024-01-15"
gh issue milestone create --title "Sprint 2" --description "Core Features" --due "2024-02-15"
gh issue milestone create --title "Sprint 3" --description "Advanced Features" --due "2024-03-15"
```

## Backlog Structure

```
BACKLOG
├── 🔴 P0 - Critical (Must Have)
│   ├── [Issue] User Authentication
│   ├── [Issue] Data Security
│   └── [Issue] Core Functionality
│
├── 🟠 P1 - High (Should Have)
│   ├── [Issue] Dashboard
│   ├── [Issue] User Profile
│   └── [Issue] Notifications
│
├── 🟡 P2 - Medium (Could Have)
│   ├── [Issue] Export Feature
│   ├── [Issue] Advanced Search
│   └── [Issue] API Integration
│
└── ⚪ P3 - Low (Nice to Have)
    ├── [Issue] Dark Mode
    ├── [Issue] Mobile App
    └── [Issue] AI Features
```

## Issue Creation

### Feature Issue Template
```markdown
## Issue: [Feature Name]

**Type**: Feature
**Priority**: P0/P1/P2/P3
**Labels**: feature, frontend/backend, urgent
**Milestone**: Sprint X

### Description
[What this feature does]

### User Story
As a [user], I want [action] so that [benefit].

### Acceptance Criteria
- [ ] Given [context] when [action] then [outcome]
- [ ] Given [context] when [action] then [outcome]

### Technical Notes
- [API endpoints needed]
- [Database changes]
- [Dependencies]

### Tasks
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

### Definition of Done
- [ ] Code complete
- [ ] Unit tests passing
- [ ] Code reviewed
- [ ] Deployed to staging
- [ ] QA sign-off
```

### Bug Issue Template
```markdown
## Issue: [Bug Title]

**Type**: Bug
**Priority**: P0/P1/P2/P3
**Labels**: bug, urgent
**Milestone**: Current Sprint

### Description
[What the bug is]

### Steps to Reproduce
1. Go to '[location]'
2. Click on '[action]'
3. See error

### Expected Behavior
[What should happen]

### Actual Behavior
[What actually happens]

### Screenshots/Videos
[Attach evidence]

### Environment
- Browser:
- OS:
- Version:

### Technical Notes
[Debugging info if known]
```

### Task Issue Template
```markdown
## Issue: [Task Title]

**Type**: Task
**Labels**: task, tech-debt
**Milestone**: Sprint X

### Description
[What needs to be done]

### Subtasks
- [ ] [Subtask 1]
- [ ] [Subtask 2]

### Time Estimate
[X hours/days]
```

## GitHub CLI Commands

### Issues
```bash
# Create issue
gh issue create \
  --title "User Authentication" \
  --body "$(cat <<'EOF'
## Description
Implement user authentication with JWT

## Acceptance Criteria
- [ ] User can register
- [ ] User can login
- [ ] User can logout
- [ ] JWT tokens are validated
EOF
)" \
  --label "feature" \
  --label "priority-high" \
  --milestone "Sprint 1"

# List issues
gh issue list --state open --milestone "Sprint 1"

# Update issue
gh issue edit 1 --add-label "in-progress" --assignee "@me"

# Close issue
gh issue close 1 --comment "Fixed in PR #42"
```

### Milestones
```bash
# Create milestone
gh issue milestone create \
  --title "Sprint 1" \
  --description "Foundation & Authentication" \
  --due "2024-01-31"

# List milestones
gh issue milestone list

# View milestone progress
gh issue list --milestone "Sprint 1"
```

### Projects
```bash
# Create project
gh project create --title "My Project" --owner "@me"

# Add issue to project
gh project item-add 1 --project "My Project"

# Set field value
gh project item-edit 1 --field "Status" --text "In Progress"
```

### Labels
```bash
# Create labels
gh label create "feature" --description "New feature" --color "36a64f"
gh label create "bug" --description "Bug fix" --color "d73a4a"
gh label create "priority-high" --description "High priority" --color "ff9900"
gh label create "P0" --description "Critical priority" --color "b60205"
gh label create "P1" --description "High priority" --color "ff9900"
gh label create "P2" --description "Medium priority" --color "fbca04"
gh label create "P3" --description "Low priority" --color "006b75"
gh label create "blocked" --description "Blocked" --color "e67e22"
```

## Sprint Planning Workflow

### 1. Review Backlog
```
1. List all open issues
2. Review priorities
3. Check dependencies
4. Identify sprint candidates
```

### 2. Capacity Planning
```
Team velocity: [X] points/sprint
Sprint duration: 2 weeks
Available capacity: [X] hours

Select issues until capacity reached
```

### 3. Sprint Creation
```bash
# Create sprint milestone
gh issue milestone create \
  --title "Sprint 1" \
  --description "Foundation & Auth" \
  --due "2024-02-01"

# Assign issues to sprint
gh issue edit ISSUE_NUMBER --milestone "Sprint 1"
```

### 4. Sprint Board Structure
```
TO DO | IN PROGRESS | IN REVIEW | DONE
------|--------------|---------- | -----
[ ]   | [ ]         | [ ]       | [ ]
[ ]   | [ ]         | [ ]       | [ ]
[ ]   | [ ]         | [ ]       | [ ]
```

## Automation Scripts

### Create Feature from Template
```bash
#!/bin/bash
# create-issue.sh

TITLE="$1"
TYPE="$2"
PRIORITY="$3"

gh issue create \
  --title "$TITLE" \
  --body "## Description
$TITLE

## Acceptance Criteria
- [ ] Criteria 1
- [ ] Criteria 2

## Technical Notes
[TODO]

## Tasks
- [ ] Task 1
- [ ] Task 2
" \
  --label "$TYPE" \
  --label "priority-$PRIORITY"
```

### Sprint Report Generator
```bash
#!/bin/bash
# sprint-report.sh

MILESTONE="$1"

echo "## Sprint Report: $MILESTONE"
echo ""
echo "### Completed"
gh issue list --state closed --milestone "$MILESTONE" --json number,title --jq '.[] | "- #\(.number) \(.title)"'

echo ""
echo "### Remaining"
gh issue list --state open --milestone "$MILESTONE" --json number,title --jq '.[] | "- #\(.number) \(.title)"'
```

## Backlog Grooming Checklist

### Weekly Grooming
- [ ] Review new issues
- [ ] Re-prioritize if needed
- [ ] Break down large items
- [ ] Estimate effort
- [ ] Identify dependencies
- [ ] Update acceptance criteria

### Definition of Ready
An item is "Ready" for sprint if:
- [ ] User story clearly written
- [ ] Acceptance criteria defined
- [ ] Dependencies identified
- [ ] Estimated (story points)
- [ ] Priority assigned
- [ ] All clarifications obtained

### Definition of Done
An item is "Done" when:
- [ ] Code written and reviewed
- [ ] Unit tests passing (80%+ coverage)
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] Deployed to staging
- [ ] QA verified
- [ ] Product owner accepted

## Issue States

```
OPEN → IN PROGRESS → IN REVIEW → DONE
  │         │             │
  │         │             └── PR created, awaiting review
  │         │
  │         └── Being worked on
  │
  └── Not started

OPEN → BLOCKED → (unblocked) → IN PROGRESS
  │
  └── Waiting on external factor

OPEN → CLOSED (Won't Fix / Duplicate)
```

## Priority Triage

| Priority | Response Time | Sprint | Examples |
|----------|--------------|--------|----------|
| P0 - Critical | Immediate | Current | Security breach, data loss |
| P1 - High | 24h | Current/Next | Major feature broken |
| P2 - Medium | 72h | Next | Feature working, minor issues |
| P3 - Low | 1 week | Backlog | Cosmetic issues, nice-to-have |

---

*Backlog Management Skill v1.0.0*
