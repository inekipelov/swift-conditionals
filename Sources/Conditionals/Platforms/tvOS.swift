/// Availability gate for tvOS.
public struct tvOS: Condition {
    /// Evaluates whether the code is running on tvOS.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        then()
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS platform check.
public extension ConditionKey where C == tvOS {
    static var tvOS: Self { Self() }
}
