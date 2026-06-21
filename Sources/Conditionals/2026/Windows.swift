/// Availability gate for Windows.
public struct Windows: Condition {
    /// Evaluates whether the code is running on Windows.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(Windows)
        then()
        #else
        `else`()
        #endif
    }
}

/// A key for the Windows platform check.
public extension ConditionKey where C == Windows {
    static var windows: Self { Self() }
}
