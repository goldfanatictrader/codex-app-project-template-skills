---
name: environments
description: Environment-specific configurations and secrets
version: 1.0.0
created: 2026-04-07
---

# Environment Configuration

---

## 1. Environment Overview

| Environment | Purpose | URL | Status |
|-------------|---------|-----|--------|
| Development | Local development | localhost:3000 | 🟢 Active |
| Staging | Pre-production testing | staging.project.com | 🟢 Active |
| Production | Live system | project.com | 🟢 Active |

---

## 2. Development Environment

### 2.1 Local Setup

**Prerequisites:**
- Node.js 18+
- Docker & Docker Compose
- Git

**Setup Steps:**
```bash
# 1. Clone repository
git clone git@github.com:org/project.git
cd project

# 2. Install dependencies
npm install

# 3. Copy environment file
cp .env.example .env

# 4. Start infrastructure
docker-compose up -d

# 5. Run migrations
npm run db:migrate

# 6. Seed data (optional)
npm run db:seed

# 7. Start development server
npm run dev
```

### 2.2 Local Environment Variables

```bash
# .env (local development)
NODE_ENV=development

# Database
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/project_dev
DATABASE_POOL_MIN=2
DATABASE_POOL_MAX=10

# Redis
REDIS_URL=redis://localhost:6379

# Auth
JWT_SECRET=dev-secret-change-in-production
JWT_EXPIRES_IN=7d
REFRESH_TOKEN_EXPIRES_IN=30d

# External Services
STRIPE_SECRET_KEY=sk_test_...
SENDGRID_API_KEY=SG....

# Feature Flags
ENABLE_DEBUG_MODE=true
ENABLE_LOGGING=true
```

### 2.3 Debugging

**VS Code Launch Configuration:**
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Debug Server",
      "runtimeExecutable": "npm",
      "runtimeArgs": ["run", "dev"],
      "skipFiles": ["<node_internals>/**"]
    }
  ]
}
```

---

## 3. Staging Environment

### 3.1 Access

| Resource | Access Method | Credentials |
|----------|---------------|-------------|
| SSH | `ssh deploy@staging.project.com` | SSH key |
| Database | psql via bastion | Via AWS SSM |
| AWS Console | SSO | Company email |

### 3.2 Configuration

```bash
# .env.staging
NODE_ENV=staging

# Database (RDS)
DATABASE_URL=postgresql://user:pass@staging-db.amazonaws.com:5432/project
DATABASE_POOL_MIN=5
DATABASE_POOL_MAX=20

# Redis (ElastiCache)
REDIS_URL=redis://staging-redis.amazonaws.com:6379

# Auth
JWT_SECRET=${STAGING_JWT_SECRET}  # From SSM
JWT_EXPIRES_IN=1h
REFRESH_TOKEN_EXPIRES_IN=7d

# External Services
STRIPE_SECRET_KEY=${STAGING_STRIPE_KEY}  # From SSM
SENDGRID_API_KEY=${STAGING_SENDGRID_KEY}

# Feature Flags
ENABLE_DEBUG_MODE=false
ENABLE_LOGGING=true
LOG_LEVEL=info
```

### 3.3 Deployment

**Automatic Deployment:**
- Merges to `develop` branch auto-deploy to staging
- Takes ~5 minutes

**Manual Deployment:**
```bash
# SSH to deployment server
ssh deploy@staging.project.com

# Pull latest
cd /app
git pull origin develop

# Run migrations
npm run db:migrate

# Restart services
pm2 restart all
```

---

## 4. Production Environment

### 4.1 Access

| Resource | Access Method | Who |
|----------|---------------|-----|
| SSH | Via jump host only | Senior engineers |
| Database | No direct access | Use read replica |
| AWS Console | SSO + MFA required | DevOps team |

### 4.2 Configuration

```bash
# .env.production
NODE_ENV=production

