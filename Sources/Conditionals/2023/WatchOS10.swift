/// Availability gate for watchOS 10 and later.
public struct WatchOS10: Condition {
    /// Evaluates whether watchOS 10 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 10.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 10 availability check.
public extension ConditionKey where C == WatchOS10 {
    static var watchOS10: Self { Self() }
}
