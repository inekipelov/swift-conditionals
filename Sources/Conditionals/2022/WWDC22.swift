/// Availability gate for the 2022 WWDC SDK baseline.
public struct WWDC22: Condition {
    /// Evaluates whether the 2022 baseline is available.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2022 WWDC availability check.
public extension ConditionKey where C == WWDC22 {
    static var wwdc22: Self { Self() }
}
