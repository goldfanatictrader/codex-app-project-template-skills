---
name: coding-conventions
description: Coding standards, style guide, and conventions
version: 1.0.0
created: 2026-04-07
---

# Coding Conventions

---

## 1. General Guidelines

### Philosophy
- Write code for humans first, computers second
- Prefer clarity over cleverness
- Follow existing patterns in the codebase
- Keep functions small and focused
- Name things descriptively

### Code Review Checklist
- [ ] Code follows style guide
- [ ] Functions are small and testable
- [ ] No commented-out code
- [ ] No hardcoded values (use constants)
- [ ] Error handling is appropriate
- [ ] Tests cover the logic
- [ ] Documentation updated if needed

---

## 2. File Organization

### Naming Conventions
| Type | Convention | Example |
|------|------------|---------|
| Files (general) | kebab-case | `user-service.ts` |
| React Components | PascalCase | `UserProfile.tsx` |
| Classes | PascalCase | `UserService` |
| Interfaces | PascalCase (+ I prefix optional) | `User` or `IUser` |
| Type Aliases | PascalCase | `UserRole` |
| Constants | SCREAMING_SNAKE | `MAX_RETRY_COUNT` |
| Test files | `.test.ts` or `.spec.ts` | `user.test.ts` |

### File Structure
```
src/
├── components/       # Reusable components
│   ├── ComponentName/
│   │   ├── index.ts      # Public exports
│   │   ├── ComponentName.tsx
│   │   ├── ComponentName.test.tsx
│   │   └── styles.ts
├── services/        # Business logic
├── utils/           # Helper functions
├── types/           # TypeScript types
├── constants/       # Constants
└── config/          # Configuration
```

---

## 3. TypeScript Conventions

### Type Definitions
```typescript
// ✅ Good: Explicit types
interface User {
  id: string;
  name: string;
  email: string;
}

// ✅ Good: Use types for unions
type UserRole = 'admin' | 'user' | 'guest';

// ✅ Good: Generic constraints
function getById<T extends { id: string }>(items: T[], id: string): T | undefined {
  return items.find(item => item.id === id);
}

// ❌ Bad: Using 'any'
function process(data: any) { }

// ❌ Bad: Implicit 'any'
function process(data) { }
```

### Null Handling
```typescript
// ✅ Good: Explicit null checks
if (user !== null && user !== undefined) {
  // ...
}

// ✅ Good: Optional chaining
const city = user?.address?.city;

// ✅ Good: Nullish coalescing
const name = user.name ?? 'Anonymous';

// ❌ Bad: Non-null assertion without check
const name = user!.name;
```

---

## 4. Function Conventions

### Naming
| Type | Convention | Example |
|------|------------|---------|
| Functions | camelCase, verb prefix | `getUserById()`, `calculateTotal()` |
| Boolean functions | is/has/can prefix | `isActive`, `hasPermission` |
| Event handlers | handle prefix | `handleClick()` |
| Custom hooks | use prefix | `useAuth()` |

### Parameters
```typescript
// ✅ Good: Descriptive names
function createUser(email: string, password: string): User { }

// ✅ Good: Destructuring for objects
function createUser({ email, password }: CreateUserInput): User { }

// ✅ Good: Optional parameters with defaults
function sendEmail(to: string, subject: string = 'Hello'): void { }

// ❌ Bad: Unclear parameter names
function createUser(e: string, p: string) { }
```

### Return Types
```typescript
// ✅ Good: Always specify return type for exported functions
export function getUserById(id: string): Promise<User> { }

// ✅ Good: Void for side effects
function logMessage(message: string): void { }
```

---

## 5. Async Code

### Promises vs Async/Await
```typescript
// ✅ Preferred: Async/await
async function fetchUser(id: string): Promise<User> {
  const response = await api.get(`/users/${id}`);
  return response.data;
}

// ✅ Good: Promise chains (when appropriate)
function fetchUser(id: string): Promise<User> {
  return api.get(`/users/${id}`)
    .then(response => response.data);
}
```

