# SwiftUI Conditional Values Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Добавить строготипизированный `ConditionalValue` API для основных concrete value-типов SwiftUI и разнести conformances по назначению.

**Architecture:** Каждый поддерживаемый SwiftUI-тип явно получает `ConditionalValue`, поэтому существующие `static value(...)` всегда принимают и возвращают один `Self`. Новый runtime-код, wrapper-типы и type erasure не добавляются; монолитный список conformances и его compile-smoke тест разделяются на шесть категорий.

**Tech Stack:** Swift 6.3, SwiftUI, Swift Testing, Swift Package Manager.

## Global Constraints

- Минимальная версия tools остается `swift-tools-version: 6.0`.
- Минимальные платформы пакета остаются iOS 13, macOS 10.15, tvOS 13, watchOS 6 и visionOS 1.
- Обе ветки `.value(...)` обязаны иметь один конкретный `Self`.
- Не добавлять `AnyShapeStyle`, другие `Any*`-типы или overloads между разными `ShapeStyle`.
- Не добавлять `.darkMode` или другие environment-dependent значения как `ConditionKey`.
- Каждый conformance получает точную availability исходного SwiftUI-типа.
- `ConditionalsSwiftUI` продолжает re-export `Conditionals`.
- README сохраняет текущий единственный usage-пример.

---

### Task 1: Appearance Values

**Files:**
- Create: `Sources/ConditionalsSwiftUI/ConditionalValues/Appearance.swift`
- Create: `Tests/ConditionalsTests/SwiftUIAppearanceValueTests.swift`
- Modify: `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift`
- Modify: `Tests/ConditionalsTests/SwiftUIValueTests.swift`

**Interfaces:**
- Consumes: `ConditionalValue.value(_:_:else:)`, `ConditionKey<AlwaysTrue>`.
- Produces: `ConditionalValue` conformances for `Color`, gradient types, `Material`, `ColorScheme`, `ColorSchemeContrast`, and `LegibilityWeight`.

- [ ] **Step 1: Write the failing appearance tests**

Create `Tests/ConditionalsTests/SwiftUIAppearanceValueTests.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Appearance Values")
struct SwiftUIAppearanceValueTests {
    @Test func environmentAppearanceValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let colorScheme = ColorScheme.value(condition, .dark, else: .light)
        let contrast = ColorSchemeContrast.value(condition, .increased, else: .standard)
        let legibility = LegibilityWeight.value(condition, .bold, else: .regular)

        _ = colorScheme
        _ = contrast
        _ = legibility
    }

    @Test func concreteAppearanceValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let color = Color.value(condition, .red, else: .blue)
        let gradient = Gradient.value(
            condition,
            Gradient(colors: [.red, .blue]),
            else: Gradient(colors: [.blue, .red])
        )
        let linear = LinearGradient.value(
            condition,
            LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing),
            else: LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing)
        )
        let radial = RadialGradient.value(
            condition,
            RadialGradient(colors: [.red, .blue], center: .center, startRadius: 0, endRadius: 20),
            else: RadialGradient(colors: [.blue, .red], center: .center, startRadius: 0, endRadius: 20)
        )
        let angular = AngularGradient.value(
            condition,
            AngularGradient(colors: [.red, .blue], center: .center),
            else: AngularGradient(colors: [.blue, .red], center: .center)
        )

        #expect(color == .red)
        _ = gradient
        _ = linear
        _ = radial
        _ = angular
    }

    @Test func modernAppearanceValuesCompileWhenAvailable() {
        if #available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *) {
            let condition = ConditionKey<AlwaysTrue>()
            let elliptical = EllipticalGradient.value(
                condition,
                EllipticalGradient(colors: [.red, .blue]),
                else: EllipticalGradient(colors: [.blue, .red])
            )
            let material = Material.value(condition, .thin, else: .regular)

            _ = elliptical
            _ = material
        }
    }
}
#endif
```

- [ ] **Step 2: Run the appearance tests and verify the red state**

Run:

```bash
swift test --filter SwiftUIAppearanceValueTests
```

