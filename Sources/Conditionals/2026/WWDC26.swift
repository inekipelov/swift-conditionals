/// Availability gate for the 2026 WWDC SDK baseline.
public struct WWDC26: Condition {
    /// Evaluates whether the 2026 baseline is available.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2026 WWDC availability check.
public extension ConditionKey where C == WWDC26 {
    static var wwdc26: Self { Self() }
}
