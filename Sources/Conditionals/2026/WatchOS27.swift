/// Availability gate for watchOS 27 and later.
public struct WatchOS27: Condition {
    /// Evaluates whether watchOS 27 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 27.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 27 availability check.
public extension ConditionKey where C == WatchOS27 {
    static var watchOS27: Self { Self() }
}
