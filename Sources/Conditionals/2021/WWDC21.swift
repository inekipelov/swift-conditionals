/// Availability gate for the 2021 WWDC SDK baseline.
public struct WWDC21: Condition {
    /// Evaluates whether the 2021 baseline is available.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2021 WWDC availability check.
public extension ConditionKey where C == WWDC21 {
    static var wwdc21: Self { Self() }
}