Expected: compilation fails because `Color`, `Gradient`, gradient view types, and `Material` do not conform to `ConditionalValue`.

- [ ] **Step 3: Add appearance conformances and move existing ones**

Create `Sources/ConditionalsSwiftUI/ConditionalValues/Appearance.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Color: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Gradient: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension LinearGradient: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension RadialGradient: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension AngularGradient: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension EllipticalGradient: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension Material: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension ColorScheme: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension ColorSchemeContrast: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension LegibilityWeight: ConditionalValue {}
#endif
```

Remove these three conformance blocks from `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift`:

```swift
extension ColorScheme: ConditionalValue {}
extension ColorSchemeContrast: ConditionalValue {}
extension LegibilityWeight: ConditionalValue {}
```

Remove the corresponding declarations and `_ =` lines from `SwiftUIValueTests.coreSwiftUIValuesCompile()`:

```swift
let colorScheme = ColorScheme.value(...)
let colorSchemeContrast = ColorSchemeContrast.value(...)
let legibility = LegibilityWeight.value(...)
```

- [ ] **Step 4: Run the focused tests and verify green**

Run:

```bash
swift test --filter SwiftUIAppearanceValueTests
```

Expected: all tests in `SwiftUIAppearanceValueTests` pass.

- [ ] **Step 5: Run the full package tests**

Run:

```bash
swift test
```

Expected: all suites pass with zero failures.

- [ ] **Step 6: Commit appearance support**

```bash
git add Sources/ConditionalsSwiftUI/ConditionalValues/Appearance.swift Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift Tests/ConditionalsTests/SwiftUIAppearanceValueTests.swift Tests/ConditionalsTests/SwiftUIValueTests.swift
git commit -m "feat: add SwiftUI appearance conditional values"
```

---

### Task 2: Typography Values

**Files:**
- Create: `Sources/ConditionalsSwiftUI/ConditionalValues/Typography.swift`
- Create: `Tests/ConditionalsTests/SwiftUITypographyValueTests.swift`
- Modify: `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift`
- Modify: `Tests/ConditionalsTests/SwiftUIValueTests.swift`

**Interfaces:**
- Consumes: the unchanged `ConditionalValue` protocol and static `.value(...)` methods.
- Produces: concrete font, text-alignment, truncation, dynamic-type, and submit-label conformances.

- [ ] **Step 1: Write the failing typography tests**

Create `Tests/ConditionalsTests/SwiftUITypographyValueTests.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Typography Values")
struct SwiftUITypographyValueTests {
    @Test func typographyValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let font = Font.value(condition, .title, else: .body)
        let design = Font.Design.value(condition, .rounded, else: .default)
        let weight = Font.Weight.value(condition, .bold, else: .regular)
        let textStyle = Font.TextStyle.value(condition, .headline, else: .body)
        let leading = Font.Leading.value(condition, .tight, else: .loose)
        let alignment = TextAlignment.value(condition, .leading, else: .trailing)
        let truncation = Text.TruncationMode.value(condition, .head, else: .tail)
        let dynamicTypeSize = DynamicTypeSize.value(condition, .xxxLarge, else: .small)
        let submitLabel = SubmitLabel.value(condition, .done, else: .go)

        _ = font
        _ = design
        _ = weight
        _ = textStyle
        _ = leading
        _ = alignment
        _ = truncation
        _ = dynamicTypeSize
        _ = submitLabel
    }

    @Test func fontWidthCompilesWhenAvailable() {
        if #available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *) {
            let width = Font.Width.value(ConditionKey<AlwaysTrue>(), .expanded, else: .standard)
            _ = width
        }
    }
}
#endif
```

- [ ] **Step 2: Verify the typography tests fail to compile**

Run:

```bash
swift test --filter SwiftUITypographyValueTests
```

Expected: compilation fails on the first new font or text type without `ConditionalValue`.

- [ ] **Step 3: Add typography conformances and remove their old declarations**

