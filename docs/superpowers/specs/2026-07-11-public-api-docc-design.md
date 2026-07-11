# Public API DocC Coverage

## Goal

Make the public APIs of `Conditionals` and `ConditionalsSwiftUI` understandable from Quick Help and the generated DocC catalog without reading their implementations. Documentation must explain not only each symbol's purpose but also important semantics: lazy branch evaluation, composition short-circuiting, availability, and platform constraints.

## Scope

Document every public symbol in `Sources/Conditionals` and `Sources/ConditionalsSwiftUI`:

- protocols, structures, enumerations, and associated requirements;
- `ConditionKey` initializers, properties, methods, and factories;
- `allOf`, `anyOf`, and `not` compositions;
- platform, version, WWDC, and extension-point conditions;
- SwiftUI builder extensions and view modifiers;
- public `ConditionalValue` conformances in the standard library and SwiftUI.

Internal helper types and implementation details are excluded from the public catalog.

## Comment Style

### Core API

Use expanded comments for `Condition`, `ConditionKey`, `ConditionalValue`, compositions, and SwiftUI modifiers:

- a concise summary on the first line;
- an explanation of behavior and evaluation timing;
- a small compiling example for primary entry points;
- `- Parameters:` and `- Returns:` for functions;
- `> Important:` or `> Note:` only for material constraints;
- an explicit description of short-circuiting and the fact that the unselected branch is not evaluated.

Documentation parameter names must match their signatures. Examples use the library's existing syntactic sugar and introduce no fictional API.

### Repeated Conditions

Platform and version types use a compact but complete template:

- what is checked;
- when `then` or `else` is selected;
- a description of the static `ConditionKey`;
- parameters and return value for `perform`.

The same wording is acceptable for API generations when platform names and versions are correct. Do not add examples to every such type, so the catalog does not become overloaded with duplication.

### ConditionalValue conformances

Each conformance gets a one-line description of its ability to select a value through `ConditionalValue.value`. Availability remains the source of minimum-version information and is not duplicated in prose.

## DocC Structure

Create a DocC catalog for each library product:

- a landing page with the module's purpose and a minimal example;
- topic groups for the core API, compositions, platforms, SDK generations, extensions, and SwiftUI integration;
- links between related symbols through DocC symbol links;
- separate conceptual pages only where inline comments are insufficient: condition composition and SwiftUI integration.

The `ConditionalsSwiftUI` catalog explicitly states that the module re-exports `Conditionals` and requires SwiftUI without duplicating core API documentation.

## Verification

Confirm completion with the following checks:

- the symbol graph contains no public declarations without documentation comments;
- `swift package generate-documentation` or an equivalent `xcodebuild docbuild` finishes without DocC warnings;
- examples use existing public signatures;
- `swift test -Xswiftc -warnings-as-errors` passes;
- the iOS, tvOS, and watchOS compile matrix continues to build with `-warnings-as-errors`;
- `git diff --check` finds no formatting defects.

If the local toolchain does not include a DocC plugin, record that as a limitation while symbol graph generation and Swift builds remain required checks.

## Constraints

- Documentation is written in English to align with API naming and the repository README.
- Public signatures and runtime semantics do not change.
- A separate hosted documentation deployment is out of scope for this pass.
- Do not copy Apple API documentation; use symbol links and concise descriptions of conformance roles.
