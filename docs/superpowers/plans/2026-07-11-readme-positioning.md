# README Positioning Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Present `Conditionals` clearly to both pure Swift and SwiftUI developers through two verified, representative README examples.

**Architecture:** Keep the README concise and place its narrative before installation. Add one pure Swift `ConditionalValue.value` example and retain one SwiftUI view-transform example; compile both examples in the existing Swift Testing suites so README syntax cannot drift from the public API.

**Tech Stack:** Swift 6, Swift Testing, Swift Package Manager, Markdown.

## Global Constraints

- Keep the current badge row, SPM installation snippet, and concise related-work link.
- Include exactly one representative pure Swift example and one representative SwiftUI example.
- Do not add a compatibility section, feature matrix, hosted documentation, dependencies, or public API.
- Use only existing public API names and preserve the current SwiftUI label-level transform semantics.
- `swift test -Xswiftc -warnings-as-errors` and `git diff --check` must pass.

---

### Task 1: Lock README snippets to the public API

**Files:**
- Modify: `Tests/ConditionalsTests/ConditionalValueTests.swift`
- Modify: `Tests/ConditionalsTests/SwiftUIBuilderTests.swift`

**Interfaces:**
- Consumes: `String.value(_:_:else:)`, `ConditionKey.allOf(_:_:)`, `ConditionKey.not(_:)`, `.iOS26`, `.iPad`, `View.conditional(_:_:)`, and `.wwdc25`.
- Produces: compile-smoke coverage for the exact Swift and SwiftUI snippets that will appear in `README.md`.

- [ ] **Step 1: Add the pure Swift README example test**

Add this method to `ConditionalValueTests`:

```swift
@Test func readmeSwiftExampleCompiles() {
    let buttonTitle = String.value(
        .allOf(.iOS26, .not(.iPad)),
        "Continue",
        else: "Open"
    )

    _ = buttonTitle
}
```

- [ ] **Step 2: Run the focused test to verify the current README does not yet contain the contract**

Run:

```bash
swift test --filter ConditionalValueTests/readmeSwiftExampleCompiles
```

Expected: the new compile-smoke test passes; the README has not yet been updated to expose the same snippet.

- [ ] **Step 3: Add the SwiftUI README example test**

Add this method to `SwiftUIBuilderTests`:

```swift
@MainActor
@Test func readmeSwiftUIExampleCompiles() {
    let button = Button {
        // action
    } label: {
        Label("Continue", systemImage: "arrow.right")
            .conditional(.not(.wwdc25)) {
                $0.frame(maxWidth: .infinity, alignment: .leading)
            }
    }

    _ = button
}
```

- [ ] **Step 4: Run the focused SwiftUI test**

Run:

```bash
swift test --filter SwiftUIBuilderTests/readmeSwiftUIExampleCompiles
```

Expected: the test passes and confirms the modifier is applied to the `Label`, not the enclosing `Button`.

- [ ] **Step 5: Commit the executable documentation contract**

```bash
git add Tests/ConditionalsTests/ConditionalValueTests.swift Tests/ConditionalsTests/SwiftUIBuilderTests.swift
git commit -m "test: cover README examples"
```

### Task 2: Restructure the README around Swift and SwiftUI use cases

**Files:**
- Modify: `README.md`

**Interfaces:**
- Consumes: the two compile-checked snippets from Task 1.
- Produces: a concise package overview with positioning, capabilities, two usage paths, installation, and related work.

- [ ] **Step 1: Replace the opening description and usage section**

Keep the current heading and badges. Replace the current opening paragraph and `## Usage` section with the following content immediately after the badge block:

```md
`Conditionals` is a Swift Package for expressing platform, SDK, and extension checks as typed, composable conditions. Use the same conditions to lazily select Swift values and transform SwiftUI content.

## Why

- Typed conditions instead of unstructured Boolean flags.
- Lazy branch evaluation: only the selected branch runs.
- Composable checks with `allOf`, `anyOf`, and `not`.
- A Swift-only core target; SwiftUI support is optional.

## Swift

```swift
import Conditionals

let buttonTitle = String.value(
    .allOf(.iOS26, .not(.iPad)),
    "Continue",
    else: "Open"
)
```

## SwiftUI

```swift
import ConditionalsSwiftUI

Button {
    // action
} label: {
    Label("Continue", systemImage: "arrow.right")
        .conditional(.not(.wwdc25)) {
            $0.frame(maxWidth: .infinity, alignment: .leading)
        }
}
```

## What You Can Check

- Platforms, OS versions, and WWDC SDK baselines.
- Device idioms and app-extension points.
- Combinations of conditions with `allOf`, `anyOf`, and `not`.
- SwiftUI views, builders, and concrete value types.
```

- [ ] **Step 2: Preserve installation and related work**

Leave the existing `## Installation` and `## See also` sections unchanged. Do not add a `## Compatibility` section because the badges already state the platform baselines.

- [ ] **Step 3: Review the rendered Markdown structure**

Verify that the section order is `Why`, `Swift`, `SwiftUI`, `What You Can Check`, `Installation`, then `See also`; each heading is separated from content by one blank line; and both code blocks match Task 1 exactly.

- [ ] **Step 4: Run full verification**

Run:

```bash
swift test -Xswiftc -warnings-as-errors
git diff --check
```

Expected: all tests pass with zero Swift warnings, and the diff has no whitespace errors.

- [ ] **Step 5: Commit README positioning**

```bash
git add README.md
git commit -m "docs: clarify Swift and SwiftUI usage"
```
