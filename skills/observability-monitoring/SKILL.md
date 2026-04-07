---
name: observability-monitoring
description: Use when defining or reviewing logs, metrics, tracing, alerting, health checks, and operational visibility for an app in staging or production.
version: 1.0.0
created: 2026-04-08
author: User
license: MIT
compatibility:
  - codex app
categories:
  - observability
  - monitoring
  - operations
tags:
  - observability
  - monitoring
  - alerting
  - telemetry
---

# Observability Monitoring

Use this skill to make systems understandable under real load and failure.

## Workflow

1. Identify critical user and system flows.
2. Define what should be logged, metered, and traced.
3. Map health checks and SLO-relevant signals.
4. Review alerting thresholds and ownership.
5. Highlight blind spots that will slow debugging or incident response.

## Minimum Coverage

- structured application logs;
- request or job correlation IDs;
- success and failure metrics for critical paths;
- latency and error-rate visibility;
- health endpoints; and
- alerting for production-impacting failures.

## Output Contract

Use this observability packet:

```md
# Observability Coverage Packet

## Critical Flows
- Flow 1
- Flow 2

## Signal Matrix
| Flow | Logs | Metrics | Traces | Alerts | Owner |
|------|------|---------|--------|--------|-------|
| login | yes/no | yes/no | yes/no | yes/no | ... |

## Health Checks
- Readiness signal
- Liveness signal
- Dependency signal

## Dashboard Needs
- Dashboard 1
- Dashboard 2

## Alerting Gaps
- Gap 1
- Gap 2

## Blind Spots
- Blind spot 1
- Blind spot 2

## Recommended Next Step
- Usually: `$debugging-incident`, `$infra-environments`, or `$security-production-readiness`
```

## Output Format

Report:

1. key signals required;
2. logging coverage;
3. metrics and dashboards needed;
4. alerts worth adding; and
5. current blind spots.

## Rules

- Prefer signals tied to user impact.
- Avoid logging secrets or sensitive payloads.
- Good observability is for diagnosis, not just dashboards.
- Every output should identify who owns the alert or signal when it fires.
