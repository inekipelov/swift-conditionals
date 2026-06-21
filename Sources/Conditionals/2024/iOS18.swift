/// Availability gate for iOS 18 and later.
public struct iOS18: Condition {
    /// Evaluates whether iOS 18 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 18.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 18 availability check.
public extension ConditionKey where C == iOS18 {
    static var iOS18: Self { Self() }
}
