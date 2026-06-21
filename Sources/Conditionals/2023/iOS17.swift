/// Availability gate for iOS 17 and later.
public struct iOS17: Condition {
    /// Evaluates whether iOS 17 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 17.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 17 availability check.
public extension ConditionKey where C == iOS17 {
    static var iOS17: Self { Self() }
}
