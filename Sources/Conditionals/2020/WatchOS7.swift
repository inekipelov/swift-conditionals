/// Availability gate for watchOS 7 and later.
public struct WatchOS7: Condition {
    /// Evaluates whether watchOS 7 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 7.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 7 availability check.
public extension ConditionKey where C == WatchOS7 {
    static var watchOS7: Self { Self() }
}
