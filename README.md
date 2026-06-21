# Conditionals

`Conditionals` is a Swift Package that provides typed availability checks
and branch selection for Swift values and SwiftUI views.

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

let condition = ConditionKey.anyOf(.wwdc25, .wwdc26)
let title = String.value(.not(condition), "Legacy", else: "Modern")
let enabled = ConditionKey.allOf(.iOS18, .macOS15).isSatisfied
```

```swift
import ConditionalsSwiftUI

content
    .conditional(.wwdc25) {
        $0.frame(maxWidth: .infinity)
    } else: {
        $0.padding()
    }
```

## Installation

```swift
.package(url: "https://github.com/inekipelov/swift-conditionals.git", from: "0.1.0")
```

## See also
* [Aeastr/Conditionals](https://github.com/Aeastr/Conditionals)
