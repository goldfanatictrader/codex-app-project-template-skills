---
name: github-projects
description: GitHub Projects skill - AI manages GitHub Projects board with columns, cards, notes, auto-sync, and full kanban workflow
version: 1.0.0
created: 2026-04-07
author: User
license: MIT
compatibility:
  - codex app
categories:
  - github
  - projects
  - kanban
  - automation
tags:
  - github-projects
  - kanban
  - automation
  - task-management
---

# GitHub Projects Skill

## Overview

AI manages complete GitHub Projects board with full kanban workflow, automatic status updates, notes, and sync.

## GitHub Projects vs GitHub Issues

| Feature | GitHub Issues | GitHub Projects |
|---------|---------------|----------------|
| Tasks | ✅ | ✅ |
| Kanban Board | ❌ | ✅ |
| Columns | ❌ | ✅ |
| Drag & Drop | ❌ | ✅ |
| Notes/Cards | ❌ | ✅ |
| Automation | Limited | ✅ (built-in) |
| Views | Basic | Multiple views |

---

## Project Setup Workflow

### Step 1: Create GitHub Project (Beta)

```bash
# Create project with kanban template
gh project create --title "$PROJECT_NAME" --owner "$USERNAME" --template "Automatic"

# Or create with repository scope
gh project create --title "$PROJECT_NAME" --owner "$USERNAME/$REPO_NAME" --template "Automatic"
```

### Step 2: Get Project Number

```bash
gh project list --owner "$USERNAME" --format json | jq '.projects[] | select(.name=="ProjectName") | .number'
```

### Step 3: Add Columns

Default columns for kanban:
- **Backlog** - Tasks to be done
- **To Do** - Ready for sprint
- **In Progress** - Currently working on
- **In Review** - PR/code review
- **Done** - Completed tasks
- **Blocked** - Stuck items

---

## Column Management

### Create Columns
```bash
# Create column via GraphQL API
curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { createProjectColumn(input: {projectId: \"$PROJECT_ID\", name: \"Backlog\"}) { column { id, name } } }"
  }' \
  https://api.github.com/graphql
```

### List Columns
```bash
# Get all columns
gh api graphql -f query='
  query {
    node(id: "$PROJECT_ID") {
      ... on ProjectV2 {
        columns(first: 20) {
          nodes {
            id
            name
            cards {
              totalCount
            }
          }
        }
      }
    }
  }
'
```

### Delete Column
```bash
# Delete column
curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { deleteProjectColumn(input: {columnId: \"$COLUMN_ID\"}) { clientMutationId } }"
  }' \
  https://api.github.com/graphql
```

---

## Card Management

### Add Issue to Project
```bash
# Add issue to project
gh issue edit $ISSUE_NUMBER --project "$PROJECT_NAME"

# Or via GraphQL
curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { addProjectV2ItemById(input: {projectId: \"$PROJECT_ID\", contentId: \"$ISSUE_NODE_ID\"}) { item { id } } }"
  }' \
  https://api.github.com/graphql
```

### Add Note to Column
```bash
# Add note card
curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { addProjectV2ItemById(input: {projectId: \"$PROJECT_ID\"}) { item { id } } }"
  }' \
  https://api.github.com/graphql

# Then add note content
curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { updateProjectV2ItemFieldValue(input: {projectId: \"$PROJECT_ID\", itemId: \"$ITEM_ID\", fieldId: \"$NOTE_FIELD_ID\", value: {text: \"$NOTE_CONTENT\"}) }) { clientMutationId } }"
  }' \
  https://api.github.com/graphql
```

### Move Card Between Columns
```bash
# Move card to different column
curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { moveProjectV2Item(input: {itemId: \"$ITEM_ID\", position: {columnId: \"$TARGET_COLUMN_ID\"}}) { clientMutationId } }"
  }' \
  https://api.github.com/graphql
```

### Archive Card
```bash
# Archive completed card
curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation { archiveProjectV2Item(input: {itemId: \"$ITEM_ID\"}) { item { id, isArchived } } }"
  }' \
  https://api.github.com/graphql
```

---

## Auto-Sync Workflow

### Daily Sync Commands

