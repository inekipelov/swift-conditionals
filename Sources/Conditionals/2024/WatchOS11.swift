/// Availability gate for watchOS 11 and later.
public struct WatchOS11: Condition {
    /// Evaluates whether watchOS 11 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 11.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 11 availability check.
public extension ConditionKey where C == WatchOS11 {
    static var watchOS11: Self { Self() }
}
