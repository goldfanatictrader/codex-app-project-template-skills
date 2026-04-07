---
name: coding-assistant
description: General coding assistant skill - best practices, code review, refactoring, and implementation guidelines
version: 1.0.0
created: 2026-04-07
author: User
license: MIT
compatibility:
  - codex app
categories:
  - coding
  - development
  - best-practices
tags:
  - coding
  - code-review
  - refactoring
  - best-practices
  - implementation
---

# Coding Assistant Skill

## Core Principles

1. **Readability First**: Code is read more than written
2. **Simplicity**: Prefer simple solutions over clever ones
3. **Consistency**: Follow existing patterns in the codebase
4. **Testability**: Write code that can be tested
5. **Documentation**: Document the why, not just the what

## Session Workflow

### 1. Understand Before Implementing

Before writing any code:
- [ ] Understand the problem fully
- [ ] Check existing codebase for similar patterns
- [ ] Review `memory/context/` or `context/` for project conventions
- [ ] Ask clarifying questions if needed
- [ ] Plan the approach

### 2. Implementation Guidelines

#### File Organization
```
src/
├── components/       # Reusable UI components
│   ├── ComponentName/
│   │   ├── index.ts      # Public exports
│   │   ├── ComponentName.tsx
│   │   └── ComponentName.test.tsx
├── services/        # Business logic layer
├── utils/          # Pure utility functions
├── types/          # TypeScript type definitions
├── constants/      # Application constants
└── config/         # Configuration files
```

#### Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Files | kebab-case or PascalCase | `user-service.ts`, `UserProfile.tsx` |
| Functions | camelCase, verb prefix | `getUserById()`, `calculateTotal()` |
| Classes | PascalCase | `UserService`, `PaymentProcessor` |
| Constants | SCREAMING_SNAKE | `MAX_RETRY_COUNT`, `API_BASE_URL` |
| Boolean vars | is/has/can prefix | `isActive`, `hasPermission` |
| React components | PascalCase | `<UserProfile />` |
| Custom hooks | use prefix | `useAuth()`, `useTheme()` |

#### Code Structure

**Functions should:**
- Do one thing well
- Be short (ideally < 30 lines)
- Have a clear name
- Have explicit return types
- Handle errors explicitly

**Good Example:**
```typescript
async function getUserById(id: string): Promise<User | null> {
  if (!id) {
    throw new ValidationError('User ID is required');
  }
  
  try {
    const user = await userRepository.findById(id);
    return user ?? null;
  } catch (error) {
    logger.error('Failed to fetch user', { id, error });
    throw new DatabaseError('Failed to fetch user');
  }
}
```

**Bad Example:**
```typescript
async function getUser(id) {  // No types, implicit any
  const user = await userRepository.findById(id);
  return user;
}
```

### 3. Testing Guidelines

**Test file location:**
```
src/
├── services/
│   └── user.service.ts
tests/
├── unit/
│   └── user.service.test.ts
└── integration/
    └── user.service.integration.spec.ts
```

**Test structure (AAA pattern):**
```typescript
describe('UserService', () => {
  describe('createUser', () => {
    it('should create user with hashed password', async () => {
      // Arrange
      const input = { email: 'test@example.com', password: 'password123' };
      
      // Act
      const user = await userService.createUser(input);
      
      // Assert
      expect(user.password).not.toBe(input.password);
      expect(await bcrypt.compare(input.password, user.password)).toBe(true);
    });
    
    it('should throw ValidationError for duplicate email', async () => {
      // ...
    });
  });
});
```

### 4. Error Handling

**Always handle errors explicitly:**
```typescript
// ✅ Good: Specific error handling
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  if (error instanceof ValidationError) {
    throw error;  // Re-throw known errors
  }
  logger.error('Unexpected error', { error });
  throw new InternalError('Operation failed');
}

// ❌ Bad: Swallowing errors
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  // Silent failure
}
```

**Error response format:**
```typescript
interface ApiError {
  code: string;      // Machine-readable: 'VALIDATION_ERROR'
  message: string;   // Human-readable
  details?: any[];   // Optional field-level errors
  requestId: string; // For debugging
}
```

### 5. Code Review Checklist

Before completing any code:

- [ ] Code follows naming conventions
- [ ] Functions are small and focused
- [ ] Types are explicit (no implicit any)
- [ ] Errors are handled explicitly
- [ ] No commented-out code
- [ ] No hardcoded values (use constants)
- [ ] Tests cover the logic
- [ ] Tests follow AAA pattern
- [ ] Documentation updated if needed

### 6. Refactoring Guidelines

**When refactoring:**
1. Ensure tests exist first
2. Make small, incremental changes
3. Run tests after each change
4. Don't change behavior, only structure
5. Update memory if architectural changes made

**Signs code needs refactoring:**
- Function > 50 lines
- > 3 levels of nesting
- Too many parameters (> 4)
- Deeply coupled modules
- Duplicate code

### 7. Git Workflow

**Branch naming:**
```
feature/user-authentication
fix/payment-validation-error
hotfix/security-patch
refactor/extract-user-service
docs/add-api-documentation
```

**Commit message format:**
```
type(scope): description

[optional body]

Types: feat, fix, docs, style, refactor, test, chore
```

## Project Memory Integration

### Before Writing Code
1. Read `memory/PROJECT.md` or `PROJECT.md` for context
2. Check `memory/DECISIONS.md` or `DECISIONS.md` for rationale
3. Review `memory/context/conventions.md` or `context/conventions.md` for style

### After Writing Code
1. Update `memory/PROJECT.md` or `PROJECT.md` if:
   - New files created (update active files)
   - Architecture changed (update architecture section)
   - Tasks completed (update task status)
2. Add to `memory/DECISIONS.md` or `DECISIONS.md` if:
   - New patterns introduced
   - Architectural decisions made
   - Technology choices made

## Language-Specific Notes

### TypeScript
- Enable strict mode
- Use explicit types, avoid `any`
- Use interfaces for object shapes
- Use type aliases for unions
- Prefer `unknown` over `any` when type is unclear

### Python
- Follow PEP 8
- Use type hints
- Use dataclasses for data objects
- Use async/await for I/O

### General
- Follow language idioms
- Use linters and formatters
- Run type checkers
- Maintain consistent style

## Quick Commands

```bash
# Run linter
npm run lint

# Run type check
npm run typecheck

# Run tests
npm test

# Run all checks
npm run check
```

---

*Coding Assistant Skill v1.0.0*
