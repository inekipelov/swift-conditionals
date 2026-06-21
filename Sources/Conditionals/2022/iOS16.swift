/// Availability gate for iOS 16 and later.
public struct iOS16: Condition {
    /// Evaluates whether iOS 16 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 16.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 16 availability check.
public extension ConditionKey where C == iOS16 {
    static var iOS16: Self { Self() }
}
