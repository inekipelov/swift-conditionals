/// Availability gate for the 2023 WWDC SDK baseline.
public struct WWDC23: Condition {
    /// Evaluates whether the 2023 baseline is available.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2023 WWDC availability check.
public extension ConditionKey where C == WWDC23 {
    static var wwdc23: Self { Self() }
}
