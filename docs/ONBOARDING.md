# Onboarding Guide

Welcome to the team! This guide will help you get up and running.

---

## Day 1 Checklist

- [ ] Get laptop and accounts
- [ ] Join Slack workspace
- [ ] Set up development environment
- [ ] Meet the team
- [ ] First PR merged (see "Your First Task")

---

## Account Setup

### Required Accounts

| Service | How to Get | Who to Ask |
|---------|------------|------------|
| GitHub | Request via IT | IT Support |
| AWS (Dev) | Self-service | - |
| AWS (Production) | Request via manager | Your Manager |
| Datadog | Request via IT | IT Support |
| PagerDuty | Request via IT | IT Support |
| Figma | Request via IT | IT Support |

### SSH Keys

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your@email.com"

# Add to GitHub
# Settings > SSH and GPG keys > New SSH key

# Add to deployment servers
# Request access via manager
```

---

## Development Setup

### 1. Clone Repository

```bash
git clone git@github.com:org/project.git
cd project
```

### 2. Install Dependencies

```bash
# Using npm
npm install

# Or using pnpm (faster)
npm install -g pnpm
pnpm install
```

### 3. Environment Variables

```bash
cp .env.example .env
```

Ask a team member for the development `.env` values or check 1Password for shared credentials.

### 4. Start Infrastructure

```bash
# Start database, redis, etc.
docker-compose up -d

# Or using local services
# (ask team for local service setup)
```

### 5. Database Setup

```bash
# Run migrations
npm run db:migrate

# Seed with sample data (optional)
npm run db:seed
```

### 6. Start Development Server

```bash
npm run dev
```

Visit `http://localhost:3000` to verify everything works.

---

## Architecture Overview

### System Components

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Web App   │────▶│   API       │────▶│  Database   │
│   (Next.js) │     │   (Node.js) │     │  (Postgres) │
└─────────────┘     └──────┬──────┘     └─────────────┘
                           │
                    ┌──────▼──────┐
                    │    Redis    │
                    │   (Cache)   │
                    └─────────────┘
```

### Key Files

| Path | Purpose |
|------|---------|
| `src/api/` | API routes/controllers |
| `src/services/` | Business logic |
| `src/models/` | Database models |
| `src/utils/` | Helper functions |
| `tests/` | Test files |

### Tech Stack

- **Frontend**: Next.js, React
- **Backend**: Node.js, Express
- **Database**: PostgreSQL
- **Cache**: Redis
- **Infrastructure**: AWS (ECS, RDS, ElastiCache)

---

## Coding Standards

See [Conventions](../context/conventions.md) for detailed standards.

**Quick rules:**
- Run `npm run lint` before committing
- Run `npm test` to verify tests pass
- Follow existing patterns in codebase
- Write tests for new features

---

## Your First Task

**Goal**: Fix a small bug or add a minor feature.

1. Check the issue tracker for "good first issue" labeled tickets
2. Create a branch: `git checkout -b fix/your-fix-name`
3. Make changes
4. Write tests
5. Submit PR with description
6. Address review feedback
7. Get merged! 🎉

---

## Important Resources

| Resource | Link |
|----------|------|
| Documentation | [docs.project.com](link) |
| API Docs | [docs.project.com/api](link) |
| Monitoring | [app.datadoghq.com](link) |
| Error Tracking | [sentry.io](link) |
| Slack Channels | #engineering, #releases, #support |

---

## Team Contacts

| Name | Role | Responsibility |
|------|------|----------------|
| | Team Lead | Architecture, code review |
| | Senior Dev | Backend, infrastructure |
| | Designer | UI/UX |

---

## Common Questions

**Q: Who do I ask for help?**
A: Ask in #engineering Slack channel or ping a team member directly.

**Q: How do I deploy?**
A: See [Deployment Guide](./DEPLOYMENT.md) for full instructions.

**Q: Where are the tests?**
A: In `tests/` directory. Run `npm test` to execute.

**Q: How do I add a new environment variable?**
A: Add to `.env.example`, notify DevOps to add to CI/CD, and document in environment config.

---

## Culture & Communication

### Working Hours
- Core hours: 10am - 4pm (for meetings)
- Flexible outside core hours
- Async communication encouraged

### Meeting Etiquette
- Cameras on in small meetings
- Mute when not speaking
- Add agenda to calendar invites
- Take notes and share

### Code Review
- Reviews within 24 hours
- Be kind and constructive
- Explain the "why" not just "what"

---

## Emergency Contacts

- **On-call**: Check PagerDuty
- **Security incident**: Alert #security and manager immediately
- **Production down**: Follow incident runbook in Notion

---

Welcome aboard! 🎉
