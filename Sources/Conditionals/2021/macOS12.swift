/// Availability gate for macOS 12 and later.
public struct macOS12: Condition {
    /// Evaluates whether macOS 12 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 12.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 12 availability check.
public extension ConditionKey where C == macOS12 {
    static var macOS12: Self { Self() }
}
