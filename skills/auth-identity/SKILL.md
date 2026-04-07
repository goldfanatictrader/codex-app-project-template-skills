---
name: auth-identity
description: Use when implementing or reviewing login, session management, account lifecycle, RBAC, OAuth, password flows, or identity-sensitive user features.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - auth
  - identity
  - security
tags:
  - authentication
  - identity
  - rbac
  - oauth
---

# Auth Identity

Use this skill when user identity and access control are core to the task.

## Workflow

1. Identify the auth model in use.
2. Define the actors, roles, and permission boundaries.
3. Review login, logout, token or session lifecycle.
4. Review account creation, recovery, and lockout flows.
5. Confirm auditability and failure handling.

## Focus Areas

- authentication method;
- token or session expiration;
- role and permission enforcement;
- password reset and recovery;
- OAuth or third-party identity trust boundaries; and
- user enumeration or unsafe error messaging.

## Output Format

Report:

1. auth model;
2. role and permission model;
3. risky flows;
4. missing safeguards; and
5. recommended next changes.

## Rules

- Separate identity, session, and authorization concerns.
- Treat permission bugs as high severity by default.
- Avoid ambiguous role logic.
