# swift-conditionals
A strongly typed conditional pattern for Swift values and SwiftUI views.

## Minimum Supported Swift

This package targets Swift 6.

## Limitation

`Conditionals` selects between branches, but it does not replace lexical `if #available` when a branch uses SDK-only symbols that the compiler must see inside an availability boundary.

Safe:

```swift
content.conditional(.not(.wwdc25)) {
    $0.frame(maxWidth: .infinity)
}
```

Potentially unsafe for new SDK-only APIs:

```swift
content.conditional(.wwdc25) {
    $0.glassEffect()
}
```
