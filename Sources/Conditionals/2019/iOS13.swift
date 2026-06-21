/// Availability gate for iOS 13 and later.
public struct iOS13: Condition {
    /// Evaluates whether iOS 13 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 13.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 13 availability check.
public extension ConditionKey where C == iOS13 {
    static var iOS13: Self { Self() }
}
