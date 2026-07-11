/// Availability gate for watchOS 26 and later.
public struct WatchOS26: Condition {
    /// Evaluates whether watchOS 26 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 26 availability check.
public extension ConditionKey where C == WatchOS26 {
    static var watchOS26: Self { Self() }
}
