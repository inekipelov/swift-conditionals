/// Availability gate for macOS.
public struct macOS: Condition {
    /// Evaluates whether the code is running on macOS.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        then()
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS platform check.
public extension ConditionKey where C == macOS {
    static var macOS: Self { Self() }
}
