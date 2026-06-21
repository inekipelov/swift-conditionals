/// Availability gate for the 2020 WWDC SDK baseline.
public struct WWDC20: Condition {
    /// Evaluates whether the 2020 baseline is available.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2020 WWDC availability check.
public extension ConditionKey where C == WWDC20 {
    static var wwdc20: Self { Self() }
}
