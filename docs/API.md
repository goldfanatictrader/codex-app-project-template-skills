# API Documentation

---

## Overview

Base URL: `https://api.project.com/v1`

All requests must include:
```http
Content-Type: application/json
Authorization: Bearer <token>
```

## Authentication

### POST /auth/login

**Request:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response (200):**
```json
{
  "accessToken": "eyJhbG...",
  "refreshToken": "eyJhbG...",
  "expiresIn": 3600,
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "John Doe"
  }
}
```

### POST /auth/refresh

**Request:**
```json
{
  "refreshToken": "eyJhbG..."
}
```

### POST /auth/logout

**Request:**
```json
{
  "refreshToken": "eyJhbG..."
}
```

---

## Users

### GET /users

**Query Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| page | number | 1 | Page number |
| limit | number | 20 | Items per page |
| sort | string | createdAt | Sort field |
| order | string | desc | Sort order |

**Response (200):**
```json
{
  "data": [
    {
      "id": "uuid",
      "email": "user@example.com",
      "name": "John Doe",
      "createdAt": "2024-01-01T00:00:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "pages": 5
  }
}
```

### GET /users/:id

**Response (200):**
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "name": "John Doe",
  "createdAt": "2024-01-01T00:00:00Z",
  "updatedAt": "2024-01-01T00:00:00Z"
}
```

### POST /users

**Request:**
```json
{
  "email": "user@example.com",
  "name": "John Doe",
  "password": "securePassword123"
}
```

### PUT /users/:id

### DELETE /users/:id

---

## Error Responses

All errors follow this format:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message",
    "details": [],
    "requestId": "uuid"
  }
}
```

### Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| VALIDATION_ERROR | 400 | Invalid request body |
| UNAUTHORIZED | 401 | Missing or invalid token |
| FORBIDDEN | 403 | Insufficient permissions |
| NOT_FOUND | 404 | Resource not found |
| CONFLICT | 409 | Resource already exists |
| RATE_LIMITED | 429 | Too many requests |
| INTERNAL_ERROR | 500 | Server error |

---

## Rate Limits

| Endpoint | Limit | Window |
|----------|-------|--------|
| /auth/* | 5 | 1 minute |
| /api/* | 100 | 1 minute |
| /api/* (authenticated) | 1000 | 1 minute |
