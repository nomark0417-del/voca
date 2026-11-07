---
name: superpowers
description: >-
  Jesse Vincent's (obra/superpowers) agentic engineering framework and software development methodology.
  Enforces structured engineering phases: Brainstorming, Spec & Planning, Subagent-Driven Execution,
  Test-Driven Development (TDD), Systematic Debugging, Pre-completion Verification, and Rigorous Code Review.
---

# ⚡ Superpowers: Engineering Discipline & Agentic Execution Suite

Superpowers is an opinionated software development methodology created by Jesse Vincent (@obra).
It transforms an AI coding agent from a "yolo coder" into a disciplined, high-leverage software engineer by enforcing rigorous separation of concerns, test-driven validation, and subagent orchestration.

---

## 🧭 The Core Superpowers Workflow

```
[1. Brainstorming] ──▶ [2. Spec & Planning] ──▶ [3. Subagent Execution]
                              │                          │
                              ▼                          ▼
                   [4. True Red/Green TDD] ──▶ [5. Verification & Review]
```

### The 7 Core Tenets
1. **Never "yolo" into code**: Clarify intent, challenge assumptions, and gain explicit approval before editing code.
2. **YAGNI & Simplicity**: Build the simplest, most primitive version that delivers value today. Avoid premature abstraction.
3. **True Red/Green TDD**: Write a failing test first that reproduces the missing feature or bug. Watch it fail, then write minimal code to make it pass.
4. **Isolate with Worktrees & Subagents**: Execute complex tasks using subagents or worktrees so your main branch stays stable.
5. **Systematic Debugging**: The Iron Law: *Never attempt a fix without isolating the reproducing root cause first.*
6. **Zero Regression Verification**: Run full builds, type checks, and tests before claiming a task is done.
7. **Two-Way Code Review**: Inspect diffs against the original spec before merging.

---

## 🛠️ The Superpowers Skill Directory

### Phase 1: Decide & Plan
- **`brainstorming`**:
  - Explore user intent and edge cases before choosing an implementation path.
  - Present 2–3 trade-off approaches with pros/cons.
  - Wait for user feedback and confirmation.
- **`writing-plans`**:
  - Convert approved ideas into actionable, bite-sized tasks.
  - Define acceptance criteria and testable deliverables for each step.

### Phase 2: Implement & Coordinate
- **`subagent-driven-development`**:
  - Break tasks into independent units and dispatch focused subagents (`invoke_subagent`).
  - Keep main context clean; let subagents return verified diffs and logs.
- **`using-git-worktrees`**:
  - Create isolated branches or worktrees for risky, breaking, or experimental refactors.
- **`executing-plans`**:
  - Follow the approved plan sequentially, checking off items as they pass tests.

### Phase 3: Test & Debug
- **`test-driven-development` (TDD)**:
  - 1. **Red**: Write a test verifying the desired behavior. Confirm failure.
  - 2. **Green**: Write the simplest code to make the test pass.
  - 3. **Refactor**: Clean up duplication, naming, and structure without breaking tests.
- **`systematic-debugging`**:
  - Never guess or throw speculative fixes at symptoms.
  - Trace logs, isolate minimal failing inputs, and form a testable hypothesis.
  - Prove the hypothesis before applying an atomic fix.

### Phase 4: Review & Finish
- **`verification-before-completion`**:
  - Run `npm run build`, linting, and all test suites locally.
  - Check `git status` and `git diff` for stray files, debug logs, or unintended modifications.
- **`requesting-code-review`**:
  - Summarize changes, trade-offs, and test evidence.
  - Request approval before pushing to production or merging to `main`.

---

## 🎯 How to Trigger Superpowers

You can invoke Superpowers behaviors in any conversation:
- *"스펙 작성해줘 (write spec using superpowers)"*
- *"TDD 방식으로 구현해줘 (implement with TDD)"*
- *"원인 먼저 디버깅해줘 (systematic debugging)"*
- *"서브에이전트로 분할 작업해줘 (subagent-driven development)"*
- *"코드 리뷰 및 머지 검증해줘 (code review before finish)"*
