/// Availability gate for macOS 15 and later.
public struct macOS15: Condition {
    /// Evaluates whether macOS 15 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 15.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 15 availability check.
public extension ConditionKey where C == macOS15 {
    static var macOS15: Self { Self() }
}
