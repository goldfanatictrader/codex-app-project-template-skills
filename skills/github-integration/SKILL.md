---
name: github-integration
description: GitHub Integration skill - AI handles GitHub authentication, repository setup, project boards, issues, milestones, and automation
version: 1.0.0
created: 2026-04-07
author: User
license: MIT
compatibility:
  - codex app
categories:
  - github
  - integration
  - automation
  - devops
tags:
  - github
  - github-cli
  - automation
  - issues
  - projects
  - milestones
---

# GitHub Integration Skill

## Overview

AI handles complete GitHub integration including authentication, repository setup, project management, and automation.

## First-Time Setup

### Authentication Flow

```
┌─────────────────────────────────────────────────────────────┐
│                  GitHub Authentication                        │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  1. Check existing auth status                              │
│     └─> gh auth status                                      │
│                                                              │
│  2. If not authenticated, prompt user:                      │
│     ┌──────────────────────────────────────────────────┐    │
│     │  GitHub Authentication Required                   │    │
│     │                                                    │    │
│     │  Please authenticate to continue:                 │    │
│     │                                                    │    │
│     │  Option 1: Interactive login                       │    │
│     │  $ gh auth login                                  │    │
│     │                                                    │    │
│     │  Option 2: Use Personal Access Token               │    │
│     │  $ export GH_TOKEN=your_token                     │    │
│     │  Or: Set GH_TOKEN in environment                   │    │
│     │                                                    │    │
│     │  Create token at:                                  │    │
│     │  https://github.com/settings/tokens                 │    │
│     │  Required scopes: repo, project, workflow          │    │
│     └──────────────────────────────────────────────────┘    │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

### Token Requirements
```markdown
## Required GitHub Token Scopes

### For Full Functionality
- [x] repo (Full control of repositories)
  - [x] repo:status
  - [x] repo:deployment
  - [x] repo:public_repo
  - [x] repo:invite
  - [x] security_events

- [x] project (Full control of projects)
  - [x] read:project
  - [x] write:project

- [x] workflow (Update GitHub Actions workflows)

### Token Creation Steps
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Name: "AI Project Manager"
4. Expiration: 30 days (recommended)
5. Select all required scopes
6. Generate and copy token
7. Provide to AI: export GH_TOKEN=ghp_xxxx
```

## Repository Setup

### Create New Repository
```bash
# Interactive (will prompt for details)
gh repo create project-name --public

# With all options
gh repo create project-name \
  --public \
  --description "Project description" \
  --team team-name \
  --gitignore-template Node \
  --license MIT

# Private repository
gh repo create project-name --private
```

### Clone and Configure
```bash
# Clone repository
git clone https://github.com/username/project-name.git
cd project-name

# Add upstream (if forked)
git remote add upstream https://github.com/original/project-name.git

# Configure git
git config user.name "AI Project Manager"
git config user.email "ai@example.com"
```

### Repository Settings
```bash
# Enable issues
gh api repos/{owner}/{repo} -X PATCH -f has_issues=true

# Enable projects
gh api repos/{owner}/{repo} -X PATCH -f has_projects=true

# Enable wikis (if needed)
gh api repos/{owner}/{repo} -X PATCH -f has_wiki=true

# Set default branch
gh api repos/{owner}/{repo} -X PATCH -f default_branch=main
```

## Project Board Setup

### Create GitHub Project (Beta)
```bash
# Create project
gh project create --title "Project Name" --owner "username" --template "Automatic"

# List projects
gh project list --owner "username"

# View project
gh project view 1 --owner "username" --web
```

### Create Project Board (Classic)
```bash
# Create project board
curl -X POST \
  -H "Authorization: token $GH_TOKEN" \
  -H "Accept: application/vnd.github.inertia-preview+json" \
  https://api.github.com/repos/{owner}/{repo}/projects \
  -d '{"name":"Sprint Board","body":"Sprint planning board"}'

# Create columns
curl -X POST \
  -H "Authorization: token $GH_TOKEN" \
  -H "Accept: application/vnd.github.inertia-preview+json" \
  https://api.github.com/repos/{owner}/{repo}/projects/1/columns \
  -d '{"name":"Backlog"}'

curl -X POST \
  -H "Authorization: token $GH_TOKEN" \
  -H "Accept: application/vnd.github.inertia-preview+json" \
  https://api.github.com/repos/{owner}/{repo}/projects/1/columns \
  -d '{"name":"To Do"}'

