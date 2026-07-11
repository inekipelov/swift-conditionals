# README Positioning Design

## Goal

Make the repository README a concise entry point for both pure Swift and
SwiftUI consumers. A developer should understand the package's value, see a
representative use case for their target, and know how to add the dependency
without reading source code or generated documentation.

## Audience

- Swift developers who need typed, composable platform and availability checks
  when selecting ordinary values or behavior.
- SwiftUI developers who need the same conditions when transforming views,
  builders, or concrete SwiftUI values.

## Structure

### Positioning

Keep the existing package name and lead with a short statement that
`Conditionals` provides typed, composable conditions for Swift values and
SwiftUI content. The existing platform and Swift-version badges remain.

### Why

Add a short factual list that communicates the differentiators:

- typed conditions instead of unstructured Boolean flags;
- lazy branch evaluation;
- condition composition with `allOf`, `anyOf`, and `not`;
- a core target that does not depend on SwiftUI.

### Swift

Add one short, compiling example that selects an ordinary value through
`ConditionalValue.value`. The example combines a platform/version condition
with `not` or `allOf`, demonstrating that the same API is useful outside UI
code. It must use actual public API names and avoid a contrived product domain.

### SwiftUI

Retain one focused `Button` example. It should show a `ConditionKey` passed to
`.conditional` on the label, where a view transform is needed for the modifier
to affect the label. The example demonstrates the SwiftUI module without
duplicating the core Swift example.

### What You Can Check

Include one compact capability list, not a type-by-type inventory:

- platforms, OS versions, and WWDC SDK baselines;
- device idioms and app-extension points;
- condition compositions;
- SwiftUI views, builders, and concrete value types.

### Installation and Related Work

Keep the current Swift Package Manager snippet and the existing concise link to
Aeastr/Conditionals. Do not add a compatibility section because the badge row
already communicates supported platform baselines.

## Boundaries

- Do not turn the README into an API reference; detailed coverage belongs in
  DocC.
- Do not add a feature matrix, all supported SwiftUI types, or marketing claims
  that cannot be verified from the package.
- Do not change public API, package metadata, or runtime behavior.

## Verification

- Code snippets must type-check against the current public API.
- `swift test -Xswiftc -warnings-as-errors` must pass.
- `git diff --check` must report no formatting defects.
