# Deployment Guide

---

## Overview

This guide covers deployment procedures for all environments.

## Environments

| Environment | Branch | URL | Auto-deploy |
|-------------|--------|-----|-------------|
| Development | develop | dev.project.com | Yes |
| Staging | develop | staging.project.com | Yes |
| Production | main | project.com | Manual |

---

## Prerequisites

- AWS CLI configured
- Docker installed
- Access to ECR repository
- SSH keys for deployment server

---

## Pre-Deployment Checklist

- [ ] All tests passing
- [ ] No critical security vulnerabilities
- [ ] Database migrations reviewed
- [ ] Feature flags configured
- [ ] Monitoring alerts verified
- [ ] Rollback plan prepared

---

## Deployment Steps

### 1. Verify Build

```bash
# Run tests
npm test

# Build production
npm run build

# Security scan
npm audit
```

### 2. Deploy to Staging

```bash
# Tag image
docker tag project:latest ${AWS_ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/project:staging-${GIT_SHA}

# Push to ECR
docker push ${AWS_ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/project:staging-${GIT_SHA}

# Update ECS service
aws ecs update-service --cluster staging --service project-api --force-new-deployment
```

### 3. Smoke Test

```bash
# Run smoke tests
npm run test:smoke -- --env=staging

# Manual verification
curl https://staging.project.com/health
```

### 4. Deploy to Production

```bash
# Tag for production
docker tag project:latest ${AWS_ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/project:production-${GIT_SHA}

# Push to ECR
docker push ${AWS_ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/project:production-${GIT_SHA}

# Update ECS service
aws ecs update-service --cluster production --service project-api --force-new-deployment

# Monitor deployment
aws ecs wait services-stable --cluster production --services project-api
```

---

## Post-Deployment

### Verification

```bash
# Check health endpoints
curl https://project.com/health
curl https://project.com/health/db
curl https://project.com/health/cache

# Check logs
aws logs tail /ecs/production --follow
```

### Notify

- [ ] Update #releases channel
- [ ] Verify monitoring dashboards
- [ ] Check error tracking (Sentry)
- [ ] Verify key user flows

---

## Rollback

### Quick Rollback

```bash
# List previous deployments
aws ecs describe-services --cluster production --services project-api

# Rollback to previous task definition
aws ecs update-service \
  --cluster production \
  --service project-api \
  --task-definition project-api:PREVIOUS_VERSION
```

### Database Rollback

> **WARNING**: Only if absolutely necessary and approved by senior engineer.

```bash
# Check migration status
npm run db:migrate:status

# Rollback last migration
npm run db:migrate:down
```

---

## Troubleshooting

### Health Check Failures

1. Check container logs: `aws logs tail /ecs/production`
2. Check application logs in Datadog
3. Verify environment variables are set
4. Check database connectivity

### Deployment Stuck

1. Check for stuck deployments in ECS console
2. Force new deployment if needed
3. Verify security groups allow traffic

### Database Connection Issues

1. Verify RDS is accessible
2. Check security group rules
3. Verify connection string format
4. Check connection pool settings

---

## Contact

- DevOps: devops@company.com
- On-call: See PagerDuty
