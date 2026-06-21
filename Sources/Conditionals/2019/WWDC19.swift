/// Availability gate for the 2019 WWDC SDK baseline.
public struct WWDC19: Condition {
    /// Evaluates whether the 2019 baseline is available.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

/// A key for the 2019 WWDC availability check.
public extension ConditionKey where C == WWDC19 {
    static var wwdc19: Self { Self() }
}
