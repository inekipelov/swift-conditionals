/// Availability gate for macOS 13 and later.
public struct macOS13: Condition {
    /// Evaluates whether macOS 13 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 13.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 13 availability check.
public extension ConditionKey where C == macOS13 {
    static var macOS13: Self { Self() }
}
