/// Availability gate for tvOS 13 and later.
public struct TVOS13: Condition {
    /// Evaluates whether tvOS 13 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 13.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 13 availability check.
public extension ConditionKey where C == TVOS13 {
    static var tvOS13: Self { Self() }
}
