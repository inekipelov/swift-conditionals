/// Availability gate for iOS.
public struct iOS: Condition {
    /// Evaluates whether the code is running on iOS.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        then()
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS platform check.
public extension ConditionKey where C == iOS {
    static var iOS: Self { Self() }
}