### Error Handling
```typescript
// ✅ Good: Try-catch with async/await
async function getUser(id: string): Promise<User> {
  try {
    const response = await api.get(`/users/${id}`);
    return response.data;
  } catch (error) {
    if (error instanceof NotFoundError) {
      throw error;
    }
    logger.error('Failed to fetch user', { id, error });
    throw new Error('Failed to fetch user');
  }
}
```

---

## 6. React Conventions (if applicable)

### Component Structure
```typescript
// 1. Imports
import React from 'react';
import { useAuth } from '@/hooks/useAuth';
import styles from './UserCard.module.css';

// 2. Types
interface UserCardProps {
  user: User;
  onEdit?: (user: User) => void;
}

// 3. Component
export function UserCard({ user, onEdit }: UserCardProps) {
  // 4. Hooks
  const { isAdmin } = useAuth();
  
  // 5. Handlers
  const handleEdit = () => {
    onEdit?.(user);
  };
  
  // 6. Render
  return (
    <div className={styles.card}>
      <h3>{user.name}</h3>
      {/* ... */}
    </div>
  );
}
```

### Hooks Rules
- Call hooks at the top level only
- Call hooks from React functions only
- Custom hooks must start with 'use'

---

## 7. Testing Conventions

### Test File Naming
```
user.service.ts
├── user.service.test.ts      # Unit tests
├── user.service.integration.spec.ts  # Integration tests
└── __mocks__/
    └── user.repository.ts    # Mock implementations
```

### Test Structure (AAA Pattern)
```typescript
describe('UserService', () => {
  describe('createUser', () => {
    it('should create a user with hashed password', async () => {
      // Arrange
      const input = { email: 'test@example.com', password: 'password123' };
      
      // Act
      const user = await userService.createUser(input);
      
      // Assert
      expect(user.password).not.toBe(input.password);
      expect(bcrypt.compare(input.password, user.password)).toBe(true);
    });
    
    it('should throw ValidationError for duplicate email', async () => {
      // ...
    });
  });
});
```

### Test Naming
```
✅ should create user when valid input
✅ should return null when user not found
✅ should throw error when unauthorized
❌ createUser test
❌ test 1
```

---

## 8. Git Conventions

### Branch Naming
```
feature/user-authentication
fix/payment-validation-error
hotfix/security-patch
chore/update-dependencies
refactor/extract-user-service
docs/add-api-documentation
```

### Commit Messages
```
type(scope): description

[optional body]

[optional footer]

Types:
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code restructuring
- test: Adding tests
- chore: Maintenance
```

**Examples:**
```
feat(auth): add JWT token refresh

The token was expiring too quickly, causing user frustration.
Added refresh token logic with 7-day expiry.

Closes #123
```

```
fix(cart): prevent negative quantities

Added validation to ensure quantity is always >= 1.
```

---

## 9. Documentation

### JSDoc / TSDoc
```typescript
/**
 * Retrieves a user by their unique identifier.
 * 
 * @param id - The UUID of the user
 * @returns The user object or undefined if not found
 * @throws {NotFoundError} When user does not exist
 * 
 * @example
 * const user = await getUserById('123e4567-e89b-12d3-a456-426614174000');
 */
export async function getUserById(id: string): Promise<User | undefined> {
  // ...
}
```

### README Files
Every module/package should have a README with:
1. Purpose - What it does
2. Usage - How to use it
3. API - Public interface
4. Examples - Code samples

---

## 10. Performance Guidelines

### General
- Avoid premature optimization
- Profile before optimizing
- Consider time complexity when choosing algorithms
- Use appropriate data structures

### Database
- Index frequently queried columns
- Use pagination for large datasets
- Avoid N+1 queries (use joins or batch queries)
- Don't select more columns than needed

### Caching
- Cache expensive computations
- Use appropriate TTLs
- Implement cache invalidation
- Monitor cache hit rates

---

*Last updated: YYYY-MM-DD*
