/// Availability gate for iOS 27 and later.
public struct iOS27: Condition {
    /// Evaluates whether iOS 27 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 27.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iOS 27 availability check.
public extension ConditionKey where C == iOS27 {
    static var iOS27: Self { Self() }
}
