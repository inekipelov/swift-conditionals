# Conditionals Package Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a standalone `Conditionals` Swift package with typed conditions, value selection helpers, and SwiftUI conditional view transforms.

**Architecture:** Split the core conditional system into a small `Conditionals` target and keep SwiftUI integration in a separate target so the core remains usable without SwiftUI. Encode availability checks in concrete `Condition` implementations, compose them with static wrapper types, and expose ergonomic aliases through `Conditionals.Case`.

**Tech Stack:** Swift Package Manager, Swift standard library, Foundation, CoreGraphics, SwiftUI (optional).

---

### Task 1: Package manifest and failing API tests

**Files:**
- Create: `Package.swift`
- Create: `Tests/ConditionalsTests/ConditionalsTests.swift`

- [ ] **Step 1: Write the failing test**

```swift
import XCTest
@testable import Conditionals

final class ConditionalsTests: XCTestCase {
    func testCaseIsTrueWithAlwaysTrueCondition() {
        struct AlwaysTrue: Condition {
            static func perform<Value>(then: () -> Value, else: () -> Value) -> Value { then() }
        }

        XCTAssertTrue(Conditionals.Case<AlwaysTrue>().isTrue)
    }
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `swift test --filter ConditionalsTests/testCaseIsTrueWithAlwaysTrueCondition -v`
Expected: fail because `Conditionals` and `Condition` are not defined yet.

- [ ] **Step 3: Write minimal implementation**

Create only the package manifest and the test target scaffolding; leave all API types undefined so the test still fails for the right reason.

- [ ] **Step 4: Run test to verify it passes**

Run: `swift test --filter ConditionalsTests/testCaseIsTrueWithAlwaysTrueCondition -v`
Expected: pass after the core API exists.

- [ ] **Step 5: Commit**

```bash
git add Package.swift Tests/ConditionalsTests/ConditionalsTests.swift
git commit -m "test: define initial Conditionals API coverage"
```

### Task 2: Core condition system

**Files:**
- Create: `Sources/Conditionals/Condition.swift`
- Create: `Sources/Conditionals/Conditionals.swift`
- Create: `Sources/Conditionals/Conditionals+Case.swift`
- Create: `Sources/Conditionals/Conditionals+WWDC.swift`
- Create: `Sources/Conditionals/Conditionals+Platforms.swift`
- Create: `Sources/Conditionals/Conditionals+Compositions.swift`
- Create: `Sources/Conditionals/Conditionals+Case+Aliases.swift`
- Create: `Sources/Conditionals/Conditionals+Case+Compositions.swift`
- Create: `Sources/Conditionals/ConditionalValue.swift`
- Create: `Sources/Conditionals/ConditionalValue+StandardLibrary.swift`

- [ ] **Step 1: Write the failing tests**

Add tests for `Not`, `AnyOf`, `AllOf`, `ConditionalValue`, and alias shorthands.

- [ ] **Step 2: Run tests to verify they fail**

Run: `swift test -v`
Expected: compile failures for missing types and methods.

- [ ] **Step 3: Write minimal implementation**

Add the protocol, namespace, case carrier, presets, compositions, aliases, and standard conformances.

- [ ] **Step 4: Run tests to verify they pass**

Run: `swift test -v`
Expected: all core tests pass.

- [ ] **Step 5: Commit**

```bash
git add Sources/Conditionals
git commit -m "feat: add typed conditional core"
```

### Task 3: SwiftUI integration

**Files:**
- Create: `Sources/ConditionalsSwiftUI/View+Conditional.swift`

- [ ] **Step 1: Write the failing test or build check**

Use `swift test -v` to ensure the SwiftUI extension is compiled when available.

- [ ] **Step 2: Run to verify it fails**

Expected: missing `View.conditional(...)`.

- [ ] **Step 3: Write minimal implementation**

Add the two `conditional` overloads behind `#if canImport(SwiftUI)`.

- [ ] **Step 4: Run to verify it passes**

Run: `swift test -v`
Expected: package builds cleanly.

- [ ] **Step 5: Commit**

```bash
git add Sources/ConditionalsSwiftUI
git commit -m "feat: add SwiftUI conditional view helpers"
```

### Task 4: Documentation

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Write the failing expectation**

Check the README for the lexical `#available` limitation note.

- [ ] **Step 2: Run and verify**

Expected: limitation is documented.

- [ ] **Step 3: Write minimal implementation**

Add a short section describing the limitation and safe usage.

- [ ] **Step 4: Run to verify**

Manually inspect `README.md`.

- [ ] **Step 5: Commit**

```bash
git add README.md
git commit -m "docs: explain availability limitation"
```
