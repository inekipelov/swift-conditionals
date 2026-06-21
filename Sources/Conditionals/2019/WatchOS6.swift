/// Availability gate for watchOS 6 and later.
public struct WatchOS6: Condition {
    /// Evaluates whether watchOS 6 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 6.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 6 availability check.
public extension ConditionKey where C == WatchOS6 {
    static var watchOS6: Self { Self() }
}
