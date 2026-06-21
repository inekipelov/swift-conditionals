/// Availability gate for macOS 11 and later.
public struct macOS11: Condition {
    /// Evaluates whether macOS 11 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 11.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 11 availability check.
public extension ConditionKey where C == macOS11 {
    static var macOS11: Self { Self() }
}
