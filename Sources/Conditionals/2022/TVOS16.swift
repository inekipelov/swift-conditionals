/// Availability gate for tvOS 16 and later.
public struct TVOS16: Condition {
    /// Evaluates whether tvOS 16 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 16.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 16 availability check.
public extension ConditionKey where C == TVOS16 {
    static var tvOS16: Self { Self() }
}
