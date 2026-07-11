/// Availability gate for watchOS 9 and later.
public struct WatchOS9: Condition {
    /// Evaluates whether watchOS 9 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 9.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the watchOS 9 availability check.
public extension ConditionKey where C == WatchOS9 {
    static var watchOS9: Self { Self() }
}
