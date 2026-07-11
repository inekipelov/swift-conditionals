# DocC-покрытие публичного API

## Цель

Сделать публичный API `Conditionals` и `ConditionalsSwiftUI` понятным из Quick Help и сгенерированного DocC-каталога без чтения реализации. Документация должна объяснять не только назначение символов, но и важную семантику: ленивое вычисление веток, short-circuit композиций, availability и платформенные ограничения.

## Область работ

Документируется каждый публичный символ в `Sources/Conditionals` и `Sources/ConditionalsSwiftUI`:

- протоколы, структуры, перечисления и associated requirements;
- инициализаторы, свойства, методы и фабрики `ConditionKey`;
- композиции `allOf`, `anyOf` и `not`;
- платформенные, версионные, WWDC- и extension-point conditions;
- SwiftUI builder extensions и view modifiers;
- публичные `ConditionalValue` conformances стандартной библиотеки и SwiftUI.

Internal helper-типы и детали реализации не входят в публичный каталог.

## Стиль комментариев

### Core API

Для `Condition`, `ConditionKey`, `ConditionalValue`, композиций и SwiftUI modifiers используются расширенные комментарии:

- краткий summary в первой строке;
- пояснение поведения и момента вычисления;
- небольшой компилируемый пример для основных точек входа;
- `- Parameters:` и `- Returns:` для функций;
- `> Important:` или `> Note:` только для существенных ограничений;
- явное описание short-circuit и того, что невыбранная ветка не вычисляется.

Имена параметров в документации должны совпадать с сигнатурами. Примеры используют существующий синтаксический сахар библиотеки и не вводят вымышленные API.

### Повторяющиеся conditions

Платформенные и версионные типы получают компактный, но полный шаблон:

- что именно проверяется;
- когда выбирается `then` и когда `else`;
- описание статического ключа `ConditionKey`;
- для `perform` — параметры и возвращаемое значение.

Одинаковые формулировки допустимы для поколений API, если различаются корректные названия платформ и версии. Примеры на каждом таком типе не добавляются, чтобы каталог не был перегружен дублированием.

### ConditionalValue conformances

Каждое conformance получает однострочное описание возможности выбирать значение через `ConditionalValue.value`. Availability остается источником информации о минимальной версии и не дублируется текстом.

## Структура DocC

Для каждого library product создается DocC catalog:

- landing page с назначением модуля и минимальным примером;
- topic groups для core API, compositions, platforms, SDK generations, extensions и SwiftUI integration;
- ссылки между связанными символами через DocC symbol links;
- отдельные conceptual pages только там, где inline-комментария недостаточно: композиция conditions и SwiftUI integration.

Каталог `ConditionalsSwiftUI` явно указывает, что модуль re-export `Conditionals` и требует SwiftUI, но не дублирует документацию core API.

## Проверка

Готовность подтверждается следующими проверками:

- symbol graph не содержит публичных declarations без documentation comments;
- `swift package generate-documentation` или эквивалентный `xcodebuild docbuild` завершается без DocC warnings;
- примеры используют существующие публичные сигнатуры;
- `swift test -Xswiftc -warnings-as-errors` проходит;
- iOS, tvOS и watchOS compile matrix продолжает собираться с `-warnings-as-errors`;
- `git diff --check` не находит formatting defects.

Если локальный toolchain не содержит DocC plugin, это фиксируется как ограничение, а symbol graph и Swift build остаются обязательными проверками.

## Ограничения

- Документация пишется на английском, чтобы соответствовать именованию API и README репозитория.
- Публичные сигнатуры и runtime-семантика не меняются.
- Отдельный hosted documentation deployment не добавляется в этом проходе.
- Документация Apple API не копируется; используются symbol links и краткое описание роли conformances.
