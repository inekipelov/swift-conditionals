# SwiftUI ConditionalValue Expansion

## Goal

Extend `ConditionalsSwiftUI` with core concrete SwiftUI value types while
preserving one type-centric syntax and strict typing for both branches.

```swift
Color.value(.iOS26, .blue, else: .cyan)
Font.value(.iPad, .title, else: .body)
Material.value(.visionOS, .thin, else: .regular)
```

Each call returns `Self`. The `then` and `else` values must have one concrete
type.

## API Principles

- Use the existing `ConditionalValue` without new selection methods.
- Add explicit conformances only to concrete public SwiftUI value types.
- Do not use type erasure, including `AnyShapeStyle` or other `Any*` types.
- Do not add overloads that select between different `ShapeStyle` implementations.
- Do not turn runtime environment values, such as dark mode, into static
  `Condition`.
- Preserve the exact availability of each SwiftUI type on every supported
  platform.

`Color` remains a context-dependent SwiftUI value. A condition selects one of
two `Color` objects, while SwiftUI resolves its light or dark variant during
rendering.

## Supported Types

### Appearance

- `Color`
- `Gradient`
- `LinearGradient`
- `RadialGradient`
- `AngularGradient`
- `EllipticalGradient`
- `Material`
- existing `ColorScheme`, `ColorSchemeContrast`, `LegibilityWeight`

### Typography

- `Font`
- `Font.Design`
- `Font.Weight`
- `Font.TextStyle`
- `Font.Leading`
- `Font.Width`
- `TextAlignment`
- `Text.TruncationMode`
- existing `DynamicTypeSize`, `SubmitLabel`

### Layout

- `Alignment`
- `HorizontalAlignment`
- `VerticalAlignment`
- `UnitPoint`
- `Edge`
- `Edge.Set`
- `Axis`
- `Axis.Set`
- `ContentMode`
- `PinnedScrollableViews`
- existing `LayoutDirection`, `UserInterfaceSizeClass`

### Rendering

- `BlendMode`
- `Image.Scale`
- `FillStyle`
- `StrokeStyle`
- `RoundedCornerStyle`
- existing `SymbolRenderingMode`, `SymbolVariants`

### Behavior

- `Animation`
- `RedactionReasons`
- existing `ScenePhase`, `ControlSize`, `EditMode`, `Visibility`

### Navigation and presentation

- existing `ToolbarItemPlacement`, `CommandGroupPlacement`, `ToolbarRole`
- existing `NavigationSplitViewVisibility`, `PresentationDetent`
- existing `PresentationBackgroundInteraction`, `TabPlacement`

Before implementation, verify every new type against the current SwiftUI SDK.
Exclude a type when it is unavailable as a public concrete type or requires type
erasure to align the branches.

## Source Organization

Split the current monolithic `ConditionalValue+SwiftUI.swift` by purpose:

```text
Sources/ConditionalsSwiftUI/ConditionalValues/
|-- Appearance.swift
|-- Typography.swift
|-- Layout.swift
|-- Rendering.swift
|-- Behavior.swift
`-- NavigationAndPresentation.swift
```

Each file contains only `import SwiftUI`, availability annotations, and
`ConditionalValue` conformances. The selection logic remains solely in the
`Conditionals` module.

## Data Flow

1. A client calls `SomeSwiftUIType.value(condition, then, else:)`.
2. The `ConditionalValue` implementation passes both branches to `ConditionKey`.
3. `ConditionKey` evaluates the static `Condition` and returns a value of the
   same concrete type.
4. SwiftUI receives an ordinary value without a wrapper type or type erasure.

## Errors and Constraints

- Mismatched branch types must produce a compile-time error.
- Environment-dependent state is not supported as a `ConditionKey` because the
  current `Condition` does not receive `EnvironmentValues`.
- The availability of new conformances must not raise the minimum versions of
  the entire package.
- The README retains its single usage example; the new API surface requires no
  separate specialized syntax.

## Testing

- Split SwiftUI value compile-smoke tests into the same categories as the
  sources.
- Compile a `.value(...)` call with same-type branches for every new type.
- Add branch-selection checks for `Color` because it supports comparison.
- Use `#available` and the same platform guards as the sources for APIs with
  higher availability.
- Run `swift test`; existing core and builder tests must pass with unchanged
  behavior.

## Completion Criteria

- Every listed concrete type available in the SDK supports `.value(...)`.
- The public API contains no new type-erased wrapper types.
- The file structure reflects the purpose of each type.
- All package tests pass on Swift 6.
