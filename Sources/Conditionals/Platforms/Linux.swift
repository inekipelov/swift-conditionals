/// Availability gate for Linux.
public struct Linux: Condition {
    /// Evaluates whether the code is running on Linux.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(Linux)
        then()
        #else
        `else`()
        #endif
    }
}

/// A key for the Linux platform check.
public extension ConditionKey where C == Linux {
    static var linux: Self { Self() }
}
