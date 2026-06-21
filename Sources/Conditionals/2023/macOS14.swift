/// Availability gate for macOS 14 and later.
public struct macOS14: Condition {
    /// Evaluates whether macOS 14 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 14.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 14 availability check.
public extension ConditionKey where C == macOS14 {
    static var macOS14: Self { Self() }
}
