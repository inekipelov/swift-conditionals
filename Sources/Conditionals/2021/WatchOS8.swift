/// Availability gate for watchOS 8 and later.
public struct WatchOS8: Condition {
    /// Evaluates whether watchOS 8 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 8.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 8 availability check.
public extension ConditionKey where C == WatchOS8 {
    static var watchOS8: Self { Self() }
}
