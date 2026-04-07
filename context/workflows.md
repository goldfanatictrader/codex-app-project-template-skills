---
name: workflows
description: Development workflows, CI/CD, and operational procedures
version: 1.0.0
created: 2026-04-07
---

# Workflows

---

## 1. Development Workflow

### 1.1 Branch Strategy

```
main (production)
  └── develop (integration)
        ├── feature/user-auth
        ├── feature/payment-integration
        └── fix/login-bug
```

| Branch | Purpose | Protection |
|--------|---------|------------|
| main | Production code | Requires PR + 2 approvals |
| develop | Integration branch | Requires PR + 1 approval |
| feature/* | New features | Optional PR for review |
| fix/* | Bug fixes | Optional PR for review |

### 1.2 Development Process

```
1. Create branch from develop
   git checkout develop
   git pull origin develop
   git checkout -b feature/my-feature

2. Make changes & commit
   git add .
   git commit -m "feat(scope): description"

3. Push & create PR
   git push -u origin feature/my-feature

4. Address review feedback
   git add .
   git commit -m "fix(scope): address review comments"
   git push

5. Merge after approval
   Squash and merge to maintain clean history
```

### 1.3 Code Review Process

**Author Responsibilities:**
- Self-review before requesting review
- Write descriptive PR title and description
- Include screenshots for UI changes
- Link to related issues
- Respond to feedback promptly

**Reviewer Responsibilities:**
- Review within 24 hours
- Provide constructive feedback
- Use conventional comments:
  - `nit:` Minor suggestion
  - `question:` Needs clarification
  - `suggestion:` Improvement idea
  - `blocker:` Must fix before merge

---

## 2. CI/CD Pipeline

### 2.1 Pipeline Stages

```
┌─────────────────────────────────────────────────────────────┐
│                        CI Pipeline                          │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌────────┐ │
│  │   Lint   │───▶│  Type    │───▶│  Build   │───▶│  Test  │ │
│  │          │    │  Check   │    │          │    │        │ │
│  └──────────┘    └──────────┘    └──────────┘    └────┬───┘ │
│                                                         │     │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐         │     │
│  │ Security │───▶│  Audit   │───▶│  Deploy  │◀────────┘     │
│  │  Scan    │    │  deps    │    │  Staging │               │
│  └──────────┘    └──────────┘    └──────────┘               │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 CI Configuration

**File**: `.github/workflows/ci.yml` or `.gitlab-ci.yml`

| Stage | Tool | Fail Condition |
|-------|------|----------------|
| Lint | ESLint | Errors found |
| Type Check | tsc | Type errors |
| Build | webpack/tsc | Build failure |
| Test | Jest | < 80% coverage or failures |
| Security | Snyk/Dependabot | Critical vulnerabilities |

### 2.3 Deployment Environments

| Environment | Trigger | URL | Purpose |
|-------------|---------|-----|---------|
| Development | Every push | dev.project.com | Testing |
| Staging | Merge to develop | staging.project.com | Pre-production |
| Production | Merge to main | project.com | Live |

---

## 3. Release Process

### 3.1 Version Numbering

Follows [Semantic Versioning](https://semver.org/):

```
MAJOR.MINOR.PATCH
  │     │     └── Bug fixes
  │     └────────── Minor features (backwards compatible)
  └──────────────── Major changes (breaking changes)
```

### 3.2 Release Steps

```
1. Create release branch
   git checkout -b release/v1.2.0 develop

2. Update version
   - Update CHANGELOG.md
   - Update package.json version
   - Commit with "chore: bump version to v1.2.0"

3. Final testing
   - Run full test suite
   - Manual smoke tests
   - Performance tests if applicable

4. Merge to main
   git checkout main
   git merge release/v1.2.0 --no-ff
   git tag v1.2.0
   git push origin main --tags

5. Merge back to develop
   git checkout develop
   git merge release/v1.2.0 --no-ff
   git push origin develop

6. Create GitHub Release
   - Title: v1.2.0
   - Description: List of changes
   - Attach changelog
```

### 3.3 Hotfix Process

```
1. Create hotfix branch from main
   git checkout main
   git pull origin main
   git checkout -b hotfix/urgent-fix

2. Fix and commit
   git commit -m "fix: urgent fix description"

3. Test quickly

4. Merge to main AND develop
   git checkout main
   git merge hotfix/urgent-fix --no-ff
   git push origin main
   
   git checkout develop
   git merge hotfix/urgent-fix --no-ff
   git push origin develop

5. Delete hotfix branch
```

---

## 4. Issue Management

### 4.1 Issue Templates

**Bug Report:**
```
## Description
[Clear description of the bug]

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior
[What should happen]

## Actual Behavior
[What happens instead]

## Screenshots
[If applicable]

## Environment
- OS: [e.g., macOS 12.0]
- Browser: [e.g., Chrome 100]
- Version: [e.g., 1.2.0]
```

**Feature Request:**
```
## Problem Statement
[What problem does this solve?]

## Proposed Solution
[Your solution idea]

## Alternatives Considered
[Other solutions you've considered]

## Additional Context
[Any other information]
```

### 4.2 Issue Workflow

```
Open → Triaged → Ready → In Progress → In Review → Done
  │         │         │          │           │
  ▼         ▼         ▼          ▼           ▼
 New      Needs      Ready    Working     Pending
 Issue    Info       for Dev   on it       Review
```

---

## 5. Operational Procedures

### 5.1 Incident Response

**Severity Levels:**

| Level | Definition | Response Time | Example |
|-------|------------|---------------|---------|
| SEV1 | Production down | 15 min | Site inaccessible |
| SEV2 | Major feature broken | 1 hour | Payment not working |
| SEV3 | Minor feature broken | 4 hours | Search not working |
| SEV4 | Non-critical | 24 hours | UI glitch |

**Incident Process:**
```
1. Detect & Alert (automated or user report)
          ↓
2. Acknowledge (assign incident commander)
          ↓
3. Investigate (find root cause)
          ↓
4. Mitigate (stop the bleeding)
          ↓
5. Resolve (fix the issue)
          ↓
6. Post-mortem (learn & prevent)
```

### 5.2 Rollback Procedures

**Application Rollback:**
```bash
# Revert to previous version
kubectl rollout undo deployment/app-name

# Or deploy specific version
kubectl rollout undo deployment/app-name --to-revision=N
```

**Database Rollback:**
- Only if absolutely necessary
- Requires approval from senior engineer
- Must have backup before migration

### 5.3 On-Call Procedures

| Role | Responsibility |
|------|----------------|
| Primary On-Call | First response, SEV1/SEV2 |
| Secondary On-Call | Backup, SEV3/SEV4 |
| Engineering Manager | Escalation point |

**On-Call Tools:**
- PagerDuty / OpsGenie for alerting
- Slack #incidents channel
- Runbook links in alert

---

## 6. Communication

### 6.1 Status Page

URL: [status.project.com](link)

| Status | Meaning |
|--------|---------|
| 🟢 Operational | All systems working |
| 🟡 Degraded | Some issues, working on it |
| 🔴 Outage | Major issues |

### 6.2 Notification Channels

| Channel | Purpose | Audience |
|---------|---------|----------|
| #engineering | Technical discussion | Dev team |
| #releases | Deployment notifications | All |
| #incidents | Active incidents | On-call + stakeholders |
| #standup | Daily standups | Team |

---

*Last updated: YYYY-MM-DD*
