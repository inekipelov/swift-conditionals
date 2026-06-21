/// Availability gate for the 2024 WWDC SDK baseline.
public struct WWDC24: Condition {
    /// Evaluates whether the 2024 baseline is available.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2024 WWDC availability check.
public extension ConditionKey where C == WWDC24 {
    static var wwdc24: Self { Self() }
}