Create `Sources/ConditionalsSwiftUI/ConditionalValues/Typography.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font.Design: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font.Weight: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font.TextStyle: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font.Leading: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension Font.Width: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension TextAlignment: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Text.TruncationMode: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension DynamicTypeSize: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension SubmitLabel: ConditionalValue {}
#endif
```

Remove `DynamicTypeSize` and `SubmitLabel` conformance blocks from `ConditionalValue+SwiftUI.swift`. Remove their declarations and `_ =` lines from `SwiftUIValueTests.coreSwiftUIValuesCompile()`.

- [ ] **Step 4: Run focused and full tests**

```bash
swift test --filter SwiftUITypographyValueTests
swift test
```

Expected: both commands finish with zero failures.

- [ ] **Step 5: Commit typography support**

```bash
git add Sources/ConditionalsSwiftUI/ConditionalValues/Typography.swift Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift Tests/ConditionalsTests/SwiftUITypographyValueTests.swift Tests/ConditionalsTests/SwiftUIValueTests.swift
git commit -m "feat: add SwiftUI typography conditional values"
```

---

### Task 3: Layout Values

**Files:**
- Create: `Sources/ConditionalsSwiftUI/ConditionalValues/Layout.swift`
- Create: `Tests/ConditionalsTests/SwiftUILayoutValueTests.swift`
- Modify: `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift`
- Modify: `Tests/ConditionalsTests/SwiftUIValueTests.swift`

**Interfaces:**
- Consumes: `ConditionalValue` and `ConditionKey<AlwaysTrue>`.
- Produces: strongly typed alignment, point, edge, axis, content-mode, and pinned-view selection.

- [ ] **Step 1: Write the failing layout tests**

Create `Tests/ConditionalsTests/SwiftUILayoutValueTests.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Layout Values")
struct SwiftUILayoutValueTests {
    @Test func layoutValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let alignment = Alignment.value(condition, .leading, else: .trailing)
        let horizontal = HorizontalAlignment.value(condition, .leading, else: .trailing)
        let vertical = VerticalAlignment.value(condition, .top, else: .bottom)
        let point = UnitPoint.value(condition, .topLeading, else: .bottomTrailing)
        let edge = Edge.value(condition, .top, else: .bottom)
        let edges = Edge.Set.value(condition, .horizontal, else: .vertical)
        let axis = Axis.value(condition, .horizontal, else: .vertical)
        let axes = Axis.Set.value(condition, .horizontal, else: .vertical)
        let contentMode = ContentMode.value(condition, .fit, else: .fill)
        let sizeClass = UserInterfaceSizeClass.value(condition, .regular, else: .compact)
        let layoutDirection = LayoutDirection.value(condition, .rightToLeft, else: .leftToRight)

        _ = alignment
        _ = horizontal
        _ = vertical
        _ = point
        _ = edge
        _ = edges
        _ = axis
        _ = axes
        _ = contentMode
        _ = sizeClass
        _ = layoutDirection
    }

    @Test func pinnedScrollableViewsCompileWhenAvailable() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
            let pinned = PinnedScrollableViews.value(
                ConditionKey<AlwaysTrue>(),
                .sectionHeaders,
                else: .sectionFooters
            )
            _ = pinned
        }
    }
}
#endif
```

- [ ] **Step 2: Verify the layout tests fail to compile**

Run:

```bash
swift test --filter SwiftUILayoutValueTests
```

Expected: compilation fails on `Alignment.value` or the next unsupported layout type.

- [ ] **Step 3: Add layout conformances and move existing declarations**

Create `Sources/ConditionalsSwiftUI/ConditionalValues/Layout.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Alignment: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension HorizontalAlignment: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension VerticalAlignment: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension UnitPoint: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Edge: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Edge.Set: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Axis: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Axis.Set: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension ContentMode: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension PinnedScrollableViews: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension UserInterfaceSizeClass: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension LayoutDirection: ConditionalValue {}
#endif
```

Remove `UserInterfaceSizeClass` and `LayoutDirection` conformance blocks from `ConditionalValue+SwiftUI.swift`. Remove their declarations and `_ =` lines from `SwiftUIValueTests.coreSwiftUIValuesCompile()`.

