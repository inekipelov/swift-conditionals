/// Availability gate for iOS 15 and later.
public struct iOS15: Condition {
    /// Evaluates whether iOS 15 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 15.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 15 availability check.
public extension ConditionKey where C == iOS15 {
    static var iOS15: Self { Self() }
}
