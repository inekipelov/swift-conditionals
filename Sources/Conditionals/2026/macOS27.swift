/// Availability gate for macOS 27 and later.
public struct macOS27: Condition {
    /// Evaluates whether macOS 27 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 27.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the macOS 27 availability check.
public extension ConditionKey where C == macOS27 {
    static var macOS27: Self { Self() }
}
