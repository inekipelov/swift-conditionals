/// Availability gate for watchOS.
public struct watchOS: Condition {
    /// Evaluates whether the code is running on watchOS.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        then()
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS platform check.
public extension ConditionKey where C == watchOS {
    static var watchOS: Self { Self() }
}