# Database (RDS Multi-AZ)
DATABASE_URL=postgresql://user:pass@prod-db.amazonaws.com:5432/project
DATABASE_POOL_MIN=10
DATABASE_POOL_MAX=50

# Redis (ElastiCache Cluster)
REDIS_URL=redis://prod-cluster.amazonaws.com:6379

# Auth
JWT_SECRET=${PROD_JWT_SECRET}  # From AWS Secrets Manager
JWT_EXPIRES_IN=15m
REFRESH_TOKEN_EXPIRES_IN=7d

# External Services
STRIPE_SECRET_KEY=${PROD_STRIPE_KEY}
SENDGRID_API_KEY=${PROD_SENDGRID_KEY}

# Feature Flags
ENABLE_DEBUG_MODE=false
ENABLE_LOGGING=true
LOG_LEVEL=warn

# Monitoring
SENTRY_DSN=${PROD_SENTRY_DSN}
DATADOG_API_KEY=${PROD_DATADOG_KEY}
```

### 4.3 Deployment

**Process:**
1. Merge to `main` branch
2. CI/CD pipeline runs tests
3. Build Docker image
4. Push to ECR
5. Deploy to ECS via ECS deploy task
6. Health check verification
7. Traffic shift (10% → 100%)

**Rollback:**
```bash
# Via ECS CLI
aws ecs update-service --service production-api --force-new-deployment

# Or via previous task definition
aws ecs update-service --service production-api --task-definition production-api:PREV_VERSION
```

---

## 5. Secrets Management

### 5.1 Secret Storage

| Environment | Storage | Access |
|-------------|---------|--------|
| Development | `.env` file (gitignored) | Developer |
| Staging | AWS SSM Parameter Store | Deploy user via IAM |
| Production | AWS Secrets Manager | Via IAM roles only |

### 5.2 Secret Rotation

| Secret | Rotation | Last Rotated |
|--------|----------|--------------|
| Database password | 90 days | YYYY-MM-DD |
| JWT secret | 180 days | YYYY-MM-DD |
| API keys | Manual | As needed |

### 5.3 Adding New Secrets

```
1. Add to .env.example with placeholder
   NEW_SECRET=your-secret-here

2. Add to CI/CD secret store
   - Staging: AWS SSM
   - Production: AWS Secrets Manager

3. Add to deployment config
   - ECS task definition or
   - Kubernetes secrets

4. Document in this file
```

---

## 6. Feature Flags

### 6.1 Flag System

Using: [LaunchDarkly / Unleash / Custom]

**Flag Structure:**
```typescript
{
  key: 'new-checkout-flow',
  description: 'Enable new checkout experience',
  enabled: {
    development: true,
    staging: true,
    production: false
  },
  rollout: 0  // Percentage (0-100)
}
```

### 6.2 Active Flags

| Flag | Purpose | Status |
|------|---------|--------|
| new-checkout-flow | Redesigned checkout | 50% rollout |
| beta-features | Enable beta features | 10% rollout |
| maintenance-mode | Site-wide maintenance | Off |

### 6.3 Adding New Flag

```typescript
// 1. Create flag in LaunchDarkly

// 2. Use in code
import { useFeatureFlag } from '@/hooks/useFeatureFlag';

function CheckoutButton() {
  const isNewCheckout = useFeatureFlag('new-checkout-flow');
  
  return isNewCheckout 
    ? <NewCheckoutButton />
    : <OldCheckoutButton />;
}
```

---

## 7. Environment Comparison

| Setting | Development | Staging | Production |
|---------|-------------|---------|------------|
| Debug mode | ✅ | ❌ | ❌ |
| Verbose logging | ✅ | ⚠️ Info | ⚠️ Warn |
| Cache | Disabled | Enabled | Enabled |
| Rate limiting | Disabled | 100/min | 1000/min |
| Error details | Shown | Hidden | Hidden |
| Source maps | ✅ | ❌ | ❌ |
| Analytics | ❌ | Test account | Production |

---

*Last updated: YYYY-MM-DD*
