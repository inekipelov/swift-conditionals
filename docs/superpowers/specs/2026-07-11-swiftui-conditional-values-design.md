# Расширение SwiftUI ConditionalValue

## Цель

Расширить `ConditionalsSwiftUI` на основные конкретные value-типы SwiftUI,
сохранив единый type-centric синтаксис и строгую типизацию обеих веток.

```swift
Color.value(.iOS26, .blue, else: .cyan)
Font.value(.iPad, .title, else: .body)
Material.value(.visionOS, .thin, else: .regular)
```

Каждый вызов возвращает `Self`. Значения `then` и `else` обязаны иметь один
конкретный тип.

## Принципы API

- Использовать существующий `ConditionalValue` без новых методов выбора.
- Добавлять явные conformance только конкретным публичным SwiftUI value-типам.
- Не использовать type erasure, включая `AnyShapeStyle` и другие `Any*`-типы.
- Не добавлять overloads, выбирающие между разными реализациями `ShapeStyle`.
- Не превращать runtime-значения окружения, например dark mode, в статические
  `Condition`.
- Сохранять точную availability каждого SwiftUI-типа на всех поддерживаемых
  платформах.

`Color` остается context-dependent значением SwiftUI. Condition выбирает один
из двух объектов `Color`, а разрешение light/dark-варианта выполняет SwiftUI при
отрисовке.

## Поддерживаемые типы

### Appearance

- `Color`
- `Gradient`
- `LinearGradient`
- `RadialGradient`
- `AngularGradient`
- `EllipticalGradient`
- `Material`
- существующие `ColorScheme`, `ColorSchemeContrast`, `LegibilityWeight`

### Typography

- `Font`
- `Font.Design`
- `Font.Weight`
- `Font.TextStyle`
- `Font.Leading`
- `Font.Width`
- `TextAlignment`
- `Text.TruncationMode`
- существующие `DynamicTypeSize`, `SubmitLabel`

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
- существующие `LayoutDirection`, `UserInterfaceSizeClass`

### Rendering

- `BlendMode`
- `Image.Scale`
- `FillStyle`
- `StrokeStyle`
- `RoundedCornerStyle`
- существующие `SymbolRenderingMode`, `SymbolVariants`

### Behavior

- `Animation`
- `RedactionReasons`
- существующие `ScenePhase`, `ControlSize`, `EditMode`, `Visibility`

### Navigation and presentation

- существующие `ToolbarItemPlacement`, `CommandGroupPlacement`, `ToolbarRole`
- существующие `NavigationSplitViewVisibility`, `PresentationDetent`
- существующие `PresentationBackgroundInteraction`, `TabPlacement`

Перед реализацией каждый новый тип проверяется по текущему SwiftUI SDK. Тип
исключается, если он недоступен как публичный concrete type или требует type
erasure для согласования веток.

## Организация исходников

Текущий монолитный `ConditionalValue+SwiftUI.swift` разделяется по назначению:

```text
Sources/ConditionalsSwiftUI/ConditionalValues/
|-- Appearance.swift
|-- Typography.swift
|-- Layout.swift
|-- Rendering.swift
|-- Behavior.swift
`-- NavigationAndPresentation.swift
```

Каждый файл содержит только `import SwiftUI`, availability-аннотации и
`ConditionalValue`-conformance. Логика выбора остается единственной в модуле
`Conditionals`.

## Поток данных

1. Клиент вызывает `SomeSwiftUIType.value(condition, then, else:)`.
2. Реализация `ConditionalValue` передает обе ветки в `ConditionKey`.
3. `ConditionKey` вычисляет статический `Condition` и возвращает значение того
   же конкретного типа.
4. SwiftUI получает обычное значение без wrapper-типа и type erasure.

## Ошибки и ограничения

- Несовпадающие типы веток должны завершаться compile-time ошибкой.
- Environment-dependent состояния не поддерживаются как `ConditionKey`, потому
  что текущий `Condition` не получает `EnvironmentValues`.
- Availability новых conformance не должна поднимать минимальные версии всего
  пакета.
- README сохраняет текущий единственный usage-пример; новая поверхность API не
  требует отдельного специализированного синтаксиса.

## Тестирование

- Разделить SwiftUI value compile-smoke тесты по тем же категориям, что и
  исходники.
- Для каждого нового типа скомпилировать вызов `.value(...)` с обеими ветками
  одного типа.
- Добавить проверки выбора ветки для `Color`, так как `Color` поддерживает
  сравнение.
- Для API с более высокой availability использовать `#available` и те же
  platform guards, что и в исходниках.
- Выполнить `swift test`; существующие core- и builder-тесты должны пройти без
  изменений поведения.

## Критерии готовности

- Все перечисленные и доступные в SDK concrete-типы поддерживают `.value(...)`.
- В публичном API отсутствуют новые type-erased wrapper-типы.
- Структура файлов отражает назначение типов.
- Все тесты пакета проходят на Swift 6.
