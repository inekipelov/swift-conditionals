/// Availability gate for macOS 26 and later.
public struct macOS26: Condition {
    /// Evaluates whether macOS 26 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 26 availability check.
public extension ConditionKey where C == macOS26 {
    static var macOS26: Self { Self() }
}