```bash
#!/bin/bash
# sync-project.sh

PROJECT_NAME="$1"
OWNER="$2"

# 1. Get project ID
PROJECT_ID=$(gh api graphql -f query='
  query {
    user(login: "'"$OWNER"'") {
      projectV2(name: "'"$PROJECT_NAME"'") {
        id
        number
      }
    }
  }
' --jq '.data.user.projectV2.id')

# 2. Sync open issues to Backlog
gh issue list --state open --assignee "@me" --format json | jq -c '.[]' | while read issue; do
  ISSUE_ID=$(echo $issue | jq -r '.node_id')
  gh api graphql -f query='
    mutation {
      addProjectV2ItemById(input: {projectId: "'"$PROJECT_ID"'", contentId: "'"$ISSUE_ID"'"}) {
        item { id }
      }
    }
  '
done

# 3. Update status based on labels
# "in-progress" label → "In Progress" column
# "in-review" label → "In Review" column
# "done" label → "Done" column
```

---

## Status Update Rules

AI automatically updates card status based on:

```markdown
## Status Mapping

| Label Added | Card Moved To |
|-------------|---------------|
| `backlog` | Backlog |
| `ready` or `to-do` | To Do |
| `in-progress` | In Progress |
| `in-review` | In Review |
| `done` or `completed` | Done |
| `blocked` | Blocked |
| `blocked` + reason | Blocked (with note) |

## Auto-Actions

| Event | Action |
|-------|--------|
| Issue created with `P0` | Add to "To Do", set high priority |
| PR opened | Move to "In Review" |
| PR merged | Move to "Done" |
| Bug filed | Add to "To Do", label `bug` |
| Comment "blocked by" | Move to "Blocked" |
| Issue closed | Archive card |
```

---

## Project Board Templates

### Standard Kanban
```
┌──────────┬──────────┬─────────────┬───────────┬────────┐
│ Backlog  │  To Do   │ In Progress │ In Review │  Done  │
├──────────┼──────────┼─────────────┼───────────┼────────┤
│ [Card]   │ [Card]   │   [Card]    │  [Card]   │ [Card] │
│ [Card]   │ [Card]   │   [Card]    │           │ [Card] │
│ [Card]   │          │             │           │        │
└──────────┴──────────┴─────────────┴───────────┴────────┘
```

### Sprint Board
```
┌──────────┬──────────┬─────────────┬───────────┬────────┬──────────┐
│ Backlog  │  To Do   │ In Progress │ In Review │ Testing │  Done   │
├──────────┼──────────┼─────────────┼───────────┼────────┼──────────┤
│          │ Sprint   │             │           │        │          │
│          │ Items    │             │           │        │          │
└──────────┴──────────┴─────────────┴───────────┴────────┴──────────┘
```

### Bug Tracker
```
┌──────────┬──────────┬─────────────┬───────────┬────────┐
│  New     │ To Fix   │ In Progress │  Testing  │ Fixed  │
├──────────┼──────────┼─────────────┼───────────┼────────┤
│ [Bug]    │ [Bug]    │   [Bug]    │  [Bug]   │ [Bug]  │
│ [Bug]    │ [Bug]    │   [Bug]    │           │        │
└──────────┴──────────┴─────────────┴───────────┴────────┘
```

---

## Quick Reference Commands

### Essential Project Commands

```bash
# List all projects
gh project list --owner "$USER"

# View project in browser
gh project view "$PROJECT_NUMBER" --owner "$USER" --web

# Add issue to project
gh issue edit $ISSUE --project "$PROJECT_NAME"

# Remove issue from project
gh issue edit $ISSUE --remove-project "$PROJECT_NAME"

# List project items
gh api graphql --field query='
  query {
    node(id: "$PROJECT_ID") {
      ... on ProjectV2 {
        items(first: 50) {
          nodes {
            id
            fieldValues(first: 10) {
              nodes {
                ... on ProjectV2ItemFieldTextValue {
                  text
                  field { ... on ProjectV2Field { name } }
                }
              }
            }
            content {
              ... on Issue {
                title
                number
                state
              }
            }
          }
        }
      }
    }
  }
'
```

---

## Automation Scripts

### Auto-Add New Issues to Backlog
```bash
#!/bin/bash
# auto-backlog.sh

# Script that runs on issue creation webhook
# Adds new issues to project backlog automatically

PROJECT_ID="$1"
ISSUE_NODE_ID="$2"

curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation addToProject($projectId: ID!, $itemId: ID!) {
      addProjectV2ItemById(input: {projectId: $projectId, contentId: $itemId}) {
        item { id }
      }
    }",
    "variables": {
      "projectId": "'"$PROJECT_ID"'",
      "itemId": "'"$ISSUE_NODE_ID"'"
    }
  }' \
  https://api.github.com/graphql
```

