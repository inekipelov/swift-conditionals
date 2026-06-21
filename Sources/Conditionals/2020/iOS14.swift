/// Availability gate for iOS 14 and later.
public struct iOS14: Condition {
    /// Evaluates whether iOS 14 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 14.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 14 availability check.
public extension ConditionKey where C == iOS14 {
    static var iOS14: Self { Self() }
}