- [ ] **Step 4: Run focused and full tests**

```bash
swift test --filter SwiftUILayoutValueTests
swift test
```

Expected: both commands finish with zero failures.

- [ ] **Step 5: Commit layout support**

```bash
git add Sources/ConditionalsSwiftUI/ConditionalValues/Layout.swift Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift Tests/ConditionalsTests/SwiftUILayoutValueTests.swift Tests/ConditionalsTests/SwiftUIValueTests.swift
git commit -m "feat: add SwiftUI layout conditional values"
```

---

### Task 4: Rendering Values

**Files:**
- Create: `Sources/ConditionalsSwiftUI/ConditionalValues/Rendering.swift`
- Create: `Tests/ConditionalsTests/SwiftUIRenderingValueTests.swift`
- Modify: `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift`
- Modify: `Tests/ConditionalsTests/SwiftUIValueTests.swift`

**Interfaces:**
- Consumes: `ConditionalValue` selection.
- Produces: concrete rendering mode, fill, stroke, blend, image-scale, and corner-style selection.

- [ ] **Step 1: Write the failing rendering tests**

Create `Tests/ConditionalsTests/SwiftUIRenderingValueTests.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Rendering Values")
struct SwiftUIRenderingValueTests {
    @Test func renderingValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let blendMode = BlendMode.value(condition, .normal, else: .multiply)
        let fillStyle = FillStyle.value(
            condition,
            FillStyle(eoFill: false, antialiased: true),
            else: FillStyle(eoFill: true, antialiased: false)
        )
        let strokeStyle = StrokeStyle.value(
            condition,
            StrokeStyle(lineWidth: 1),
            else: StrokeStyle(lineWidth: 2)
        )
        let cornerStyle = RoundedCornerStyle.value(condition, .circular, else: .continuous)
        let symbolMode = SymbolRenderingMode.value(condition, .palette, else: .monochrome)
        let symbolVariants = SymbolVariants.value(condition, .fill, else: .none)

        _ = blendMode
        _ = fillStyle
        _ = strokeStyle
        _ = cornerStyle
        _ = symbolMode
        _ = symbolVariants
    }

    @Test func imageScaleCompilesWhenAvailable() {
        if #available(iOS 13.0, macCatalyst 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *) {
            let scale = Image.Scale.value(ConditionKey<AlwaysTrue>(), .small, else: .large)
            _ = scale
        }
    }
}
#endif
```

- [ ] **Step 2: Verify the rendering tests fail to compile**

Run:

```bash
swift test --filter SwiftUIRenderingValueTests
```

Expected: compilation fails on `BlendMode.value` or the next unsupported rendering type.

- [ ] **Step 3: Add rendering conformances and move existing declarations**

Create `Sources/ConditionalsSwiftUI/ConditionalValues/Rendering.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension BlendMode: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Image.Scale: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension FillStyle: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension StrokeStyle: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension RoundedCornerStyle: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension SymbolRenderingMode: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension SymbolVariants: ConditionalValue {}
#endif
```

Remove `SymbolRenderingMode` and `SymbolVariants` conformance blocks from `ConditionalValue+SwiftUI.swift`. Remove their declarations and `_ =` lines from `SwiftUIValueTests.coreSwiftUIValuesCompile()`.

- [ ] **Step 4: Run focused and full tests**

```bash
swift test --filter SwiftUIRenderingValueTests
swift test
```

Expected: both commands finish with zero failures.

- [ ] **Step 5: Commit rendering support**

```bash
git add Sources/ConditionalsSwiftUI/ConditionalValues/Rendering.swift Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift Tests/ConditionalsTests/SwiftUIRenderingValueTests.swift Tests/ConditionalsTests/SwiftUIValueTests.swift
git commit -m "feat: add SwiftUI rendering conditional values"
```

---

### Task 5: Behavior Values

