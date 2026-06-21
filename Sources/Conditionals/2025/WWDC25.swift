/// Availability gate for the 2025 WWDC SDK baseline.
public struct WWDC25: Condition {
    /// Evaluates whether the 2025 baseline is available.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2025 WWDC availability check.
public extension ConditionKey where C == WWDC25 {
    static var wwdc25: Self { Self() }
}
