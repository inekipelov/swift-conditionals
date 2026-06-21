/// Availability gate for tvOS 26 and later.
public struct TVOS26: Condition {
    /// Evaluates whether tvOS 26 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 26 availability check.
public extension ConditionKey where C == TVOS26 {
    static var tvOS26: Self { Self() }
}