### Update Card Status from Label
```bash
#!/bin/bash
# update-status.sh

# Script that runs on label change
# Moves cards based on label

ITEM_ID="$1"
LABEL="$2"
PROJECT_ID="$3"

case "$LABEL" in
  "in-progress")
    COLUMN_ID="$IN_PROGRESS_COLUMN_ID"
    ;;
  "in-review")
    COLUMN_ID="$IN_REVIEW_COLUMN_ID"
    ;;
  "done")
    COLUMN_ID="$DONE_COLUMN_ID"
    ;;
  *)
    COLUMN_ID="$BACKLOG_COLUMN_ID"
    ;;
esac

curl -X POST \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "mutation moveItem($itemId: ID!, $columnId: ID!) {
      moveProjectV2Item(input: {itemId: $itemId, position: {columnId: $columnId}}) {
        clientMutationId
      }
    }",
    "variables": {
      "itemId": "'"$ITEM_ID"'",
      "columnId": "'"$COLUMN_ID"'"
    }
  }' \
  https://api.github.com/graphql
```

### Daily Status Report
```bash
#!/bin/bash
# daily-report.sh

PROJECT_ID="$1"

echo "## 📊 Daily Project Status Report"
echo ""
echo "### Cards by Column"
echo ""

# Get card counts per column
gh api graphql --field query='
  query {
    node(id: "'"$PROJECT_ID"'") {
      ... on ProjectV2 {
        columns: fields(first: 10, orderBy: {field: POSITION}) {
          nodes {
            name
            data: cards {
              totalCount
            }
          }
        }
      }
    }
  }
' --jq '.data.node.columns.nodes[] | "- \(.name): \(.data.totalCount) cards"'

echo ""
echo "### Recently Completed"
gh issue list --state closed --limit 5 --format json | jq -r '.[] | "- #\(.number) \(.title)"'
```

---

## GitHub Actions Integration

### Auto-Add Issues to Project
```yaml
# .github/workflows/project-automation.yml
name: Project Automation

on:
  issues:
    types: [opened, labeled]
  pull_request:
    types: [opened, closed]

jobs:
  manage-project:
    runs-on: ubuntu-latest
    steps:
      - name: Get project ID
        run: |
          echo "PROJECT_ID=${{ secrets.PROJECT_ID }}" >> $GITHUB_ENV
      
      - name: Add issue to project
        if: github.event.issue
        run: |
          gh api graphql -f query='
            mutation addToProject {
              addProjectV2ItemById(input: {
                projectId: ${{ env.PROJECT_ID }},
                contentId: ${{ github.event.issue.node_id }}
              }) { item { id } }
            }
          '
      
      - name: Auto-assign to column based on label
        if: github.event.label.name == 'in-progress'
        run: |
          # Move to "In Progress" column
          gh api graphql -f query='
            mutation moveItem {
              moveProjectV2Item(input: {
                itemId: ${{ steps.add-item.outputs.itemId }},
                position: { columnId: ${{ secrets.IN_PROGRESS_COLUMN_ID }} }
              }) { clientMutationId }
            }
          '
```

---

## Integration with Backlog Management

This skill integrates with `backlog-management` skill:

```markdown
## Workflow Integration

1. **Issue Created** → Auto-added to GitHub Project "Backlog"
2. **Issue Prioritized** → Card moved to "To Do"
3. **Work Started** → Card moved to "In Progress"
4. **PR Opened** → Card moved to "In Review"
5. **PR Merged** → Card moved to "Done"
6. **Issue Closed** → Card archived

## Real-time Sync

AI agent performs sync:
- On every session start
- After completing any task
- After creating any issue/PR
- On request from user
```

---

## Best Practices

### Board Organization
- [ ] Keep Backlog groomed (weekly)
- [ ] Limit WIP (Work In Progress) per column
- [ ] Use labels consistently
- [ ] Archive done items monthly
- [ ] Review blocked items daily

### Naming Conventions
```
Columns: Title Case (e.g., "In Progress")
Labels: kebab-case (e.g., "in-progress")
Milestones: "Sprint X" format
```

---

## Troubleshooting

### Card Not Moving
```bash
# Check card exists
gh api graphql --field query='
  query { node(id: "$CARD_ID") { ... on ProjectV2Item { id } } }
'

# Check column exists  
gh api graphql --field query='
  query { node(id: "$COLUMN_ID") { ... on ProjectV2Column { id, name } } }
'
```

### Permission Issues
```bash
# Check project permissions
gh api graphql --field query='
  query {
    node(id: "$PROJECT_ID") {
      ... on ProjectV2 {
        permission
      }
    }
  }
'

# User needs: Write access to project
```

---

*GitHub Projects Skill v1.0.0*