**Files:**
- Create: `Sources/ConditionalsSwiftUI/ConditionalValues/Behavior.swift`
- Create: `Tests/ConditionalsTests/SwiftUIBehaviorValueTests.swift`
- Modify: `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift`
- Modify: `Tests/ConditionalsTests/SwiftUIValueTests.swift`

**Interfaces:**
- Consumes: `ConditionalValue` and the existing platform guard for `EditMode`.
- Produces: animation, redaction, scene, control-size, visibility, and edit-mode selection.

- [ ] **Step 1: Write the failing behavior tests**

Create `Tests/ConditionalsTests/SwiftUIBehaviorValueTests.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Behavior Values")
struct SwiftUIBehaviorValueTests {
    @Test func behaviorValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let animation = Animation.value(condition, .linear, else: .easeIn)
        let scenePhase = ScenePhase.value(condition, .active, else: .background)
        let controlSize = ControlSize.value(condition, .large, else: .mini)
        let visibility = Visibility.value(condition, .visible, else: .hidden)

        _ = animation
        _ = scenePhase
        _ = controlSize
        _ = visibility
    }

    @Test func redactionReasonsCompileWhenAvailable() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
            let reasons = RedactionReasons.value(
                ConditionKey<AlwaysTrue>(),
                .placeholder,
                else: []
            )
            _ = reasons
        }
    }

    #if os(iOS) || os(tvOS) || os(visionOS) || targetEnvironment(macCatalyst)
    @Test func editModeCompiles() {
        let editMode = EditMode.value(ConditionKey<AlwaysTrue>(), .active, else: .inactive)
        _ = editMode
    }
    #endif
}
#endif
```

- [ ] **Step 2: Verify the behavior tests fail to compile**

Run:

```bash
swift test --filter SwiftUIBehaviorValueTests
```

Expected: compilation fails because `Animation` and `RedactionReasons` lack `ConditionalValue`.

- [ ] **Step 3: Add behavior conformances and move existing declarations**

Create `Sources/ConditionalsSwiftUI/ConditionalValues/Behavior.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Animation: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension RedactionReasons: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension ScenePhase: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension ControlSize: ConditionalValue {}

@available(iOS 17.0, macCatalyst 17.0, macOS 14.0, tvOS 17.0, visionOS 1.0, watchOS 10.0, *)
extension Visibility: ConditionalValue {}

#if os(iOS) || os(tvOS) || os(visionOS) || targetEnvironment(macCatalyst)
@available(iOS 13.0, macCatalyst 13.0, tvOS 13.0, visionOS 1.0, *)
extension EditMode: ConditionalValue {}
#endif
#endif
```

Remove `ScenePhase`, `ControlSize`, `Visibility`, and guarded `EditMode` blocks from `ConditionalValue+SwiftUI.swift`. Remove the corresponding declarations, `_ =` lines, and now-empty `coreSwiftUIValuesCompile()` test from `SwiftUIValueTests.swift`; remove the old guarded `editModeSelectsThroughConditionalValueWhenAvailable()` test as well.

- [ ] **Step 4: Run focused and full tests**

```bash
swift test --filter SwiftUIBehaviorValueTests
swift test
```

Expected: both commands finish with zero failures.

- [ ] **Step 5: Commit behavior support**

```bash
git add Sources/ConditionalsSwiftUI/ConditionalValues/Behavior.swift Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift Tests/ConditionalsTests/SwiftUIBehaviorValueTests.swift Tests/ConditionalsTests/SwiftUIValueTests.swift
git commit -m "feat: add SwiftUI behavior conditional values"
```

---

### Task 6: Navigation and Presentation Reorganization

**Files:**
- Create: `Sources/ConditionalsSwiftUI/ConditionalValues/NavigationAndPresentation.swift`
- Create: `Tests/ConditionalsTests/SwiftUINavigationAndPresentationValueTests.swift`
- Delete: `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift`
- Delete: `Tests/ConditionalsTests/SwiftUIValueTests.swift`

**Interfaces:**
- Consumes: all existing navigation and presentation conformances unchanged.
- Produces: the final six-file source organization with no monolithic compatibility file.

