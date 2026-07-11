/// Availability gate for macOS 10.15 and later.
public struct macOS10_15: Condition {
    /// Evaluates whether macOS 10.15 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 10.15, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 10.15 availability check.
public extension ConditionKey where C == macOS10_15 {
    static var macOS10_15: Self { Self() }
}
