/// Availability gate for iOS 26 and later.
public struct iOS26: Condition {
    /// Evaluates whether iOS 26 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 26 availability check.
public extension ConditionKey where C == iOS26 {
    static var iOS26: Self { Self() }
}