- [ ] **Step 1: Establish the refactor baseline**

Run:

```bash
swift test
```

Expected: all suites pass before moving the final declarations.

- [ ] **Step 2: Move the remaining conformances**

Create `Sources/ConditionalsSwiftUI/ConditionalValues/NavigationAndPresentation.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension ToolbarItemPlacement: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, visionOS 1.0, *)
extension CommandGroupPlacement: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension ToolbarRole: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension NavigationSplitViewVisibility: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension PresentationDetent: ConditionalValue {}

@available(iOS 16.4, macCatalyst 16.4, macOS 13.3, tvOS 16.4, visionOS 1.0, watchOS 9.4, *)
extension PresentationBackgroundInteraction: ConditionalValue {}

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension TabPlacement: ConditionalValue {}
#endif
```

Delete `Sources/ConditionalsSwiftUI/ConditionalValue+SwiftUI.swift` after confirming it contains no other declarations.

- [ ] **Step 3: Move the final compile-smoke tests**

Create `Tests/ConditionalsTests/SwiftUINavigationAndPresentationValueTests.swift`:

```swift
#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Navigation and Presentation Values")
struct SwiftUINavigationAndPresentationValueTests {
    @Test func placementAndPresentationValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let toolbarPlacement = ToolbarItemPlacement.value(condition, .automatic, else: .automatic)
        let commandGroupPlacement = CommandGroupPlacement.value(condition, .toolbar, else: .sidebar)
        let toolbarRole = ToolbarRole.value(condition, .automatic, else: .automatic)
        let navigationVisibility = NavigationSplitViewVisibility.value(condition, .all, else: .detailOnly)
        let presentationDetent = PresentationDetent.value(condition, .large, else: .medium)
        let backgroundInteraction = PresentationBackgroundInteraction.value(
            condition,
            .enabled,
            else: .disabled
        )

        _ = toolbarPlacement
        _ = commandGroupPlacement
        _ = toolbarRole
        _ = navigationVisibility
        _ = presentationDetent
        _ = backgroundInteraction
    }

    @Test func tabPlacementCompilesWhenAvailable() {
        if #available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *) {
            let placement = TabPlacement.value(
                ConditionKey<AlwaysTrue>(),
                .pinned,
                else: .sidebarOnly
            )
            _ = placement
        }
    }
}
#endif
```

Delete `Tests/ConditionalsTests/SwiftUIValueTests.swift` after confirming all tests have moved to the six category test files.

- [ ] **Step 4: Verify the reorganized suite**

Run:

```bash
swift test --filter SwiftUINavigationAndPresentationValueTests
swift test
```

Expected: focused and full runs finish with zero failures.

- [ ] **Step 5: Verify structure and prohibited API**

Run:

```bash
rg --files Sources/ConditionalsSwiftUI/ConditionalValues Tests/ConditionalsTests
rg -n "AnyShapeStyle|extension Any" Sources/ConditionalsSwiftUI Tests/ConditionalsTests
git diff --check
```

Expected: six source category files and six matching value-test files exist; the prohibited API search returns no matches; `git diff --check` returns no output.

- [ ] **Step 6: Commit the final reorganization**

```bash
git add Sources/ConditionalsSwiftUI Tests/ConditionalsTests
git commit -m "refactor: organize SwiftUI conditional values"
```

---

## Final Verification

- [ ] Run the complete test suite:

```bash
swift test
```

Expected: all Swift Testing suites pass with zero failures.

- [ ] Build both library products:

```bash
swift build --product Conditionals
swift build --product ConditionalsSwiftUI
```

Expected: both builds finish successfully.

- [ ] Audit the final public surface and worktree:

```bash
rg -n "extension .*: ConditionalValue" Sources/ConditionalsSwiftUI/ConditionalValues
rg -n "AnyShapeStyle|extension Any" Sources/ConditionalsSwiftUI Tests/ConditionalsTests
git status --short
```

Expected: all conformances live under `ConditionalValues`; prohibited APIs are absent; only intentionally untracked user files such as `.swiftpm/` may remain.
