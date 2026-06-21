# Conditionals

`Conditionals` is a tiny Swift Package that provides typed availability checks
and branch selection for Swift values and SwiftUI views.

It is a general-purpose conditional engine, not a backport wrapper. The package
focuses on `Condition`, `ConditionKey`, `ConditionalValue`, and a small
SwiftUI helper layer.

<p align="center">
  <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-6.0+-F05138?logo=swift&logoColor=white" alt="Swift 6.0+"></a>
  <a href="https://developer.apple.com/ios/"><img src="https://img.shields.io/badge/iOS-13.0+-CAFC63?logo=apple" alt="iOS 13.0+"></a>
  <a href="https://developer.apple.com/macos/"><img src="https://img.shields.io/badge/macOS-10.15+-CAFC63?logo=apple" alt="macOS 10.15+"></a>
  <a href="https://developer.apple.com/tvos/"><img src="https://img.shields.io/badge/tvOS-13.0+-CAFC63?logo=apple" alt="tvOS 13.0+"></a>
  <a href="https://developer.apple.com/watchos/"><img src="https://img.shields.io/badge/watchOS-6.0+-CAFC63?logo=apple" alt="watchOS 6.0+"></a>
  <a href="https://developer.apple.com/visionos/"><img src="https://img.shields.io/badge/visionOS-1.0+-CAFC63?logo=apple" alt="visionOS 1.0+"></a>
</p>

## Usage

```swift
import Conditionals

let condition = ConditionKey<WWDC25>.wwdc25

if condition.isSatisfied {
    print("available")
}
```

Select values without manual branching:

```swift
let title = String.value(.wwdc25, "New API", else: "Fallback")
let count = Int.value(.not(.wwdc25), 0, else: 1)
```

Compose conditions:

```swift
let anyNewPlatform = ConditionKey.anyOf(.wwdc24, .wwdc25)
let allModernPlatforms = ConditionKey.allOf(.iOS18, .macOS15)
```

SwiftUI helpers live in the separate `ConditionalsSwiftUI` product:

```swift
import ConditionalsSwiftUI

content
    .conditional(.wwdc25) {
        $0.frame(maxWidth: .infinity)
    }
```

`ConditionalsSwiftUI` re-exports `Conditionals`, so importing the SwiftUI
module is enough when you need both layers.

## Availability Caveat

`Conditionals` chooses between branches at runtime. It does not replace lexical
`if #available` when a branch uses SDK-only symbols that the compiler must see
inside an availability boundary.

Safe:

```swift
content.conditional(.not(.wwdc25)) {
    $0.frame(maxWidth: .infinity)
}
```

Potentially unsafe:

```swift
content.conditional(.wwdc25) {
    $0.glassEffect()
}
```

## Installation

Add the package to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/inekipelov/swift-conditionals.git", branch: "main")
```

Then add `Conditionals` or `ConditionalsSwiftUI` to your target dependencies:

```swift
.product(name: "Conditionals", package: "swift-conditionals")
```

```swift
.product(name: "ConditionalsSwiftUI", package: "swift-conditionals")
```

## Presets

The package includes yearly presets from 2019 through 2026 for:

- WWDC baselines
- iOS
- macOS
- tvOS
- watchOS
- visionOS