curl -X POST \
  -H "Authorization: token $GH_TOKEN" \
  -H "Accept: application/vnd.github.inertia-preview+json" \
  https://api.github.com/repos/{owner}/{repo}/projects/1/columns \
  -d '{"name":"In Progress"}'

curl -X POST \
  -H "Authorization: token $GH_TOKEN" \
  -H "Accept: application/vnd.github.inertia-preview+json" \
  https://api.github.com/repos/{owner}/{repo}/projects/1/columns \
  -d '{"name":"In Review"}'

curl -X POST \
  -H "Authorization: token $GH_TOKEN" \
  -H "Accept: application/vnd.github.inertia-preview+json" \
  https://api.github.com/repos/{owner}/{repo}/projects/1/columns \
  -d '{"name":"Done"}'
```

## Labels Setup

### Create Standard Labels
```bash
#!/bin/bash
# setup-labels.sh

REPO="$1"

# Type labels
gh label create "feature" --repo "$REPO" --description "New feature request" --color "36a64f"
gh label create "bug" --repo "$REPO" --description "Bug report" --color "d73a4a"
gh label create "enhancement" --repo "$REPO" --description "Enhancement to existing feature" --color "a2eeef"
gh label create "documentation" --repo "$REPO" --description "Documentation improvements" --color "0075ca"
gh label create "task" --repo "$REPO" --description "Non-feature task" --color "e4e669"
gh label create "tech-debt" --repo "$REPO" --description "Technical debt" --color "ff9800"

# Priority labels
gh label create "P0" --repo "$REPO" --description "Critical - Immediate action" --color "b60205"
gh label create "P1" --repo "$REPO" --description "High priority" --color "ff9900"
gh label create "P2" --repo "$REPO" --description "Medium priority" --color "fbca04"
gh label create "P3" --repo "$REPO" --description "Low priority" --color "006b75"

# Status labels
gh label create "blocked" --repo "$REPO" --description "Blocked by dependency" --color "e67e22"
gh label create "in-progress" --repo "$REPO" --description "Currently being worked on" --color "f9c70c"
gh label create "in-review" --repo "$REPO" --description "Under code review" --color "9b59b6"
gh label create "ready-for-test" --repo "$REPO" --description "Ready for QA testing" --color "3498db"
gh label create "verified" --repo "$REPO" --description "QA verified" --color "2c3e50"

# Other labels
gh label create "good-first-issue" --repo "$REPO" --description "Good for newcomers" --color "7057ff"
gh label create "help-wanted" --repo "$REPO" --description "Help wanted" --color "008672"
gh label create "wont-fix" --repo "$REPO" --description "Will not be fixed" --color "cccccc"
gh label create "duplicate" --repo "$REPO" --description "Duplicate issue" --color "cccccc"
```

## Milestones (Sprints)

### Create Milestones
```bash
# Create sprint milestones
gh issue milestone create \
  --repo "$REPO" \
  --title "Sprint 1 - Foundation" \
  --description "Database, Auth, Core Infrastructure" \
  --due "2024-02-01"

gh issue milestone create \
  --repo "$REPO" \
  --title "Sprint 2 - Core Features" \
  --description "Main user features" \
  --due "2024-03-01"

gh issue milestone create \
  --repo "$REPO" \
  --title "Sprint 3 - Polish" \
  --description "Testing, bug fixes, optimization" \
  --due "2024-04-01"

# List milestones
gh issue milestone list --repo "$REPO"

# View milestone progress
gh issue list --milestone "Sprint 1" --repo "$REPO" --state all
```

## Issue Templates

### Create Issue Templates
```bash
mkdir -p .github/ISSUE_TEMPLATE
```

### Feature Request Template
```markdown
<!-- .github/ISSUE_TEMPLATE/feature_request.md -->
---
name: Feature Request
about: Suggest an idea for this project
title: '[FEATURE] '
labels: feature
assignees: ''
---

## Is your feature request related to a problem? Please describe.
A clear and concise description of what the problem is. Ex. I'm always frustrated when [...]

## Describe the solution you'd like
A clear description of what you want to happen.

## Describe alternatives you've considered
A clear description of any alternative solutions you've considered.

## Additional context
Add any other context or screenshots about the feature request here.

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3
```

### Bug Report Template
```markdown
<!-- .github/ISSUE_TEMPLATE/bug_report.md -->
---
name: Bug Report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

## Bug Description
A clear description of the bug.

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior
What should happen.

## Actual Behavior
What happens instead.

## Screenshots
If applicable, add screenshots.

## Environment
- OS: [e.g., iOS]
- Browser [e.g., chrome, safari]
- Version [e.g., 22]

## Additional Context
Any other context.
```

## Pull Request Template
```markdown
<!-- .github/PULL_REQUEST_TEMPLATE.md -->
## Description
Please include a summary of the change and which issue is fixed.

## Type of Change
- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change (fix or feature)
- [ ] Documentation update

## How Has This Been Tested?
Please describe the tests that you ran.

## Checklist
- [ ] My code follows the style guidelines
- [ ] I have performed a self-review
- [ ] I have commented my code where necessary
- [ ] I have updated the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective
- [ ] New and existing unit tests pass locally
- [ ] Any dependent changes have been merged

## Related Issues
Fixes #issue_number
```

## Automation Workflows

### Create Issue from Backlog
```bash
#!/bin/bash
# create-backlog.sh

REPO="$1"
MILESTONE="$2"

# Create issues from backlog
gh issue create \
  --repo "$REPO" \
  --title "[FEATURE] User Authentication" \
  --body "$(cat <<'EOF'
## Description
Implement user authentication with JWT

## User Story
As a user, I want to login so that I can access my account.

## Acceptance Criteria
- [ ] User can register with email/password
- [ ] User can login
- [ ] JWT tokens are issued and validated
- [ ] User can logout

## Technical Notes
- Use bcrypt for password hashing
- JWT expiry: 24 hours
- Refresh token: 7 days

## Story Points: 5
EOF
)" \
  --label "feature" \
  --label "P0" \
  --milestone "$MILESTONE"
```

### Sprint Report Generator
```bash
#!/bin/bash
# sprint-report.sh

REPO="$1"
MILESTONE="$2"

echo "# Sprint Report: $MILESTONE"
echo ""
echo "## Completed Issues"
gh issue list --repo "$REPO" --milestone "$MILESTONE" --state closed \
  --json number,title,labels --jq '.[] | "- #\(.number) \(.title) \(.labels | join(", "))"'

echo ""
echo "## Remaining Issues"
gh issue list --repo "$REPO" --milestone "$MILESTONE" --state open \
  --json number,title,labels --jq '.[] | "- #\(.number) \(.title) \(.labels | join(", "))"'

echo ""
echo "## Statistics"
echo "- Completed: $(gh issue list --repo "$REPO" --milestone "$MILESTONE" --state closed --json number --jq 'length')"
echo "- Remaining: $(gh issue list --repo "$REPO" --milestone "$MILESTONE" --state open --json number --jq 'length')"
```

## GitHub Actions for Project Management

### Auto-assign Issues
```yaml
# .github/workflows/auto-assign.yml
name: Auto Assign
on:
  issues:
    types: [opened]

jobs:
  assign:
    runs-on: ubuntu-latest
    steps:
      - name: Assign issue
        uses: actions/github-script@v6
        with:
          script: |
            github.rest.issues.addAssignees({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              assignees: [context.actor]
            })
```

### Sprint Automation
```yaml
# .github/workflows/sprint-automation.yml
name: Sprint Automation
on:
  issues:
    types: [closed]
  pull_request:
    types: [closed]

jobs:
  update-milestone:
    runs-on: ubuntu-latest
    steps:
      - name: Update sprint board
        run: |
          echo "Sprint progress updated"
          # Add your automation here
```

## Quick Reference

### Essential Commands
```bash
# Authentication
gh auth status
gh auth login

# Repository
gh repo create <name> --public|--private
gh repo clone <owner>/<repo>

# Issues
gh issue create --title "..." --body "..."
gh issue list --state open --label "bug"
gh issue close <issue-number>
gh issue edit <issue-number> --add-label "in-progress"

# Milestones
gh issue milestone create --title "Sprint 1" --due "2024-01-15"
gh issue milestone list

# Labels
gh label list
gh label create "new-label" --color "ffffff"

# Projects
gh project list
gh project create --title "My Project"

# Pull Requests
gh pr create --title "..." --body "..."
gh pr merge <pr-number>
gh pr list --state open
```

### API Endpoints
```bash
# REST API base
https://api.github.com

# Common endpoints
GET /repos/{owner}/{repo}/issues
POST /repos/{owner}/{repo}/issues
PATCH /repos/{owner}/{repo}/issues/{issue_number}
GET /repos/{owner}/{repo}/milestones
POST /repos/{owner}/{repo}/projects
```

---

*GitHub Integration Skill v1.0.0*
